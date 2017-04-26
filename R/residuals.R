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
#' To standardize just divide estimate by sd.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the residual values.
#' @export
residuals.lmb_analysis <- function(object, ...) {
  residuals <- data_set(object)
  residuals$estimate <- residuals(object$lm)
  residuals$sd <- summary(object$lm)$sigma
  residuals %<>% dplyr::mutate_(zscore = ~estimate/sd,
                               lower = ~estimate + sd * qnorm(0.025),
                               upper = ~estimate + sd * qnorm(0.975),
                               pvalue = ~pnorm(-abs(zscore)) * 2)
  residuals
}

plot_residuals <- function(x) {
  if (!is.mb_analysis(x)) error("x must be an mb_analysis object")
  residuals <- residuals(x)
  variables <- colnames(x) %>%
    set_diff(c("estimate", "sd", "zscore", "lower", "upper", "pvalue"))

  residuals %<>% dplyr::select(~-sd, ~-zscore, ~-lower, ~-upper,)
  .NotYetImplemented()
}

