#' Number of chains
#'
#' nchains
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A count of the number of chains.
#' @export
nchains.mb_analysis <- function(x, ...) {
  check_unused(...)

  if (is.null(x$mcmcr)) return(1L)

  nchains(x$mcmcr)
}
