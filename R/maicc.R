#' Akaike's Information Criteron
#'
#' Calculates marginal AICc for an analysis.
#'
#' By default the sample size is assumed to be the number of rows
#' in the analysis data set. To override manually set n to be an integer ie n = 10L.
#' To calculate mAIC (as opposed to mAICc) set n = Inf.
#'
#' @param object The object to calculate the AIC for.
#' @param ... Not used.
#' @return The Akaike's Information Criteron as a number.
#' @export
mAICc <- function(object, ...) {
  UseMethod("mAICc")
}

#' @export
mAICc.numeric <- function(object, nterms, n = Inf, ...) {
  c <- 2 * nterms * (nterms + 1) / (n - nterms - 1)
  2 * nterms - 2 * object + c
}

#' @export
mAICc.list <- function(object, n = NULL, ...) {
  if (!is.list(object)) error("object must be a list")

  if (!length(object)) return(dplyr::data_frame(model = character(0), k = integer(0), ic = numeric(0),
                                                difference = numeric(0), weight = numeric(0)))

  if (!all(vapply(object, is.mb_analysis, TRUE))) error("object must be a list of mb_analysis objects")

  if (is.null(names(object))) names(object) <- 1:length(object)

  if (anyDuplicated(names(object))) error("object must be uniquely named")

  class <- vapply(object, function(x) class(x)[1], "", USE.NAMES = FALSE)
  if (!all(vapply(class, identical, TRUE, class[1]))) error("all elements of object must have the same class")

  data <- lapply(object, data_set)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of object must have the same data")

  random_effects <- lapply(object, random_effects) %>% lapply(sort_random_effects)
  if (!all(vapply(data, identical, TRUE, data[[1]]))) error("all elements of object must have the same random effects")

  tibble <- dplyr::data_frame(model = names(object))
  tibble$k <- vapply(object, nterms, 1L, include_constant = FALSE)
  tibble$ic <- vapply(object, mAICc, 1, n = n, ...)
  tibble$difference <- tibble$ic - min(tibble$ic)
  tibble$weight <- exp(-0.5 * tibble$difference)
  tibble$weight <- tibble$weight / sum(tibble$weight)

  tibble$difference %<>% round(1)
  tibble$weight %<>% round(2)
  tibble
}

#' @export
mAICc.mb_analysis <- function(object, n = NULL, ...) {
  return(NA_real_)
}
