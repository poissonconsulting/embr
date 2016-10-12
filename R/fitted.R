#' Fitted Values
#'
#' Extract fitted values for a MB analysis.
#'
#' The new_expr in the model must include the term 'fit'.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the fitted values.
#' @export
fitted.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "fit")
}
