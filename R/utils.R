all1 <- function(x) all(x == 1)

allin <- function(x, y) all(x %in% y)

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

sort_random_effects <- function(x) {
  x %<>% sort_nlist()
  check_all_elements_class_character(x)
  x %<>% lapply(function(x) sort(x))
  x
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
  x %<>% str_replace("^(\\w+)(\\[[:alnum:]+([,][:alnum:]+)*\\])$", "\\2")
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
  x[x == str_c("base+", str_c(drops, collapse = "+"), collapse = "")] <- "full"
  names(x) <- NULL
  x
}

drop_indices <- function(x) {
  str_replace(x, "^(\\w+)(\\[.*)", "\\1")
}

#' plapply
#'
#' @inheritParams base::lapply
#' @export
plapply <- function(X, FUN, ...) {
  if (!is.list(X)) error("X must be a list")

  if (!length(X)) return(X)

  nworkers <- foreach::getDoParWorkers()

  if (identical(nworkers, 1L) || length(X) > nworkers) return(lapply(X, FUN, ...))

  i <- NULL
  foreach::foreach(i = itertools::isplitIndices(n = length(X), chunks = nworkers)) %dopar%
    FUN(X[[i]], ...)
}
