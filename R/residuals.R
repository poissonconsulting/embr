#' Residuals
#'
#' Extract residual values for an MB analysis.
#'
#' The new_expr in the model must include the term 'residual'.
#'
#' @param object The MB analysis object.
#' @inheritParams params
#' @param ... Unused.
#' @return The analysis data set with the residual values.
#' @export
residuals.mb_analysis <- function(object, type = NULL, ...) {
  chk_null_or(type, vld = vld_string)

  new_expr(object) <- edit_residuals_code(new_expr(object), type = type)

  predict(object, new_data = data_set(object), term = "residual")
}

#' Plot Residuals
#'
#' @param x The object to plot the residuals for.
#' @param ... Unused.
#' @export
plot_residuals <- function(x, ...) {
  UseMethod("plot_residuals")
}

ggplot_residuals_histogram <- function(data, name) {
  gp <- ggplot2::ggplot(data = data) +
    ggplot2::aes(x = "residuals") +
    suppressWarnings(ggplot2::geom_histogram()) +
    ggplot2::expand_limits(x = 0) +
    ggplot2::xlab("residual")
  gp
}

ggplot_residuals <- function(data, name) {
  gp <- ggplot2::ggplot(data = data) +
    ggplot2::aes(x = "x", y = "residuals") +
    ggplot2::geom_hline(yintercept = 0) +
    ggplot2::expand_limits(y = 0) +
    ggplot2::xlab(name) +
    ggplot2::ylab("residual")
  gp
}

#' @export
plot_residuals.default <- function(x, name, residuals, ...) {
  data <- tibble(x, residuals)
  data <- dplyr::filter(data, !is.na(x), !is.na(residuals))

  if (length(unique(data$x)) <= 1) {
    return(invisible(NULL))
  }

  gp <- ggplot_residuals(data, name) +
    ggplot2::geom_point(alpha = 1 / 3)
  gp
}

#' @export
plot_residuals.factor <- function(x, name, residuals, ...) {
  data <- tibble(x, residuals)
  data <- dplyr::filter(data, !is.na(x), !is.na(residuals))

  if (length(unique(data$x)) <= 1) {
    return(invisible(NULL))
  }

  gp <- ggplot_residuals(data, name) +
    ggplot2::geom_jitter(alpha = 1 / 3, width = 0.20) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1))
  gp
}

is_multiple_values <- function(x) {
  length(unique(x[!is.na(x)])) > 1
}

#' @export
plot_residuals.mb_analysis <- function(x, ...) {
  residuals <- residuals(x)
  fit <- fitted(x)
  variables <- dplyr::select_(
    residuals, ~ -estimate, ~ -sd, ~ -zscore,
    ~ -lower, ~ -upper, ~ -pvalue
  )
  variables$fit <- fit$estimate

  residuals <- residuals$estimate

  variables <- dplyr::select(variables, order(names(variables)))
  variables <- purrr::discard(variables, is.character)
  variables <- purrr::keep(variables, is_multiple_values)

  plots <- purrr::map2(variables, names(variables), plot_residuals, residuals = residuals)
  plots <- purrr::discard(plots, is.null)
  plots
}

#' Analyse Residuals
#'
#' @param x The mb_analysis object to analyse the residuals for.
#' @export
analyse_residuals <- function(x) {
  .NotYetImplemented()
  # residuals <- residuals(x)
  # data <- dplyr::select_(residuals, ~-estimate, ~-sd, ~-zscore, ~-lower, ~-upper, ~-pvalue)
  #
  # data %<>% dplyr::select(order(names(.))) %>%
  #   purrr::discard(is.character) %>%
  #   purrr::keep(is_multiple_values)
  #
  # models <- p0("residual ~ ", names(data)) %>% c("residual ~ 1", .) %>%
  #   purrr::map(model) %>%
  #   as.models()
  #
  # names(models) <- c("null", names(data))
  # data$residual <- residuals$estimate
  #
  # analyses <- analyse(models, data = data, glance = FALSE, beep = FALSE)
  # ic <- IC(analyses) %>%
  #   dplyr::select_(~model, ~K, ~IC) %>%
  #   dplyr::mutate(DeltaIC = IC - dplyr::first(IC)) %>%
  #   dplyr::arrange_(~IC)
  # ic
}
