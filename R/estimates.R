#' @export
universals::estimates

#' @inherit universals::estimates
#' @inheritParams params
#' @export
estimates.mb_analysis <- function(x, param_type = "fixed", ...) {
  pars <- pars(x, param_type = param_type)

  x %<>%
    as.mcmcr() %>%
    subset(pars = pars)

  estimates(x)
}
