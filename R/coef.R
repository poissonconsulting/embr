#' Coef TMB Analyses
#'
#' Coefficients for a list of MB analyses averaged by IC weights.
#'
#' @param object The list of tmb_analysis objects.
#' @param terms A string of the type of terms to get the coefficients for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param constant_included A flag indicating whether to include constant terms.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param latex A flag indicating whether to replace each term with its latex math code
#' or a named character vector specifying the latex math code for each parameter.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @return A tidy tibble of the coeffcient terms.
#' @export
coef.list <- function(object, terms = "fixed", scalar_only = FALSE,
                              constant_included = TRUE,
                              conf_level = 0.95, latex = FALSE, n = NULL, ...) {

  nmodels <- length(object)
  ICw <- ICw(object, n = n)
  coef <- lapply(object, coef, terms = terms, scalar_only = scalar_only, constant_included = constant_included,
                 conf_level = conf_level, latex = latex)
  coef %<>% lapply(function(x) x[c("term", "estimate")])
  coef %<>% purrr::map2_df(ICw, function(x, y) {x$ICw <- y; x})
  coef %<>% dplyr::group_by_(~term) %>% dplyr::summarise_(
    estimate = ~sum(estimate * ICw) / nmodels, ICw = ~sum(ICw), Proportion = ~n()/nmodels) %>% dplyr::ungroup()
  coef
}
