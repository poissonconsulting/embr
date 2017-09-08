#' Data Set
#'
#' Gets the data set for an object inheriting from class mb_analysis.
#'
#' @param analysis The object.
#' @param modify A flag indicating whether to modify the data.
#' @param numericize_factors A flag indicating whether to convert factors to integers if modifying the data.
#' @param ... Unused.
#' @return The data set as a tibble.
#' @export
data_set <- function(analysis, modify = FALSE, numericize_factors = FALSE, ...) {UseMethod("data_set")}

#' @export
data_set.mb_analysis <- function(analysis, modify = FALSE, numericize_factors = FALSE, ...) {
  check_flag(modify)
  check_flag(numericize_factors)

  data <- analysis$data

  if (modify) {
    data %<>% modify_data(model(analysis), numericize_factors = numericize_factors)
  } else
      data %<>% dplyr::as.tbl()
  data
}
