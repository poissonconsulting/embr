#' Coef TMB Analyses
#'
#' Coefficients for fixed parameters from a list of ML based
#' MB analyses averaged by AICc weights.
#'
#' @param object The list of tmb_analysis objects.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.list <- function(object, conf_level = 0.95, n = NULL, ...) {
  nmodels <- length(object)
  aicc <- AICc(object, n = n)
  coef <- lapply(object, coef, conf_level = conf_level)

  coef %<>% purrr::map2_df(aicc$AICcWt, function(x, y) {x$AICcWt <- y; x})
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * AICcWt), lower = ~sum(lower * AICcWt),
    upper = ~sum(upper * AICcWt), AICcWt = ~min(sum(AICcWt), 1.00), proportion = ~n()/nmodels) %>% dplyr::ungroup()
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
  check_scalar(param_type, c("fixed", "random", "derived"))
  check_flag(include_constant)
  check_number(conf_level, c(0.5, 0.99))

  parameters <- parameters(object, param_type)

  object %<>% as.mcmcr()

  object %<>% subset(parameters = parameters)

  object %<>% coef()

  if (!include_constant)
    object %<>% dplyr::filter_(~lower != upper)

  object
}
