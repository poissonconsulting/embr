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

#' Coerce to an mb_analyses object
#'
#' @param x object to coerce.
#' @param ... Unused.
#' @export
as.analyses <- function(x, ...) {
  UseMethod("as.analyses")
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
  as.models(list(x))
}

#' @export
as.models.list <- function(x, ...) {
  if (!is.list(x)) error("x must be a list")

  if (length(x)) {
    if (!all(purrr::map_lgl(x, is.mb_model)))
      error("all elements in x must inherit from 'mb_model'")
  }
  class(x) <- "mb_models"
  x
}

#' @export
as.models.mb_analysis <- function(x, ...) {
  as.models(model(x))
}

#' @export
as.models.mb_analyses <- function(x, ...) {
  x %<>% purrr::map(model)
  as.models(x)
}

#' @export
as.mcmcrs.mb_analyses <- function(x, ...) {
  x %<>% purrr::map(as.mcmcr)
  mcmcr::as.mcmcrs(x)
}

#' @export
as.analyses.list <- function(x, ...) {
  if (!is.list(x)) error("x must be a list")

  if (length(x)) {
    if (!all(purrr::map_lgl(x, is.mb_analysis)))
      error("all objects in x must inherit from 'mb_analysis'")
    data <- purrr::map_df(x, data_set)
    if (!identical(length(unique(data)), 1L))
      error("all analysis objects in x must have the same data")
  }
  class(x) <- "mb_analyses"
  x
}
