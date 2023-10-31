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
  chk_null_or(random, vld = vld_character)
  chk_null_or(derived, vld = vld_character)
  chk_null_or(drops, vld = vld_character)

  pars <- pars(x)

  if (!any(grepl(fixed, pars))) {
    err("fixed does not match any code parameters", tidy = FALSE)
  }

  if (length(random) && !all(random %in% pars)) {
    err("random effects parameters missing from code parameters", tidy = FALSE)
  }

  if (length(derived) && !all(derived %in% pars)) {
    err("derived parameters missing from code parameters", tidy = FALSE)
  }

  if (length(drops) && !all(unlist(drops) %in% pars)) {
    err("drops parameters missing from code parameters", tidy = FALSE)
  }

  # This should return the derived parameters for compatibility with
  # packages that implement embr methods
  invisible(derived)
}
