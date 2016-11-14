#' Sample Size
#'
#' Get sample size.
#'
#' @param object The object to calculate the sample size for.
#' @param ... Not used.
#' @return A count of the sample size.
#' @export
sample_size <- function(object, ...) {
  UseMethod("sample_size")
}

#' @export
sample_size.data.frame <- function(object, ...) {
  check_unused(...)
  nrow(object)
}

#' @export
sample_size.mb_analysis <- function(object, ...) {
  check_unused(...)
  sample_size(data_set(object))
}
