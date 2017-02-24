#' Elapsed
#'
#' Get elapsed time in minutes.
#'
#' @param x The object to calculate it for.
#' @param ... Not used.
#' @export
elapsed <- function(x, ...) {
  UseMethod("elapsed")
}

#' @export
elapsed.mb_analysis <- function(x, ...) {
  as.integer(round(as.integer(x$duration) / 60))
}

#' @export
elapsed.mb_null_analysis <- function(x, ...) {
  0L
}
