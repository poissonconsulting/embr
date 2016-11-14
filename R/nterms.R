#' Number of fixed variable terms.
#'
#' @param object The object to calculate the number of terms for.
#' @param ... Not used.
#' @return A count of the number of terms.
#' @export
nterms <- function(object, ...) {
  UseMethod("nterms")
}

#' @export
nterms.mb_analysis <- function(object, ...) {
  nrow(coef(object, terms = "fixed", scalar_only = FALSE, constant_included = FALSE))
}
