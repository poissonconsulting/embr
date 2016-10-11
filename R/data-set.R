#' Data Set
#'
#' Gets the data set for an object.
#'
#' @param x The object.
#' @return The data set as a tibble.
#' @export
data_set <- function(x) {UseMethod("data_set")}

#' @export
data_set.mb_analysis <- function(x) x$data %>% dplyr::as.tbl()
