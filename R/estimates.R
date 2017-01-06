#' Estimates
#'
#' estimates
#'
#' @param object The mb_analysis object.
#' @param fixed A flag specifying whether fixed or random terms.
#' @param ... Not used.
#' @export
estimates.mb_analysis <- function(object, fixed = TRUE, ...) {
  check_flag(fixed)
  

  parameters <- parameters(object, fixed)

  object %<>% as.mcmcr(object)

  object %<>% subset(parameters = parameters)

  estimates(object)
}
