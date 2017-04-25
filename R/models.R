#' MB Models
#'
#' Creates or retrieves an object inherting from class mb_models.
#'
#' @param x The object.
#' @param ... Additional arguments.
#' @return An object inheriting from class mb_models.
#' @export
models <- function(x, ...) {
  UseMethod("models")
}

#' @export
models.list <- function(x, ...) {
  check_uniquely_named_list(x)
  if (!length(x)) error("x must be length 1 or greater")

  if (!all(purrr::map_lgl(x, is.mb_model)))
    error("all elements in x must inherit from 'mb_model'")

  classes <- purrr::map(x, class)
  if (!all(purrr::map_lgl(classes, identical, classes[[1]])))
    error("all models in x must have the same class")

  class(x) <- "mb_models"
  x
}

#' @export
models.mb_analyses <- function(x, ...) {
  x$models
}
