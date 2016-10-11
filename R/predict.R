#' Predict
#'
#' Calculate predictions.
#'
#' @param object The tmb_analysis object.
#' @param new_data The data frame to calculate the predictions for.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param term A string of the term in new_expr.
#' @param conf_int A flag indicating whether to calculate confidence intervals.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Unused.
#' @return The new data set with the predictions.
#' @export
predict.mb_analysis <- function(object, new_data = data_set(object), new_expr = NULL,
                                term = "prediction",
                                conf_int = FALSE, conf_level = 0.95, ...) {
  stop("not implemented")
}
