#' Number of terms
#'
#' @param x The object to get the nterms for
#' @param fixed A flag specifying whether fixed or random terms.
#' @param include_constant A flag specifying whether to include constant terms.
#' @param ... unused
#' @export
nterms.mb_analysis <- function(x, fixed = TRUE, include_constant = TRUE, ...) {
  
  check_flag(fixed)
  check_flag(include_constant)

  length(terms(x, fixed = fixed, include_constant = include_constant))
}
