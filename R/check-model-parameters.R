#' Check Model Parameters
#'
#' @param x The model code to check.
#' @param fixed A string of a regular expression specifying the fixed parameters to monitor.
#' @param random NULL or a character vector of the random effects.
#' @param derived NULL or a character vector of the derived parameters.
#' @param drops NULL or a character vector of the parameters to drop.
#' @return The possibly updated derived parameters.
#' @export
check_model_pars <- function(x, fixed, random, derived, drops) {
  UseMethod("check_model_pars")
}

#' @export
check_model_pars.mb_code <- function(x, fixed, random, derived, drops) {
  chk_string(fixed)
  checkor(check_null(random), check_vector(random, character(0)))
  checkor(check_null(derived), check_vector(derived, character(0)))
  checkor(check_null(drops), check_vector(drops, character(0)))

  pars <- pars(x)

  if (!any(str_detect(pars, fixed)))
    err("fixed does not match any code parameters")

  if (length(random) && !all(random %in% pars))
    err("random effects parameters missing from code parameters")

  if (length(derived) && !all(derived %in% pars))
    err("derived parameters missing from code parameters")

  if (length(drops) && !all(unlist(drops) %in% pars))
    err("drops parameters missing from code parameters")

  derived
}
