#' Check Model Parameters
#'
#' @inheritParams model.mb_code
#' @param x The model code to check.
#' @param random NULL or A character vector of the random effects.
#' @param derived A character vector of the derived parameters.
#' @param drops A character vector of the parameters to drop.
#' @return If passes all checks, an invisible copy of x. Otherwise throws an informative error.
#' @export
check_model_parameters <- function(x, fixed, random, derived, drops) {
  UseMethod("check_model_parameters")
}

#' @export
check_model_parameters.mb_code <- function(x, fixed, random, derived, drops) {
  check_string(fixed)
  checkor(check_null(random), check_vector(random, character(0), min_length = 0))
  checkor(check_null(derived), check_vector(derived, character(0), min_length = 0))
  checkor(check_null(drops), check_vector(drops, character(0), min_length = 0))

  if (!any(str_detect(parameters(x, param_type = "fixed"), fixed)))
    error("fixed does not match any fixed code parameters")

  if (length(random) && !all(random %in% parameters(x, param_type = "random")))
    error("random effects parameters missing from random code parameters")

  if (length(derived) && !all(derived %in% parameters(x, param_type = "derived")))
    error("derived parameters missing from derived code parameters")

  if (length(drops) && !all(unlist(drops) %in% parameters(x, param_type = "fixed", scalar_only = TRUE)))
    error("drops parameters missing from fixed scalar code parameters")

  invisible(x)
}
