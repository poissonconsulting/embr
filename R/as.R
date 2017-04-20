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
  models(list)
}

#' @export
as.models.mb_analysis <- function(x, ...) {
  as.models(model(x), ...)
}

#' @export
as.models.mb_analyses <- function(x, ...) {
  models(x)
}
