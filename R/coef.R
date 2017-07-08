#' @export
coef.mb_null_analysis <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  dplyr::data_frame(term = as.term(character(0)),
                    estimate = numeric(0), sd = numeric(0),
                    zscore = numeric(0), lower = numeric(0),
                    upper = numeric(0), pvalue = numeric(0))
}

#' Coef JAGS Analysis
#'
#' Coefficients for a JAGS analysis.
#'
#' The \code{zscore} is mean / sd.
#'
#' @param object The mb_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef.mb_analysis <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  parameters <- parameters(object, param_type)

  object %<>%
    as.mcmcr() %>%
    subset(parameters = parameters) %>%
    coef()

  if (!include_constant) object %<>% dplyr::filter_(~lower != upper)

  object
}

#' Coef List
#'
#' Coefficients for fixed parameters from an ML based
#' MB analyses averaged by AICc weights.
#'
#' @param object A list of mb_analysis objects.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.list <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, n = NULL, ...) {
  .Deprecated("coef.mb_analyses")
  class(object) <- "mb_analyses"
  coef(object, param_type = param_type, include_constant = include_constant,
       conf_level = conf_level, n = n, ...)
}

#' Coef TMB Analyses
#'
#' Coefficients for fixed parameters from an ML based
#' MB analyses averaged by AICc weights.
#'
#' @param object The mb_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.mb_analyses <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, n = NULL, ...) {
  aicc <- AICc(object, n = n)
  coef <- llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level)

  coef <- coef[is.finite(aicc$AICc)]
  aicc <- aicc[is.finite(aicc$AICc),,drop = FALSE]

  nmodels <- length(coef)
  if (!nmodels) {
    return(dplyr::data_frame(term = as.term(character(0)), estimate = numeric(0),
                             lower = numeric(0), upper = numeric(0), nmodels = integer(0), proportion = numeric(0), AICcWt = numeric(0)))
  }

  suppressWarnings(coef %<>% purrr::map2_df(aicc$AICcWt, function(x, y) {x$AICcWt <- y; x}))
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * AICcWt), lower = ~sum(lower * AICcWt),
    upper = ~sum(upper * AICcWt), nmodels = ~nmodels, proportion = ~n()/nmodels, AICcWt = ~min(sum(AICcWt), 1.00)) %>% dplyr::ungroup()
  coef$term %<>% as.term()
  coef <- coef[order(coef$term),]
  coef
}

#' Coef LMB Analysis
#'
#' Coefficients for a LMB analysis.
#'
#' The (95\%) \code{lower} and \code{upper} confidence intervals are
#' the \code{estimate} +/- 1.96 * \code{std.error}.
#'
#' @param object The mb_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef.lmb_analysis <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  if (param_type %in% c("primary", "all")) {
    coef <- c("fixed", "random")
    if (param_type == "all") coef %<>% c("derived")

    coef %<>%
      purrr::map_df(coef_arg2to1, object = object, include_constant = include_constant,
                 conf_level = conf_level, ...)
    coef$term %<>% as.term()
    coef <- coef[order(coef$term),]
    return(coef)
  }

  # random and derived parameters are not defined for lm models
  if (param_type %in% c("random", "derived")) {
    return(dplyr::data_frame(
      term = as.term(character(0)), estimate = numeric(0), sd = numeric(0),
      zscore = numeric(0), lower = numeric(0),
      upper = numeric(0), pvalue = numeric(0)))
  }

  lm <- object$lm

  coef <- summary(lm)$coefficients %>%
    as.data.frame()

  coef$term <- as.term(rownames(coef))
  coef %<>% dplyr::select_(~term, estimate = ~Estimate,
                           sd = ~`Std. Error`, zscore = ~`t value`,
                           pvalue = ~`Pr(>|t|)`) %>%
    dplyr::mutate_(zscore = ~estimate/sd)

  confint <- stats::confint(lm, level = conf_level) %>%
    as.data.frame()

  colnames(confint) <- c("lower", "upper")
  confint$term <- as.term(rownames(confint))

  coef %<>% dplyr::inner_join(confint, by = "term") %>%
    dplyr::select_(~term, ~estimate, ~sd, ~zscore, ~lower, ~upper, ~pvalue) %>%
    dplyr::as.tbl()
  coef <- coef[order(coef$term),]
  coef
}
