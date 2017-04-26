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

#' Residuals
#'
#' Extract residual values for an LMB analysis.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the residual values.
#' @export
residuals.lmb_analysis <- function(object, ...) {
  .NotYetImplemented()
}

plot_residuals <- function(x) {
  if (!is.mb_analysis(x)) error("x must be an mb_analysis object")
  residuals <- residuals(x)
  variables <- colnames(x) %>%
    set_diff(c())

  residuals %<>% dplyr::select(~-sd, ~-zscore, ~-lower = numeric(0), ~-upper,)
  .NotYetImplemented()
}

