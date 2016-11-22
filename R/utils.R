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
  if (is.vector(x) || is.factor(x)) length(x) else dim(x)
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

#' Scalar Named List
#'
#' Filters a named list so only scalar elements remain.wiby its names.
#'
#' @param x The named list to sort.
#' @return The sorted named list.
#' @export
#' @examples
#' scalar_nlist(list(y = 2, x = 1, a = c(10,1)))
scalar_nlist <- function(x) {
  stopifnot(is_nlist(x))

  if (!length(x)) return(x)
  x[vapply(x, dims, 0L) == 1]
}

indexes <- function(x) {
  x %<>% str_replace("^(\\w+)(\\[\\d+([,]\\d+)*\\])$", "\\2")
  x[!str_detect(x, "\\[")] <- ""
  x
}

remainder <- function(x, y) {
  dplyr::setdiff(y, x)
}

model_names <- function(x, drops) {
  drops %<>% full_drop()
  stopifnot(all(unique(unlist((x))) %in% drops))
  x %<>% lapply(remainder, drops)
  x[vapply(x, length, 1L) == 0] <- "base"
  x %<>% lapply(str_c, collapse = "+") %>% unlist()
  x %<>% vapply(function(x) str_c("base+", x, collapse = ""), "")
  x[x == "base+base"] <- "base"
  names(x) <- NULL
  x
}
