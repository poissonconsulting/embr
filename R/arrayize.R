#' Arrayize
#'
#' Converts a vector into a matrix or array based on two or more factors.
#'
#' The function can be used in modify_data functions to convert vectors to matrices or
#' arrays.
#'
#' @param vector The vector.
#' @param factors A named list of one or more factors.
#' @return An array.
#' @export
arrayize <- function(vector, factors) {
  if (!is.vector(vector)) error("vector must be a vector")
  if (is.list(vector)) error("vector must not be a list")
  check_arrayize_factors(factors)

  if (!identical(length(vector), length(factors[[1]])))
     error("vector and factors must be the same lengths")

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

  if (length(factors) == 1) {
    vector <- data$vector
    names(vector) <- dimnames[[1]]
  } else if (length(factors) == 2) {
    vector <- matrix(data$vector, nrow = dims[1], ncol = dims[2], dimnames = dimnames)
  } else
    vector <- array(data$vector, dim = dims, dimnames = dimnames)
  vector
}

#' Vectorize
#'
#' Converts a matrix or array into a vector based on two or more factors.
#'
#' The function can be used in new_expr code to convert arrays or matrices
#' to vectors that line up with factors for exporting.
#'
#' @param array The matrix or array.
#' @param factors A named list of two or more factors.
#' @return A vector.
#' @export
vectorize <- function(array, factors) {
  if (!is.vector(array) && !is.matrix(array) && !is.array(array)) error("array must be a vector, matrix or array")
  check_arrayize_factors(factors)

  dims <- vapply(factors, nlevels, 1L)
  names(dims) <- NULL
  if (!identical(dims(array), dims)) error("array dims are incompatible with factor levels")

  data <- expand.grid(lapply(factors, levels), stringsAsFactors = FALSE)
  data$vector <- as.vector(array)
  factors %<>% lapply(as.character) %>% as.data.frame(stringsAsFactors = FALSE)
  factors %<>% dplyr::inner_join(data, by = names(factors))
  factors$vector
}
