#' Total Number of MCMC simulations generated.
#'
#' @param x The object
#' @param ... Unused.
#' @return A count.
#' @export
nsims <- function(x, ...) {
  UseMethod("nsims", x)
}

#' @export
nsims.mb_analysis <- function(x, ...) {
  nchains(x) * ngens(x)
}
