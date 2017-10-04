#' Total Number of MCMC simulations generated (including warmup)
#'
#' @param x The object
#' @param ... Unused.
#' @return A count.
#' @export
ngens <- function(x, ...) {
  UseMethod("ngens", x)
}

#' @export
ngens.mb_analysis <- function(x, ...) {
  as.integer(nsims(x) * nthin(x) * 2L)
}
