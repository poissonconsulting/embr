#' Predict Data
#'
#' Calculate predictions.
#'
#' @param data The data frame to calculate the predictions for.
#' @param analysis An object inheriting from class mb_analysis.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param term A string of the term in new_expr.
#' @param conf_int A flag indicating whether to calculate confidence intervals.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ...  Additional arguments.
#' @export
predict_data <- function(data, analysis, new_expr = NULL, term = "prediction",
  conf_int = FALSE, conf_level = 0.95, ...) {
  check_mb_analysis(analysis)
  predict(analysis, new_data = data, new_expr = new_expr, term = term, conf_int = conf_int,
          conf_level = conf_level, ...)
}

