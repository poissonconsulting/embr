#' Information Criterion
#'
#' Calculate default information criterion.
#'
#' @param object The object to calculate it for.
#' @param n A count of the sample size.
#' @param ... Not used.
#' @export
IC <- function(object, n = NULL, ...) {
  UseMethod("IC")
}

#' Information Criterion Weight
#'
#' Calculates w_i for a list of objects of class mb_analysis that return IC.
#'
#' @param analyses The list of mb_analysis objects to calculate it for.
#' @param n A count of the sample size.
#' @return A vector of the w_i values for each model.
#' @export
ICw <- function(analyses, n = NULL) {
  if (!is.list(analyses)) error("analyses must be a list")
  if (!all(vapply(analyses, is.mb_analysis, TRUE))) error("analyses must be a list of mb_analysis objects")

  class <- vapply(analyses, function(x) class(x)[1], "", USE.NAMES = FALSE)
  if (!all(vapply(class, identical, TRUE, class[1]))) error("all elements of analyses must have the same class")

  data <- lapply(analyses, data_set)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of analyses must have the same data")

  IC <- vapply(analyses, IC, 1, n = n)
  IC <- IC - min(IC)
  IC <- exp(-0.5 * IC)
  IC <- IC / sum(IC)
  IC %<>% round(2)
  IC
}
