#' Estimates
#'
#' estimates
#'
#' @param object The mb_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param ... Not used.
#' @export
estimates.mb_analysis <- function(object, param_type = "fixed", ...) {
  check_scalar(param_type, c("fixed", "random", "derived"))

  parameters <- parameters(object, param_type)

  object %<>% as.mcmcr()

  object %<>% subset(parameters = parameters)

  estimates(object)
}
