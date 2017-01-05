#' Number of iterations
#'
#' niters
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A count of the number of iterations.
#' @export
niters.mb_analysis <- function(x, ...) {
  check_unused(...)

  if (is.null(x$mcmcr)) return(1L)

  niters(x$mcmcr)
}
