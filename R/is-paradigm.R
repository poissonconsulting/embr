#' Test if is bayesian
#'
#' @param x the object.
#' @param ... Unused
#' @return A flag indicating wether bayesian.
#' @export
is_bayesian <- function(x, ...) {
  UseMethod("is_bayesian")
}

#' Test if is frequentist
#'
#' @param x the object.
#' @return A flag indicating whether frequentist
#' @export
is_frequentist<- function(x) {
  !is_bayesian(x)
}

#' @export
is_bayesian.mb_analysis <- function(x, ...) {
  !is.mb_null_analysis(x) && (niters(x) > 1L || nchains(x) > 1L)
}

#' @export
is_bayesian.mb_analyses <- function(x, ...) {
  is_bayesian(x[[1]])
}
