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
#' The zscores are the standardized residuals.
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

#' Plot Residuals
#'
#' @param x The object to plot the residuals for.
#' @param ... Unused.
#' @export
plot_residuals <- function(x, ...) {
  UseMethod("plot_residuals")
}

ggplot_residuals <- function(data, name) {
  gp <- ggplot2::ggplot(data = data) +
    ggplot2::aes_string(x = "x", y = "residuals") +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::expand_limits(y = 0) +
    ggplot2::xlab(name) +
    ggplot2::ylab("residual")
  gp
}

#' @export
plot_residuals.default <- function(x, name, residuals, ...) {
  data <- dplyr::data_frame(x, residuals)
  data %<>% dplyr::filter(!is.na(x), !is.na(residuals))

  if (length(unique(data$x)) <= 1) invisible(NULL)

  gp <- ggplot_residuals(data, name) +
    ggplot2::geom_point(alpha = 1/3)
  print(gp)
  invisible(gp)
}

#' @export
plot_residuals.character <- function(x, name, residuals, ...) {
  invisible(NULL)
}

#' @export
plot_residuals.mb_analysis <- function(x) {
  residuals <- residuals(x)
  variables <- dplyr::select_(residuals, ~-estimate, ~-sd, ~-zscore,
                              ~-lower, ~-upper, ~-pvalue)
  residuals <- residuals$estimate
  names <- colnames(variables)
  names %<>% sort()
  variables <- variables[,names, drop = FALSE]
  invisible(purrr::map2(variables, names, plot_residuals, residuals = residuals))
}
