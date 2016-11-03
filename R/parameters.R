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
  parameters <- coef(x, terms = terms)$term
  if (scalar)
    parameters <- parameters[!str_detect(parameters, "([)")]
  parameters
}
