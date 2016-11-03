#' Drop Parameters
#'
#' Drops named scalar fixed parameters from a model by fixing them at 0.
#'
#' @param x The object.
#' @param parameters A character vector of the parameters to drop.
#' @param ... Not used.
#' @return The updated object.
#' @export
drop_parameters <- function(x, parameters = character(0), ...) {UseMethod("drop_parameters")}
