#' Number of parameters
#'
#' Gets the parameter number for an object.
#'
#' @param x The object.
#' @param param_type A string indicating the type of terms to get the names for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param ... Not used.
#' @return A integer of the number of parameters.
#' @export
nparams <- function(x, param_type = "all", scalar_only = FALSE, ...) {
  UseMethod("nparams")
}

#' @export
nparams.default <- function(x, param_type = "all", scalar_only = FALSE, ...) {
  length(parameters(x, param_type = param_type, scalar_only = scalar_only))
}
