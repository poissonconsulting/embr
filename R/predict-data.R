#' Predict Data
#'
#' Calculate predictions.
#'
#' @param data The data frame to calculate the predictions for.
#' @param analysis An object inheriting from class mb_analysis.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param new_values A named list of new or replacement values to pass to new_expr.
#' @param term A string of the term in new_expr.
#' @param conf_int A flag indicating whether to calculate confidence intervals.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
predict_data <- function(data, analysis, new_expr = NULL, new_values = list(),
                         term = "prediction",
                         conf_int = FALSE, conf_level = 0.95,
                         modify_new_data = NULL,
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", FALSE),
                         ...) {
  check_mb_analysis(analysis)
  predict(analysis, new_data = data, new_expr = new_expr, new_values = new_values,
          term = term, conf_int = conf_int,
          conf_level = conf_level, modify_new_data = modify_new_data,
          quick = quick, quiet = quiet, beep = beep, ...)
}

