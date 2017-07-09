#' Information Criterion
#'
#' Calculates Information Criterion for an analysis.
#'
#' @param object The object to calculate the IC for.
#' @param n An count of the sample size. If NULL it is assumed to be the number of rows in the data.
#' @param ... Not used.
#' @return The Information Criteron as a number.
#' @export
IC <- function(object, n = NULL, ...) {
  UseMethod("IC")
}

#' @export
IC.list <- function(object, ...) {
  .Deprecated("IC.mb_analyses")
  class(object) <- "mb_analyses"
  IC(object, ...)
}

#' @export
IC.mb_analysis <- function(object, n = NULL, ...) {
  checkor(check_null(n), check_count(n))
  K <- nterms(object, include_constant = FALSE)
  if (is.null(n))
    n <- sample_size(object)
  c <- 2 * K * (K + 1) / (n - K - 1)
  2 * K - 2 * logLik(object) + c
}

#' @export
IC.mb_analyses <- function(object, n = NULL, ...) {
  if (!length(object)) {
    return(dplyr::data_frame(
      model = character(0), K = integer(0), IC = numeric(0),
      DeltaIC = numeric(0), ICWt = numeric(0)))
  }
  if (!all(vapply(object, is.mb_analysis, TRUE)))
    error("object must be a list of mb_analysis objects")

  if (is.null(names(object))) names(object) <- 1:length(object)

  if (anyDuplicated(names(object))) error("objects must be uniquely named")

  data <- llply(object, data_set)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of object must have the same data")

  random_effects <- llply(object, random_effects) %>% llply(sort_random_effects)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of object must have the same random effects")

  tibble <- dplyr::data_frame(model = names(object))
  tibble$K <- vapply(object, nterms, 1L, include_constant = FALSE)
  tibble$IC <- vapply(object, IC, 1, n = n, ...)

  tibble$DeltaIC <- tibble$IC - min(tibble$IC)
  tibble$ICWt <- exp(-0.5 * tibble$DeltaIC)
  tibble$ICWt <- tibble$ICWt / sum(tibble$ICWt)

  tibble$DeltaIC %<>% round(1)
  tibble$ICWt %<>% round(2)
  tibble
}
