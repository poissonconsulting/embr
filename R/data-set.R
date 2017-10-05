#' Data Set
#'
#' Gets the data set for an object inheriting from class mb_analysis.
#'
#' @param x The object.
#' @param modify A flag indicating whether to modify the data.
#' @param numericize_factors A flag indicating whether to convert factors to integers if modifying the data.
#' @param ... Unused.
#' @return The data set as a tibble.
#' @export
data_set <- function(x, modify = FALSE, numericize_factors = FALSE, ...) {UseMethod("data_set")}

#' @export
data_set.mb_analysis <- function(x, modify = FALSE, numericize_factors = FALSE, ...) {
  check_flag(modify)
  check_flag(numericize_factors)

  data <- x$data

  if (modify) {
    data %<>% modify_data(model(x), numericize_factors = numericize_factors)
  } else
      data %<>% dplyr::as.tbl()
  data
}

#' @export
data_set.mb_analyses <- function(x, modify = FALSE, numericize_factors = FALSE, ...) {
  data_set(x[[1]], modify = modify, numericize_factors = numericize_factors)
}

#' @export
data_set.mb_meta_analysis <- function(x, modify = FALSE, numericize_factors = FALSE, ...) {
  lapply(x, data_set, modify = modify, numericize_factors = numericize_factors)
}

#' @export
data_set.mb_meta_analyses <- function(x, modify = FALSE, numericize_factors = FALSE, ...) {
  lapply(x, data_set, modify = modify, numericize_factors = numericize_factors)
}
