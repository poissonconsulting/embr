#' @export
stats::coef

get_frequentist_coef <- function(object, conf_level = 0.95) {
  object <- dplyr::mutate_(object,
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
  chk_string(param_type)
  chk_subset(param_type, c("fixed", "random", "derived", "primary", "all"))
  chk_flag(include_constant)
  chk_number(conf_level)
  chk_range(conf_level, c(0.5, 0.99))

  coef <- tibble(term = as.term(character(0)),
                            estimate = numeric(0), sd = numeric(0))

  coef <- get_frequentist_coef(coef)

  class(coef) <- c("mb_analysis_coef", class(coef))
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
  chk_string(param_type)
  chk_subset(param_type, c("fixed", "random", "derived", "primary", "all"))
  chk_flag(include_constant)
  chk_number(conf_level)
  chk_range(conf_level, c(0.5, 0.99))

  pars <- pars(object, param_type)

  if (!length(parameters)) {
    coef <- tibble(term = as.term(character(0)),
                              estimate = numeric(0),
                              sd = numeric(0))

    coef <- get_frequentist_coef(coef)

    class(coef) <- c("mb_analysis_coef", class(coef))
    return(coef)
  }

  if (is_bayesian(object)) {
    coef <- as.mcmcr(object)
    coef <- subset(coef, pars = pars)
    coef <- coef(coef, estimate = estimate)

    if (!include_constant) coef <- dplyr::filter(coef, .data$lower != .data$upper)

  } else {
    coef <- as.mcmcr(object)
    coef <- subset(coef, pars = pars)
    coef <- coef(coef)

    sd <- as.mcmcr(object$sd)
    sd <- subset(sd, pars = pars)
    sd <- coef(sd)

    coef$sd <- sd$estimate

    coef <- get_frequentist_coef(coef, conf_level = conf_level)

    if (!include_constant) coef <- dplyr::filter(coef, ~.data$lower != .data$upper)
  }
  class(coef) <- c("mb_analysis_coef", class(coef))
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
    coef <- tibble(
      term = as.term(character(0)),
      estimate = numeric(0))

    if(is_frequentist(object)) {
      coef <- dplyr::mutate(coef, sd = `!!`(parse_expr("numeric(0)")))
      coef <- get_frequentist_coef(coef)
    }
    coef <- dplyr::mutate_(coef,
      nmodels = ~integer(0),
      proportion = ~numeric(0),
      ICWt = ~numeric(0))
    class(coef) <- c("mb_analyses_coef", class(coef))
    return(coef)
  }

  suppressWarnings(coef <- purrr::map2_df(coef, ic$model, function(x, y) {x$model <- y; x}))

  coef <- dplyr::mutate(coef, .IN = `!!`(parse_expr("1")))
  coef <- tidyr::complete(coef, `!!`(parse_expr("term")), `!!`(parse_expr("model")), fill = list(estimate = 0, sd = 0, .IN = 0))
  coef <- dplyr::inner_join(coef, dplyr::select(ic, `!!`(parse_expr("model")), `!!`(parse_expr("ICWt"))), by = "model")
  coef <- dplyr::mutate(coef, coef = `!!`(parse_expr("estimate")),
                   var = `!!`(parse_expr("pow(sd,2)")))
  coef <- dplyr::group_by(coef, `!!`(parse_expr("term")))
  coef <- dplyr::summarise(coef,
      estimate = `!!`(parse_expr("sum(ICWt * estimate)")),
      sd = `!!`(parse_expr("sqrt(sum(ICWt * (var + pow(coef - estimate, 2))))")),
      nmodels = `!!`(parse_expr("nmodels")),
      proportion = `!!`(parse_expr("sum(.IN)/nmodels")),
      ICWt = `!!`(parse_expr("min(sum(ICWt * .IN), 1.00)")))
  coef <- dplyr::ungroup(coef)

  if(is_bayesian(object))
    coef$sd <- NA_real_

  coef <- get_frequentist_coef(coef)
  coef <- dplyr::select(coef, `!!`(parse_expr("term")),
                  `!!`(parse_expr("estimate")),
                  `!!`(parse_expr("sd")),
                  `!!`(parse_expr("zscore")),
                  `!!`(parse_expr("lower")),
                  `!!`(parse_expr("upper")),
                  `!!`(parse_expr("pvalue")),
                  `!!`(parse_expr("everything()")))
  coef$term <- as.term(coef$term)
  coef <- coef[order(coef$term),]
  class(coef) <- c("mb_analyses_coef", class(coef))
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
