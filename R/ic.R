#' Information Criterion
#'
#' Calculate default information criterion.
#'
#' @param object The object to calculate it for.
#' @param ... Not used.
#' @export
IC <- function(object, ...) {
  UseMethod("IC")
}
