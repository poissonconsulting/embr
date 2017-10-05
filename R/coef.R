#' @export
coef.mb_null_analysis <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  coef <- dplyr::data_frame(term = as.term(character(0)),
                            estimate = numeric(0), sd = numeric(0),
                            zscore = numeric(0), lower = numeric(0),
                            upper = numeric(0), pvalue = numeric(0))

  class(coef) %<>% c("mb_analysis_coef", .)
  coef
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

  if (!length(parameters)) {
    coef <- dplyr::data_frame(term = as.term(character(0)),
                              estimate = numeric(0), sd = numeric(0),
                              zscore = numeric(0), lower = numeric(0),
                              upper = numeric(0), pvalue = numeric(0))
    class(coef) %<>% c("mb_analysis_coef", .)
    return(coef)
  }

  coef <- as.mcmcr(object) %>%
    subset(parameters = parameters) %>%
    coef()

  if (niters(object) == 1) {
    sd <- as.mcmcr(object$sd) %>%
      subset(parameters = parameters) %>%
      coef()

    coef$sd <- sd$estimate

    coef %<>% dplyr::mutate_(
      zscore = ~estimate/sd,
      lower = ~estimate + sd * qnorm((1 - conf_level) / 2),
      upper = ~estimate + sd * qnorm((1 - conf_level) / 2 + conf_level),
      pvalue = ~2*pnorm(-abs(zscore)))
  }

  if (!include_constant) coef %<>% dplyr::filter_(~lower != upper)

  class(coef) %<>% c("mb_analysis_coef", .)
  coef
}

#' Coef TMB Analyses
#'
#' Coefficients for fixed parameters from an ML based
#' MB analyses averaged by IC weights.
#'
#' @param object The mb_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.mb_analyses <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  ic <- IC(object)
  coef <- llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level)

  coef <- coef[is.finite(ic$IC)]
  ic <- ic[is.finite(ic$IC),,drop = FALSE]

  nmodels <- length(coef)
  if (!nmodels) {
    coef <- dplyr::data_frame(
      term = as.term(character(0)), estimate = numeric(0),
      lower = numeric(0), upper = numeric(0), nmodels = integer(0),
      proportion = numeric(0), ICWt = numeric(0))
    class(coef) %<>% c("mb_analyses_coef", .)
    return(coef)
  }

  suppressWarnings(coef %<>% purrr::map2_df(ic$ICWt, function(x, y) {x$ICWt <- y; x}))
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * ICWt), lower = ~sum(lower * ICWt),
    upper = ~sum(upper * ICWt), nmodels = ~nmodels, proportion = ~n()/nmodels, ICWt = ~min(sum(ICWt), 1.00)) %>%
    dplyr::ungroup()
  coef$term %<>% as.term()
  coef <- coef[order(coef$term),]
  class(coef) %<>% c("mb_analyses_coef", .)
  coef
}

#' Coef TMB Meta Analysis
#'
#' @param object The mb_meta_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analysis <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, ...)
}

#' Coef TMB Meta Analyses
#'
#' @param object The mb_meta_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analyses <- function(object, param_type = "fixed", include_constant = TRUE, conf_level = 0.95, ...) {
  llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, ...)
}
