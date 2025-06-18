#' Code
#'
#' Gets the MB code for an object.
#'
#' @param object The object.
#' @param ... Additional arguments.
#' @return An object inheriting from class mb_code.
#' @export
code <- function(object, ...) {
  UseMethod("code")
}

#' @export
code.mb_model <- function(object, ...) {
  chk_unused(...)
  object$code
}

#' @export
code.mb_analysis <- function(object, ...) {
  chk_unused(...)
  code(model(object), ...)
}
