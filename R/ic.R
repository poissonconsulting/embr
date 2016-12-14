#' Information Criterion
#'
#' Calculate default information criterion.
#'
#' @param object The object to calculate it for.
#' @param ... Not used.
#' @export
IC <- function(object, ...) {
  UseMethod("IC")
}

#' Akaike's Information Criterion Weight
#'
#' Calculates w_i for a list of objects of class mb_analysis that return AIC.
#'
#' @param x The object to calculate it for.
#' @param ... Not used.
#' @return A vector of the w_i values for each model.
#' @export
AICw <- function(x, ...) {
  if (!is.list(x)) error("x must be a list")
  if (!all(vapply(x, is.mb_analysis, TRUE))) error("x must be a list of mb_analysis objects")

  data <- lapply(x, data_set)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of x must have the same data")

  AIC <- vapply(x, AIC, 1)
  AIC <- AIC - min(AIC)
  AIC <- exp(-0.5 * AIC)
  AIC <- AIC / sum(AIC)
  AIC %<>% round(2)
  AIC
}
