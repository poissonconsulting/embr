#' Get Estimates
#'
#' Gets the estimates for an object as a named list.
#'
#' @param object The object.
#' @param terms A string indicating the type of terms to get the estimates for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param ...  Not used.
#' @return The estimates as a named list.
#' @export
estimates <- function(object, terms = "fixed", scalar_only = FALSE, ...) {
  UseMethod("estimates")
}
