#' Number Models
#'
#' @param x the object.
#' @param ... Named objects.
#' @return An integer of the number of models
#' @export
nmodels <- function(x, ...) {
  UseMethod("nmodels")
}

#' @export
nmodels.mb_model <- function(x, ...) 1L

#' @export
nmodels.mb_analysis <- function(x, ...) 1L

#' @export
nmodels.mb_analyses <- function(x, ...) length(x)

#' @export
nmodels.mb_meta_analysis <- function(x, ...) length(x)

#' @export
nmodels.mb_meta_analyses <- function(x, ...) vapply(x, nmodels, 1L)
