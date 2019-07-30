#' Estimates
#'
#' estimates
#'
#' @param object The mb_analysis object.
#' @param param_type A string indicating the type of terms to get the names for.
#' @param ... Not used.
#' @export
estimates.mb_analysis <- function(object, param_type = "fixed", ...) {
  pars <- pars(object, param_type = param_type)

  object %<>%
    as.mcmcr() %>%
    subset(pars = pars)

  estimates(object)
}
