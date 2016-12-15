#' Random Effects
#'
#' Gets the random effects definitions for an object inheriting from class mb_model or mb_analysis.
#'
#' @param object The object.
#' @param ... Unused.
#' @return The random effects as a sorted named list.
#' @export
random_effects <- function(object, ...) {UseMethod("random_effects")}

#' @export
random_effects.mb_model <- function(object, ...) {
  check_unused(...)
  object$random_effects
}

#' @export
random_effects.mb_analysis <- function(object, ...) {
  check_unused(...)
  random_effects(model(object))
}
