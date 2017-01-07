#' Terms
#'
#' terms
#'
#' @param x The mb_analysis object.
#' @param fixed A flag specifying whether fixed or random terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... Not used.
#' @export
terms.mb_analysis <- function(x, fixed = TRUE, include_constant = TRUE, ...) {
  check_flag(fixed)
  check_flag(include_constant)

  coef(x, fixed = fixed, include_constant = include_constant)$term
}
