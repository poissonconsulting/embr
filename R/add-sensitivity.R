#' Add sensitivity data frame to an analysis object
#'
#' Computes power-scaling sensitivity and stores the result as `x$sensitivity`.
#' Subsequent calls return `x` unchanged unless `replace = TRUE`.
#'
#' @param x The object.
#' @param ... Arguments passed to [powerscale_sensitivity()].
#' @param new_expr An optional new expression to use for the sensitivity
#'   analysis. Uses the new expression in the analysis object by default.
#' @param replace A flag specifying whether to replace an existing sensitivity
#'   data frame.
#' @return The analysis object with a `sensitivity` data frame field.
#' @export
add_sensitivity <- function(x, ..., new_expr = NULL, replace = FALSE) {
  UseMethod("add_sensitivity")
}

#' @export
add_sensitivity.mb_analysis <- function(x, ..., new_expr = NULL, replace = FALSE) {
  check_mb_analysis(x)
  chk_flag(replace)

  if (!replace && !is.null(x$sensitivity)) {
    return(x)
  }

  ne <- enexpr_new_expr({{ new_expr }}, default = x$model$new_expr)

  x_ps <- x
  if (!is.null(ne)) {
    new_expr(x_ps) <- ne
  }

  ps <- powerscale_sensitivity(x_ps, ...)
  ps <- data.frame(
    term = ps$variable,
    prior = ps$prior,
    likelihood = ps$likelihood,
    diagnosis = ps$diagnosis
  )

  x$sensitivity <- ps
  x
}
