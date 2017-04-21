#' Is MB Code?
#'
#' Tests whether x is an object of class 'mb_model'
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.mb_code <- function(x) {
  inherits(x, "mb_code")
}

#' Is MB Model?
#'
#' Tests whether x is an object of class 'mb_model'
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.mb_model <- function(x) {
  inherits(x, "mb_model")
}

#' Is MB Analysis?
#'
#' Tests whether x is an object of class 'mb_analysis'
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.mb_analysis <- function(x) {
  inherits(x, "mb_analysis")
}

#' Is MB Null Analysis?
#'
#' Tests whether x is an object of class 'mb_null_analysis'
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.mb_null_analysis <- function(x) {
  inherits(x, "mb_null_analysis")
}

#' Is MB Analyses?
#'
#' Tests whether x is an object of class 'mb_analyses'
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.mb_analyses <- function(x) {
  inherits(x, "mb_analyses")
}
