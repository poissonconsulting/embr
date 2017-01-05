#' Convergence
#'
#' convergence
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
convergence.mb_analysis <- function(x, ...) {
  if (is.null(x$mcmcr)) error("convergence is undefined for x")

  convergence(x$mcmcr)
}
