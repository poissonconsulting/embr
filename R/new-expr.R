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
