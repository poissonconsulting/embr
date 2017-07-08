#' Update Normal Priors
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
update_normal_priors <- function(object, multiplier = 2, ...) {
  UseMethod("update_normal_priors")
}

#' @export
update_normal_priors.character <- function(object, multiplier = 2, ...) {
  object %<>% code(object)
  object %<>% update_normal_priors(multiplier = multiplier, ...)
  template(object)
}

#' @export
update_normal_priors.mb_code <- function(object, multiplier = 2, ...) {
  error("adjust is not defined for objects of the virtual class 'mb_code'")
}

update_normal_priors_model <- function(multiplier, object) {
  code <- code(object)
  code %<>% update_normal_priors(multiplier = multiplier)
  object %<>% update_model(code = code)
  object
}

#' @export
update_normal_priors.mb_model <- function(object, multiplier = c(0.5, 2), ...) {
  check_vector(multiplier, 1)
  check_unique(multiplier)
  if (any(multiplier <= 0)) error("multiplier(s) must be greater than 0")
  if (length(multiplier) == 1) return(update_normal_priors_model(multiplier, object))
  models <- lapply(multiplier, update_normal_priors_model, object)
  names(models) <- stringr::str_c("m_", multiplier)
  as.models(models)
}

#' @export
update_normal_priors.mb_analysis <- function(
  object, multiplier = c(0.5, 2),
  parallel = getOption("mb.parallel", FALSE), quick = getOption("mb.quick", FALSE),
  quiet = getOption("mb.quiet", TRUE), beep = getOption("mb.beep", TRUE), ...) {

  model <- model(object)
  model %<>% update_normal_priors(multiplier = multiplier)
  model %<>% analyse(data = data_set(object), parallel = parallel,
            quick = quick, quiet = quiet, beep = beep)
  model
}
