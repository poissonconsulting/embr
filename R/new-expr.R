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
  if (is.null(object$new_expr)) return(character(0))
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
