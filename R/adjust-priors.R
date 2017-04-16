#' Adjust Priors
#'
#' Adjusts standard deviation of simple normal priors in object by multiplier.
#'
#' A simple normal distribution has a mean of 0 and a numeric standard deviation
#' (without truncation).
#'
#' @inheritParams stringr::str_replace
#' @param object The object to adjust the priors for.
#' @param multiplier A number indicating the adjustment to the standard deviation as a multiplier.
#' @param ...  Additional arguments.
#' @export
adjust_priors <- function(object, multiplier = 2, ...) {
  UseMethod("adjust_priors")
}

#' @export
adjust_priors.character <- function(object, multiplier = 2, ...) {
  object %<>% code(object)
  object %<>% adjust_priors(multiplier = multiplier, ...)
  template(object)
}

#' @export
adjust_priors.mb_model <- function(object, multiplier = 2, ...) {
  code <- code(object)
  code %<>% adjust_priors(multiplier = multiplier)
  object %<>% update_model(code = code)
  object
}

#' @export
adjust_priors.mb_code <- function(object, multiplier = 2, ...) {
  error("adjust is not defined for objects of the virtual class 'mb_code'")
}
