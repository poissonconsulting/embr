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
  x %<>%
    dplyr::select_(~term, ~estimate) %>%
    dplyr::mutate_(parameter = ~str_replace(term, "^(\\w+)(.*)", "\\1")) %>%
    plyr::dlply(~parameter, lmcmcarray)

  class(x) <- "mcmcr"

  x %<>% sort()
  x
}

#' @export
as.mcmcr.mb_analysis <- function(x, ...) {
  if (!is.null(x$mcmcr)) return(x$mcmcr)

  x %<>%
    coef("all") %>%
    as.mcmcr()
  x
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
      error("all elements must inherit from 'mb_model'")

    class <- purrr::map(x, class)
    if (!identical(length(unique(class)), 1L))
      error("all model objects must have the same class")

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
      error("all objects must inherit from 'mb_analysis'")
    data <- purrr::map(x, data_set)
    if (!identical(length(unique(data)), 1L))
      error("all analysis objects must have the same data")
  }
  class(x) <- "mb_analyses"
  x
}
