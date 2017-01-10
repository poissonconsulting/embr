#' Number of terms
#'
#' @param x The object to get the nterms for
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... unused
#' @export
nterms.mb_analysis <- function(x, param_type = "fixed", include_constant = TRUE, ...) {

  check_scalar(param_type, c("fixed", "random", "derived"))
  check_flag(include_constant)

  length(terms(x, param_type = param_type, include_constant = include_constant))
}

#' Terms
#'
#' terms
#'
#' @param x The mb_analysis object.
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... Not used.
#' @export
terms.mb_analysis <- function(x, param_type = "fixed", include_constant = TRUE, ...) {
  check_scalar(param_type, c("fixed", "random", "derived"))
  check_flag(include_constant)

  coef(x, param_type = param_type, include_constant = include_constant)$term
}
