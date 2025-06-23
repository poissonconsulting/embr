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
as.mcmcr.mb_analysis_coef <- function(x, ...) {
  chk_unused(...)
  x <- dplyr::select(x, "term", "estimate")
  x <- dplyr::mutate_(x, parameter = ~ sub("^(\\w+)(.*)", "\\1", term))
  x <- plyr::dlply(x, ~parameter, lmcmcarray)

  class(x) <- "mcmcr"

  x <- sort(x)
  x
}

#' @export
as.mcmcr.mb_analysis <- function(x, ...) {
  chk_unused(...)
  if (!is.null(x$mcmcr)) {
    return(x$mcmcr)
  }

  # this needs switching off by removing lm and replacing R function based optimizer
  x <- coef(x, "all")
  x <- as.mcmcr(x)
  x
}

#' @export
as.model.mb_analysis <- function(x, ...) {
  chk_unused(...)
  model(x)
}

#' @export
as.models.mb_model <- function(x, ...) {
  chk_unused(...)
  as.models(list(x))
}

#' @export
as.models.list <- function(x, ...) {
  chk_unused(...)
  if (!is.list(x)) err("x must be a list", tidy = FALSE)

  if (length(x)) {
    if (!all(purrr::map_lgl(x, is.mb_model))) {
      err("all elements must inherit from 'mb_model'", tidy = FALSE)
    }

    class <- purrr::map(x, class)
    if (!identical(length(unique(class)), 1L)) {
      err("all model objects must have the same class", tidy = FALSE)
    }
  }
  class(x) <- "mb_models"
  x
}

#' @export
as.models.mb_analysis <- function(x, ...) {
  chk_unused(...)
  as.models(model(x))
}

#' @export
as.models.mb_analyses <- function(x, ...) {
  chk_unused(...)
  x <- purrr::map(x, model)
  as.models(x)
}

#' @export
as.mcmcrs.mb_analyses <- function(x, ...) {
  chk_unused(...)
  x <- purrr::map(x, as.mcmcr)
  mcmcr::as.mcmcrs(x)
}

#' @export
as.analyses.list <- function(x, ...) {
  chk_unused(...)
  if (!is.list(x)) err("x must be a list", tidy = FALSE)

  if (length(x)) {
    if (!all(purrr::map_lgl(x, is.mb_analysis))) {
      err("all objects must inherit from 'mb_analysis'", tidy = FALSE)
    }
    data <- purrr::map(x, data_set)
    if (!identical(length(unique(data)), 1L)) {
      err("all analysis objects must have the same data", tidy = FALSE)
    }
  }
  class(x) <- "mb_analyses"
  x
}
