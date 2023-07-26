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
#' Very similar code exists as `mcmcderive:::enexpr_expr()`, the superset of the functionality
#' could be an exported function in mcmcderive.
#'
#' @param new_expr Must be passed as `{{ new_expr }}` by the caller.
#' @param default A quoted expression to use as fallback.
#' @param vectorize A flag specifying whether to vectorize the new_expr code.
#'  vectorize.
#' @noRd
enexpr_new_expr <- function(new_expr, default = NULL, vectorize = FALSE) {
  new_expr <- enquo(new_expr)
  if (quo_is_null(new_expr)) {
    new_expr <- default
  } else {
    if (is.name(quo_get_expr(new_expr))) {
      # For the case where we pass new_expr as a string variable, or perhaps as a variable
      # that holds a quoted expression
      new_expr <- rlang::eval_tidy(new_expr)
    } else {
      new_expr <- quo_get_expr(new_expr)
    }
  }

  if (is.character(new_expr)) {
    # FIXME: Add compatibility warning?
    try_new_expr <- try(parse_expr(new_expr), silent = TRUE)
    if(inherits(try_new_expr, "try-error") && stringr::str_detect(try_new_expr, "must contain exactly 1 expression") && vld_string(new_expr)) {
      new_expr <- paste0("{\n", new_expr, "\n}")
    }
    new_expr <- parse_expr(new_expr)
  }
  if (!is.null(new_expr) && isTRUE(vectorize)) {
    new_expr <- mcmcderive::expression_vectorize(new_expr)
  }

  chk_true(is.call(new_expr) || is.null(new_expr))
  new_expr
}
