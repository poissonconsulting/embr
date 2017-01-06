#' Data Set
#'
#' Gets the data set for an object inheriting from class mb_analysis.
#'
#' @param analysis The object.
#' @param modify A flag indicating whether to modify the data.
#' @param ... Unused.
#' @return The data set as a tibble.
#' @export
data_set <- function(analysis, modify = FALSE, ...) {UseMethod("data_set")}

#' @export
data_set.mb_analysis <- function(analysis, modify = FALSE, ...) {
  check_flag(modify)
  

  data <- analysis$data

  if (modify) {
    data %<>% modify_data(model(analysis))
  } else
      data %<>% dplyr::as.tbl()
  data
}
