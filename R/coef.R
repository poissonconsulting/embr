#' Coef TMB Analyses
#'
#' Coefficients for a list of MB analyses averaged by IC weights.
#'
#' @param object The list of tmb_analysis objects.
#' @param terms A string of the type of terms to get the coefficients for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param constant_included A flag indicating whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms with the model averaged estimate, the
#' Akaike's weight and the proportion of models including the term.
#' @export
coef.list <- function(object, terms = "fixed", scalar_only = FALSE,
                              constant_included = TRUE,
                              conf_level = 0.95, n = NULL, ...) {

  nmodels <- length(object)
  ic <- IC(object, n = n)
  coef <- lapply(object, coef, terms = terms, scalar_only = scalar_only, constant_included = constant_included,
                 conf_level = conf_level)
  coef %<>% purrr::map2_df(ic$weight, function(x, y) {x$weight <- y; x})
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * weight), lower = ~sum(lower * weight),
    upper = ~sum(upper * weight), weight = ~sum(weight), proportion = ~n()/nmodels) %>% dplyr::ungroup()
  coef
}
