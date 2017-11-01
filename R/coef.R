get_frequentist_coef <- function(object, conf_level = 0.95) {
  object %<>% dplyr::mutate_(
    zscore = ~estimate/sd,
    lower = ~estimate + sd * qnorm((1 - conf_level) / 2),
    upper = ~estimate + sd * qnorm((1 - conf_level) / 2 + conf_level),
    pvalue = ~2*pnorm(-abs(zscore)))
  object
}

#' @export
coef.mb_null_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                  conf_level = getOption("mb.conf_level", 0.95),
                                  estimate = getOption("mb.estimate", median),
                                  profile = getOption("mb.profile", FALSE), ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  coef <- dplyr::data_frame(term = as.term(character(0)),
                            estimate = numeric(0), sd = numeric(0))

  coef %<>% get_frequentist_coef()

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
#' @param estimate The function to use to calculating the estimate for Bayesian models.
#' @param profile A flag indicating whethe to use likelihood profiling as opposed to the Wald approximation when calculating confidence intervals for the frequentist models.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef.mb_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                             conf_level = getOption("mb.conf_level", 0.95),
                             estimate = getOption("mb.estimate", median),
                             profile = getOption("mb.profile", FALSE), ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))
  check_flag(profile)

  parameters <- parameters(object, param_type)

  if (!length(parameters)) {
    coef <- dplyr::data_frame(term = as.term(character(0)),
                              estimate = numeric(0),
                              sd = numeric(0))

    coef %<>% get_frequentist_coef()

    class(coef) %<>% c("mb_analysis_coef", .)
    return(coef)
  }

  if (is_bayesian(object)) {
    coef <- as.mcmcr(object) %>%
      subset(parameters = parameters) %>%
      coef(estimate = estimate)
  } else {
    coef <- as.mcmcr(object) %>%
      subset(parameters = parameters) %>%
      coef()

    sd <- as.mcmcr(object$sd) %>%
      subset(parameters = parameters) %>%
      coef()

    coef$sd <- sd$estimate

    coef %<>% get_frequentist_coef(conf_level = conf_level)

    if(profile) {
      prof <- profile_coef(object, conf_level = conf_level)
    }
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
#' @param estimate The function to use to calculate the estimate for Bayesian models.
#' @param profile A flag indicating whethe to use likelihood profiling as opposed to the Wald approximation when calculating confidence intervals for the frequentist models.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.mb_analyses <- function(object, param_type = "fixed", include_constant = TRUE,
                             conf_level = getOption("mb.conf_level", 0.95),
                             estimate = getOption("mb.estimate", median),
                             profile = getOption("mb.profile", FALSE), ...) {
  ic <- IC(object)
  coef <- llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level)

  coef <- coef[is.finite(ic$IC)]
  ic <- ic[is.finite(ic$IC),,drop = FALSE]

  nmodels <- length(coef)
  if (!nmodels) {
    coef <- dplyr::data_frame(
      term = as.term(character(0)),
      estimate = numeric(0))

    if(is_frequentist(object)) {
      coef %<>%
        dplyr::mutate(sd = UQ(parse_quosure("numeric(0)"))) %>%
        get_frequentist_coef()
    }
    coef %<>% dplyr::mutate_(
      nmodels = ~integer(0),
      proportion = ~numeric(0),
      ICWt = ~numeric(0))
    class(coef) %<>% c("mb_analyses_coef", .)
    return(coef)
  }

  suppressWarnings(coef %<>% purrr::map2_df(ic$model, function(x, y) {x$model <- y; x}))

  coef %<>%
    dplyr::mutate(.IN = UQ(parse_quosure("1"))) %>%
    tidyr::complete(UQ(parse_quosure("term")), UQ(parse_quosure("model")), fill = list(estimate = 0, sd = 0, .IN = 0))  %>%
    dplyr::inner_join(dplyr::select(ic, UQ(parse_quosure("model")), UQ(parse_quosure("ICWt"))), by = "model") %>%
    dplyr::mutate_(coef = UQ(parse_quosure("estimate")),
                   var = UQ(parse_quosure("pow(sd,2)"))) %>%
    dplyr::group_by(UQ(parse_quosure("term"))) %>%
    dplyr::summarise(
      estimate = UQ(parse_quosure("sum(ICWt * estimate)")),
      sd = UQ(parse_quosure("sqrt(sum(ICWt * (var + pow(coef - estimate, 2))))")),
      nmodels = UQ(parse_quosure("nmodels")),
      proportion = UQ(parse_quosure("sum(.IN)/nmodels")),
      ICWt = UQ(parse_quosure("min(sum(ICWt * .IN), 1.00)"))) %>%
    dplyr::ungroup()

  if(is_bayesian(object))
    coef$sd <- NA_real_

  coef %<>%
    get_frequentist_coef() %>%
    dplyr::select(UQ(parse_quosure("term")),
                  UQ(parse_quosure("estimate")),
                  UQ(parse_quosure("sd")),
                  UQ(parse_quosure("zscore")),
                  UQ(parse_quosure("lower")),
                  UQ(parse_quosure("upper")),
                  UQ(parse_quosure("pvalue")),
                  UQ(parse_quosure("everything()")))
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
#' @param estimate The function to use to calculate the estimate.
#' @param profile A flag indicating whethe to use likelihood profiling as opposed to the Wald approximation when calculating confidence intervals for the frequentist models.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                  conf_level = getOption("mb.conf_level", 0.95),
                                  estimate = getOption("mb.estimate", median),
                                  profile = getOption("mb.profile", FALSE), ...) {
  llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, profile = profile, ...)
}

#' Coef TMB Meta Analyses
#'
#' @param object The mb_meta_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param estimate The function to use to calculate the estimate.
#' @param profile A flag indicating whethe to use likelihood profiling as opposed to the Wald approximation when calculating confidence intervals for the frequentist models.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analyses <- function(object, param_type = "fixed", include_constant = TRUE,
                                  conf_level = getOption("mb.conf_level", 0.95),
                                  estimate = getOption("mb.estimate", median),
                                  profile = getOption("mb.profile", FALSE), ...) {
  llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, profile = profile, ...)
}
