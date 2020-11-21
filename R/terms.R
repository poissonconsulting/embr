#' @export
stats::terms

#' Number of terms
#'
#' @param x The object to get the nterms for
#' @param param_type A string indicating the type of terms to get the names for.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... unused
#' @export
nterms.mb_analysis <- function(x, param_type = "fixed", include_constant = TRUE, ...) {
 length(terms(x, param_type = param_type, include_constant = include_constant))
}

#' Terms
#'
#' terms
#'
#' @param x The mb_analysis object.
#' @param param_type A string indicating the type of terms to get the names for.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... Not used.
#' @export
terms.mb_analysis <- function(x, param_type = "fixed", include_constant = TRUE, ...) {
  coef(x, param_type = param_type, include_constant = include_constant, simplify = TRUE)$term
}
