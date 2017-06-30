#' Deviance
#'
#' Extract deviance values for an MB analysis.
#'
#' The new_expr in the model must include the term 'deviance'.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the deviance values.
#' @export
deviance.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "deviance")
}
