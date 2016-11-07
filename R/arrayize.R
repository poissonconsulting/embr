#' Arrayize
#'
#' Converts a vector in a named list into a matrix or array based on two or more factors.
#'
#' The function can be used in modify_data functions to convert vectors to matrices or
#' arrays.
#'
#' @param list The named list with the vector and factors.
#' @param vector A string specifying the vector.
#' @param factors A character vector specifying two or more factors
#' @return The modified list.
#' @export
arrayize <- function(list, vector, factors) {
  check_uniquely_named_list(list)
  check_string(vector)
  check_vector(factors, "", min_length = 2)
  check_unique(factors)
  if (vector %in% factors) error("vector cannot be in factors")
  if (!vector %in% names(list)) error("vector is missing from list")
  if (!all(factors %in% names(list))) error("factors are missing from list")
  if (!all(vapply(list[factors], is.factor, TRUE)))
    error("factors in list must be factors")

  lengths <- vapply(list[c(vector, factors)], length, 1L)
  if (!all(lengths == lengths[1])) error("vector and factors must be the same lengths")

  data <- as.data.frame(list[c(vector, factors)])
  data %<>% unique()

  dims <- vapply(list[factors], nlevels, 1L)
  names(dims) <- NULL
  dimnames <- lapply(list[factors], levels)

  if (nrow(data) != prod(dims))
    error("length of vector is not the product of the factor levels")

  for (factor in factors) {
    data <- data[order(data[[factor]]),,drop = FALSE]
  }

  if (length(factors) == 2) {
    list[[vector]] <- matrix(data[[vector]], nrow = dims[1],
                             ncol = dims[2],
                             dimnames = dimnames)
  } else
    list[[vector]] <- array(data[[vector]], dim = dims, dimnames = dimnames)
  list
}
