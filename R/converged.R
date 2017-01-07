#' Is Converged
#'
#' @param x Object to test convergence for
#' @param rhat A number specifying the rhat threshold.
#' @param ... Unused
#' @export
is_converged.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), ...) {
  check_number(rhat)
  max(convergence(x)) <= rhat
}
