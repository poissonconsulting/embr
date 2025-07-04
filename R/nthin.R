#' Thinning Rate
#'
#' @param x The object
#' @param ... Unused.
#' @return A count.
#' @export
nthin <- function(x, ...) {
  UseMethod("nthin", x)
}

#' @export
nthin.mb_model <- function(x, ...) {
  chk_unused(...)
  as.integer(x$nthin)
}

#' @export
nthin.mb_analysis <- function(x, ...) {
  chk_unused(...)
  as.integer(x$nthin)
}
