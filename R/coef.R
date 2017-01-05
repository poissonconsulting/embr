#' Coef TMB Analyses
#'
#' Coefficients for a list of MB analyses averaged by IC weights.
#'
#' @param object The list of tmb_analysis objects.
#' @param fixed A flag specifying whether fixed or random terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.list <- function(object, fixed = TRUE, conf_level = 0.95, n = NULL, ...) {
  check_flag(fixed)

  nmodels <- length(object)
  ic <- IC(object, n = n)
  coef <- lapply(object, coef, fixed = fixed,
                 conf_level = conf_level)
  coef %<>% purrr::map2_df(ic$weight, function(x, y) {x$weight <- y; x})
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * weight), lower = ~sum(lower * weight),
    upper = ~sum(upper * weight), weight = ~sum(weight), proportion = ~n()/nmodels) %>% dplyr::ungroup()
  coef
}

#' Coef JAGS Analysis
#'
#' Coefficients for a JAGS analysis.
#'
#'  Permitted values for terms are 'fixed' and 'random'.
#'
#' The \code{statistic} is mean / std.error.
#'
#' @param object The mb_analysis object.
#' @param fixed A flag specifying whether fixed or random terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
coef.mb_analysis <- function(object, fixed = TRUE, include_constant = TRUE, conf_level = 0.95, ...) {
  check_flag(fixed)
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))
  check_unused(...)

  parameters <- parameters(object, fixed)

  object %<>% as.mcmcr()

  object %<>% subset(parameters = parameters)

  object %<>% coef()

  if (!include_constant)
    object %<>% dplyr::filter_(~lower != upper)

  object
}
