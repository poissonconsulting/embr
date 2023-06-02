#' new_expr
#'
#'
#' @param object The object to get for.
#' @param ... Not used.
#' @return The new_expr
#' @export
new_expr <- function(object, ...) {
  UseMethod("new_expr")
}

#' @export
new_expr.mb_model <- function(object, ...) {
  object$new_expr
}

#' @export
new_expr.mb_models <- function(object, ...) {
  lapply(object, new_expr)
}

#' @export
new_expr.mb_analysis <- function(object, ...) {
  new_expr(model(object))
}

#' @export
new_expr.mb_analyses <- function(object, ...) {
  lapply(object, new_expr)
}

#' @export
new_expr.mb_meta_analysis <- function(object, ...) {
  lapply(object, new_expr)
}

#' @export
new_expr.mb_meta_analyses <- function(object, ...) {
  lapply(object, new_expr)
}


#' new_expr set
#'
#'
#' @param object The object to set for.
#' @param value The new value of new expr.
#' @return The modified object.
#' @export
`new_expr<-` <- function(object, value) {
  UseMethod("new_expr<-")
}

#' @export
`new_expr<-.mb_model` <- function(object, value) {
  if (is.character(value)) {
    value <- parse(text = value)
    chk_length(value)
    value <- value[[1]]
  }
  chk_true(is.call(value))
  object$new_expr <- value
  object
}

#' @export
`new_expr<-.mb_analysis` <- function(object, value) {
  new_expr(object$model) <- value
  object
}

#' Collect new_expr argument
#'
#' With compatibility support for passing the expression as a string.
#'
#' @param new_expr Must be passed as `{{ new_expr }}` by the caller.
#' @param default A quoted expression to use as fallback.
#' @return `new_expr` quoted and (if needed) parsed, or `default` if `new_expr` is `NULL`.
#' @noRd
enexpr_new_expr <- function(new_expr, default = NULL) {
  new_expr <- enquo(new_expr)
  if (quo_is_null(new_expr)) {
    new_expr <- default
  } else {
    new_expr <- quo_get_expr(new_expr)
  }

  if (is.character(new_expr)) {
    new_expr <- parse_expr(new_expr)
    chk_length(new_expr)
    new_expr <- new_expr[[1]]
  }

  chk(is.call(new_expr))
  new_expr
}
