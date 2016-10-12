#' Dims
#'
#' @param x A vector, matrix or array.
#' @return An integer vector of the dimensions.
#' @examples
#' dims(character())
#' dims(2:3)
#' dims(matrix(1:6, nrow = 2))
#' @export
dims <- function(x) {
  if (is.vector(x)) length(x) else dim(x)
}


#' Error
#'
#' Throws an error without the call as part of the error message.
#'
#' @inheritParams base::stop
#' @seealso base::stop
#' @export
error <- function(...) {
  stop(..., call. = FALSE)
}
