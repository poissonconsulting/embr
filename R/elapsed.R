#' Elapsed
#'
#' Get elapsed duration.
#'
#' @param x The object to calculate it for.
#' @param ... Not used.
#' @export
elapsed <- function(x, ...) {
  UseMethod("elapsed")
}

#' @export
elapsed.mb_analysis <- function(x, ...) {
  round(x$duration, 1)
}

#' @export
elapsed.mb_null_analysis <- function(x, ...) {
  lubridate::dseconds(0)
}
