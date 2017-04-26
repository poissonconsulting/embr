#' Coerce to an mb_model object
#'
#' @param x object to coerce.
#' @param ... Unused.
#' @export
as.model <- function(x, ...) {
  UseMethod("as.model")
}

#' Coerce to an mb_models object
#'
#' @param x object to coerce.
#' @param ... Unused.
#' @export
as.models <- function(x, ...) {
  UseMethod("as.models")
}

#' @export
as.mcmcr.mb_analysis <- function(x, ...) {
  if (is.null(x$mcmcr)) error("as.mcmcr is undefined for x")
  x$mcmcr
}

#' @export
as.model.mb_analysis <- function(x, ...) {
  model(x)
}

#' @export
as.models.mb_model <- function(x, ...) {
  object <- list(models = x)
  class(object) <- "mb_models"
  object
}

#' @export
as.models.list <- function(x, ...) {
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
as.models.mb_analysis <- function(x, ...) {
  as.models(model(x), ...)
}

#' @export
as.models.mb_analyses <- function(x, ...) {
  x %<>% purrr::map(model)
  as.models(x)
}
