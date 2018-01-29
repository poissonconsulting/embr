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
                                  ...) {
  check_vector(param_type, c("fixed", "random", "derived", "primary", "all"), length = 1)
  check_flag(include_constant)
  check_vector(conf_level, c(0.5, 0.99), length = 1)

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
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef.mb_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                             conf_level = getOption("mb.conf_level", 0.95),
                             estimate = getOption("mb.estimate", median),
                             ...) {
  check_vector(param_type, c("fixed", "random", "derived", "primary", "all"), length = 1)
  check_flag(include_constant)
  check_vector(conf_level, c(0.5, 0.99), length = 1)

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

    if (!include_constant) coef %<>% dplyr::filter_(~lower != upper)

  } else {
    coef <- as.mcmcr(object) %>%
      subset(parameters = parameters) %>%
      coef()

    sd <- as.mcmcr(object$sd) %>%
      subset(parameters = parameters) %>%
      coef()

    coef$sd <- sd$estimate

    coef %<>% get_frequentist_coef(conf_level = conf_level)

    if (!include_constant) coef %<>% dplyr::filter_(~lower != upper)
  }
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
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.mb_analyses <- function(object, param_type = "fixed", include_constant = TRUE,
                             conf_level = getOption("mb.conf_level", 0.95),
                             estimate = getOption("mb.estimate", median),
                             ...) {
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
        dplyr::mutate(sd = `!!`(parse_quo("numeric(0)"))) %>%
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
    dplyr::mutate(.IN = `!!`(parse_quo("1"))) %>%
    tidyr::complete(`!!`(parse_quo("term")), `!!`(parse_quo("model")), fill = list(estimate = 0, sd = 0, .IN = 0))  %>%
    dplyr::inner_join(dplyr::select(ic, `!!`(parse_quo("model")), `!!`(parse_quo("ICWt"))), by = "model") %>%
    dplyr::mutate(coef = `!!`(parse_quo("estimate")),
                   var = `!!`(parse_quo("pow(sd,2)"))) %>%
    dplyr::group_by(`!!`(parse_quo("term"))) %>%
    dplyr::summarise(
      estimate = `!!`(parse_quo("sum(ICWt * estimate)")),
      sd = `!!`(parse_quo("sqrt(sum(ICWt * (var + pow(coef - estimate, 2))))")),
      nmodels = `!!`(parse_quo("nmodels")),
      proportion = `!!`(parse_quo("sum(.IN)/nmodels")),
      ICWt = `!!`(parse_quo("min(sum(ICWt * .IN), 1.00)"))) %>%
    dplyr::ungroup()

  if(is_bayesian(object))
    coef$sd <- NA_real_

  coef %<>%
    get_frequentist_coef() %>%
    dplyr::select(`!!`(parse_quo("term")),
                  `!!`(parse_quo("estimate")),
                  `!!`(parse_quo("sd")),
                  `!!`(parse_quo("zscore")),
                  `!!`(parse_quo("lower")),
                  `!!`(parse_quo("upper")),
                  `!!`(parse_quo("pvalue")),
                  `!!`(parse_quo("everything()")))
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
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                  conf_level = getOption("mb.conf_level", 0.95),
                                  estimate = getOption("mb.estimate", median),
                                  ...) {
  llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, ...)
}

#' Coef TMB Meta Analyses
#'
#' @param object The mb_meta_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param estimate The function to use to calculate the estimate.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef.mb_meta_analyses <- function(object, param_type = "fixed", include_constant = TRUE,
                                  conf_level = getOption("mb.conf_level", 0.95),
                                  estimate = getOption("mb.estimate", median),
                                  ...) {
    llply(object, coef, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, ...)
}
