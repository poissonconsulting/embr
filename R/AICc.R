#' Akaike's Information Criteron
#'
#' Calculates marginal AICc for an analysis.
#'
#' By default the sample size is assumed to be the number of rows
#' in the analysis data set. To override manually set n to be an integer ie n = 10L.
#' To calculate AIC (as opposed to AICc) set n = Inf.
#'
#' @param object The object to calculate the AIC for.
#' @param ... Not used.
#' @return The Akaike's Information Criteron as a number.
#' @export
AICc <- function(object, ...) {
  UseMethod("AICc")
}

#' @export
AICc.numeric <- function(object, K, n = Inf, ...) {
  c <- 2 * K * (K + 1) / (n - K - 1)
  2 * K - 2 * object + c
}

#' @export
AICc.list <- function(object, n = NULL, ...) {
  if (!is.list(object)) error("object must be a list")

  if (!length(object)) return(dplyr::data_frame(model = character(0), K = integer(0), AICc = numeric(0),
                                                DeltaAICc = numeric(0), AICcWt = numeric(0)))

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
  tibble$K <- vapply(object, nterms, 1L, include_constant = FALSE)
  tibble$AICc <- vapply(object, AICc, 1, n = n, ...)
  tibble$DeltaAICc <- tibble$AICc - min(tibble$AICc)
  tibble$AICcWt <- exp(-0.5 * tibble$DeltaAICc)
  tibble$AICcWt <- tibble$AICcWt / sum(tibble$AICcWt)

  tibble$DeltaAICc %<>% round(1)
  tibble$AICcWt %<>% round(2)
  tibble
}

#' @export
AICc.mb_analysis <- function(object, n = NULL, ...) {
  K <- nterms(object, include_constant = FALSE)
  n <- sample_size(object)
  AICc(logLik(object), K = K, n = n)
}

#' @export
AICc.mb_null_analysis <- function(object, n = NULL, ...) {
  NA_real_
}
