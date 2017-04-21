#' Update Priors
#'
#' Adjusts standard deviation of simple normal priors in object by multiplier.
#'
#' A simple normal distribution has a mean of 0 and a numeric standard deviation
#' (without truncation).
#'
#' @inheritParams stringr::str_replace
#' @param object The object to adjust the priors for.
#' @param multiplier A positive number indicating the adjustment to the standard deviation as a multiplier.
#' @param ...  Additional arguments.
#' @export
update_priors <- function(object, multiplier = 2, ...) {
  UseMethod("update_priors")
}

#' @export
update_priors.character <- function(object, multiplier = 2, ...) {
  check_number(multiplier)
  if (multiplier <= 0) error("multiplier must be greater than 0")
  object %<>% code(object)
  object %<>% update_priors(multiplier = multiplier, ...)
  template(object)
}

#' @export
update_priors.mb_code <- function(object, multiplier = 2, ...) {
  error("adjust is not defined for objects of the virtual class 'mb_code'")
}

#' @export
update_priors.mb_model <- function(object, multiplier = 2, ...) {
  check_number(multiplier)
  if (multiplier <= 0) error("multiplier must be greater than 0")
  code <- code(object)
  code %<>% update_priors(multiplier = multiplier)
  object %<>% update_model(code = code)
  object
}
