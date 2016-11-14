#' Parameters
#'
#' Gets the parameter names for an object.
#'
#' @param x The object.
#' @param terms A string indicating the type of terms to get the names for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param ... Not used.
#' @return A character vector of the parameter names.
#' @export
parameters <- function(x, terms = "fixed", scalar_only = FALSE, ...) {UseMethod("parameters")}

#' @export
parameters.mb_analysis <- function(x, terms = "fixed", scalar_only = FALSE, ...) {
  coef(x, terms = terms, scalar_only = scalar_only)$term
}
