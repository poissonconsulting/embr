#' Residuals
#'
#' Extract residual values for an MB analysis.
#'
#' @inheritParams predict.mb_analysis
#' @return The analysis data set with the fitted values.
#' @export
residuals.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "residual")
}
