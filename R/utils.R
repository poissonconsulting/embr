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

#' Is Named List
#'
#' @param x The object to test.
#'
#' @return A flag.
#' @export
#' @examples
#' is_nlist(1)
#' is_nlist(list())
#' is_nlist(list(1))
#' is_nlist(list(x = 1))
#' is_nlist(list(x = list(y = 2)))
is_nlist <- function(x) {
  if (!is.list(x)) return(FALSE)
  if (!length(x)) return(TRUE)
  if (is.null(names(x))) return(FALSE)
  return(!any(vapply(x, is.list, TRUE)))
}

#' Sort Named List
#'
#' Sorts a named list by its names.
#'
#' @param x The named list to sort.
#' @return The sorted named list.
#' @export
#' @examples
#' sort_nlist(list(y = 2, x = 1, a = 10))
sort_nlist <- function(x) {
  stopifnot(is_nlist(x))

  if (!length(x)) return(x)
  x[order(names(x))]
}
