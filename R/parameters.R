#' Parameters
#'
#' Gets the parameter names for an object.
#'
#' @param x The object.
#' @param ... Not used.
#' @return A character vector of the parameter names.
#' @export
parameters <- function(x, ...) {UseMethod("parameters")}

#' @export
parameters.mb_analysis <- function(x, terms = "fixed", scalar = FALSE, ...) {
  coef(x, terms = terms, scalar = scalar)$term
}
