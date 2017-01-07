#' Total Number of MCMC simulations generated for each chain.
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
  as.integer(x$ngens)
}
