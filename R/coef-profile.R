#' Coef Profile
#'
#' Gets coef confidence limits by likelihood profiling.
#'
#' @param object The object.
#' @param ... Unused.
#' @export
coef_profile <- function(object, ...) {UseMethod("coef_profile")}

#' @export
coef_profile.mb_null_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                          conf_level = getOption("mb.conf_level", 0.95),
                                          estimate = getOption("mb.estimate", median),
                                          parallel = getOption("mb.parallel", FALSE),
                                          beep = getOption("mb.beep", TRUE),
                                          ...) {

  check_flag(beep)
  if (beep) on.exit(beepr::beep())

  coef(object, param_type = param_type, include_constant = include_constant,
       conf_level = conf_level, estimate = estimate, ...)
}

#' Coef Profile Analysis
#'
#' Coefficients for a analysis.
#'
#' The \code{zscore} is mean / sd.
#'
#' @param object The mb_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param estimate The function to use to calculating the estimate for Bayesian models.
#' @param parallel A flag indicating whether to using parallel backend provided by foreach.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef_profile.mb_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                     conf_level = getOption("mb.conf_level", 0.95),
                                     estimate = getOption("mb.estimate", median),
                                     parallel = getOption("mb.parallel", FALSE),
                                     beep = getOption("mb.profile", TRUE),
                                     ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())
  beep <- FALSE

  coef <- coef(object, param_type = param_type,
               include_constant = include_constant,
               conf_level = conf_level, estimate = estimate, ...)

  if (is_bayesian(object)) {
    warning("coef_profile is undefined for Bayesian models - returning coef")
  } else {
    confint <- confint(object, parm = coef$term, conf_level = conf_level,
                       beep = FALSE, parallel = parallel)
    stopifnot(identical(confint$term, coef$term))
    coef[c("lower","upper")] <- confint[c("lower","upper")]
  }
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
#' @param parallel A flag indicating whether to using parallel backend provided by foreach.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef_profile.mb_analyses <- function(
  object, param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  parallel = getOption("mb.parallel", FALSE),
  beep = getOption("mb.beep", TRUE),
  ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())
  beep <- FALSE

  ic <- IC(object)
  coef <- llply(object, coef_profile, param_type = param_type,
                include_constant = include_constant, conf_level = conf_level,
                parallel = parallel, beep = beep)

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
#' @param parallel A flag indicating whether to using parallel backend provided by foreach.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef_profile.mb_meta_analysis <- function(object, param_type = "fixed", include_constant = TRUE,
                                          conf_level = getOption("mb.conf_level", 0.95),
                                          estimate = getOption("mb.estimate", median),
                                          parallel = getOption("mb.parallel", FALSE),
                                          beep = getOption("mb.beep", TRUE),
                                          ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())
  beep <- FALSE

  llply(object, coef_profile, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, parallel = parallel, beep = beep, ...)
}

#' Coef TMB Meta Analyses
#'
#' @param object The mb_meta_analyses object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param estimate The function to use to calculate the estimate.
#' @param parallel A flag indicating whether to using parallel backend provided by foreach.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Not used.
#' @return A tidy tibble.
#' @export
coef_profile.mb_meta_analyses <- function(object, param_type = "fixed", include_constant = TRUE,
                                          conf_level = getOption("mb.conf_level", 0.95),
                                          estimate = getOption("mb.estimate", median),
                                          parallel = getOption("mb.parallel", FALSE),
                                          beep = getOption("mb.parallel", TRUE),
                                          ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())
  beep <- FALSE

  llply(object, coef_profile, param_type = param_type, include_constant = include_constant, conf_level = conf_level, estimate = estimate, parallel = parallel, beep = beep, ...)
}
