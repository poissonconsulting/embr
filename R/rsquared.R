#' R-Squared
#'
#' Calculate the proportion of the variance in the observed data explained
#' by the fit.
#'
#' @param analysis The analysis object.
#' @param observed A string specifying the observed column in the data.
#' @param ... Unused.
#' @export
rsquared <- function(analysis, observed, ...) {
  UseMethod("rsquared")
}

#' @export
rsquared.mb_analysis <- function(analysis, observed, ...) {
  check_string(observed)
  data <- data_set(analysis)
  if (!tibble::has_name(data, observed)) error("column '", observed, "' not found in data")
  observed <- data[[observed]]

  fit <- fitted(analysis)$estimate
  if (length(fit) != nrow(data)) error(observed, " and fitted values are not the same length")

  r2 <- 1 - var(observed - fit) / var(observed)
  r2
}
