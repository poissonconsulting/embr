#' RhatÎı
#'
#' rhat
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
rhat.mb_analysis <- function(x, ...) {
  rhat(as.mcmcr(x))
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
  niters(as.mcmcr(x))
}

#' Is Converged
#'
#' @param x Object to test rhat for
#' @param rhat A number specifying the rhat threshold.
#' @param ... Unused
#' @export
is_converged.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), ...) {
  check_number(rhat)
  rhat(as.mcmcr(x)) <= rhat
}
