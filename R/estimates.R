#' Estimates
#'
#' estimates
#'
#' @param object The mb_analysis object.
#' @param terms A string of the type of terms to get the coefficients for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
estimates.mb_analysis <- function(object, terms = "fixed", scalar_only = FALSE, ...) {
  check_vector(terms, c("^fixed$", "^random$", "^random$"), max_length = 1)

  check_flag(scalar_only)
  check_unused(...)

  if (is.null(object$mcmcr)) error("estimates is undefined for object")

  estimates <- estimates(object$mcmcr)

  if (scalar_only) estimates %<>% lapply(function (x) {if(nterms(x) == 1) return(NULL); x})

  estimates
}
