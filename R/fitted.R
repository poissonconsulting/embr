#' Fitted Values
#'
#' Extract fitted values for a MB analysis.
#'
#' @inheritParams predict.mb_analysis
#' @return The analysis data set with the fitted values.
#' @export
fitted.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "fit")
}
