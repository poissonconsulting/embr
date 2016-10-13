#' Template
#'
#' Gets the template string for an object.
#'
#' @param object The object.
#' @param ... Additional arguments.
#' @return The template model code as a string.
#' @export
template <- function(object, ...) {
  UseMethod("template")
}

#' @export
template.mb_code <- function(object, ...) {
  check_unused(...)
  object$template
}

#' @export
template.mb_model <- function(object, ...) {
  template(code(object), ...)
}

#' @export
template.mb_analysis <- function(object, ...) {
  template(model(object), ...)
}
