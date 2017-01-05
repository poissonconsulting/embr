#' Convergence
#'
#' convergence
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
convergence.mb_analysis <- function(x, ...) {
  check_unused(...)

  convergence(as.mcmcr(x))
}


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

  nchains(as.mcmcr(x))
}

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

  niters(as.mcmcr(x))
}

#' @export
plot.mb_analysis <- function(x, ...) {
  check_unused(...)

  plot(as.mcmcr(x))
}

