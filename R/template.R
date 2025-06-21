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

#' Set Template
#'
#' Sets the template for an object.
#'
#' @inheritParams template
#' @param value A string of the new template
#' @export
"template<-" <- function(object, value) {
  UseMethod("template<-", object)
}

#' @export
template.mb_code <- function(object, ...) {
  chk_unused(...)
  # FIXME: Return a language object once all components support this

  if (is.call(object$template)) {
    paste(deparse(object$template), collapse = "\n")
  } else {
    object$template
  }
}

#' @export
template.mb_model <- function(object, ...) {
  chk_unused(...)
  template(code(object), ...)
}

#' @export
template.mb_analysis <- function(object, ...) {
  chk_unused(...)
  template(model(object), ...)
}

#' @export
"template<-.mb_code" <- function(object, value) {
  chk_string(value)
  mb_code(value)
}
