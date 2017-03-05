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

#' Residuals
#'
#' Extract residual values for an MB analysis.
#'
#' The new_expr in the model must include the term 'residual'.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the residual values.
#' @export
residuals.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "residual")
}

#' Predict Data
#'
#' Predict
#'
#' @param object An object inheriting from class mb_analysis.
#' @param new_data The data frame to calculate the predictions for.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param new_values A named list of new or replacement values to pass to new_expr.
#' @param term A string of the term in new_expr.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
predict.mb_analysis <- function(object,
                                new_data = data_set(object),
                                new_expr = NULL,
                                new_values = list(),
                                term = "prediction",
                                conf_level = 0.95,
                                modify_new_data = NULL,
                                parallel = getOption("mb.parallel", FALSE),
                                quick = getOption("mb.quick", FALSE),
                                quiet = getOption("mb.quiet", TRUE),
                                beep = getOption("mb.beep", FALSE),
                                ...) {
  check_number(conf_level, c(0.5, 0.99))
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  term %<>% str_c("^", ., "$")

  object %<>% derive_data(new_data = new_data, new_expr = new_expr,
                     new_values = new_values, term = term,
                     modify_new_data = modify_new_data,
                     parallel = parallel, quick = quick, quiet = quiet,
                     beep = FALSE, ...)

  object %<>% coef(conf_level = conf_level)

  object
}
