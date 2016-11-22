#' Arrayize
#'
#' Converts a vector into a matrix or array based on two or more factors.
#'
#' The function can be used in modify_data functions to convert vectors to matrices or
#' arrays.
#'
#' @param vector The vector.
#' @param factors A named list of two or more factors.
#' @return An array.
#' @export
arrayize <- function(vector, factors) {
  if (!is.vector(vector)) error("vector must be a vector")
  if (is.list(vector)) error("vector must not be a list")
  check_uniquely_named_list(factors)
  if (length(factors) < 2) error("factors must be at least of length 2")
  if ("vector" %in% names(factors)) error("factors must not be named 'vector'")

  lengths <- vapply(c("vector" = list(vector), factors), length, 1L)
  if (!all(lengths == lengths[1])) error("vector and factors must be the same lengths")

  data <- as.data.frame(c("vector" = list(vector), factors))
  data %<>% unique()

  factors %<>% names()

  dims <- vapply(data[factors], nlevels, 1L)
  names(dims) <- NULL
  dimnames <- lapply(data[factors], levels)

  if (nrow(data) != prod(dims))
    error("length of vector is not the product of the factor levels")

  for (factor in factors) {
    data <- data[order(data[[factor]]),,drop = FALSE]
  }

  if (length(factors) == 2) {
    vector <- matrix(data$vector, nrow = dims[1], ncol = dims[2], dimnames = dimnames)
  } else
    vector <- array(data$vector, dim = dims, dimnames = dimnames)
  vector
}
