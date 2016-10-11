#' Get Estimates
#'
#' Gets the estimates for an object as a named list.
#'
#' @param object The object.
#' @param terms A string indicating the parameters to get the estimates for.
#' @param ... Unused.
#' @return The estimates as a named list.
#' @export
estimates <- function(object, terms = "fixed", ...) {UseMethod("estimates")}
