#' Sort Analyses by IC
#'
#' @param x the object.
#' @param ... Unused
#' @return The sorted object
#' @export
sort_by_ic <- function(x, ...) {
  UseMethod("sort_by_ic")
}

#' @export
sort_by_ic.mb_analyses <- function(x, ...) {
  x <- x[order(vapply(x, IC, 1))]
  class(x) <- "mb_analyses"
  x
}

#' @export
sort_by_ic.mb_meta_analyses <- function(x, ...) {
  llply(x, sort_by_ic)
}
