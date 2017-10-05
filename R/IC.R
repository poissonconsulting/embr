#' Information Criterion
#'
#' Calculates Information Criterion for an analysis.
#'
#' @param object The object to calculate the IC for.
#' @param ... Not used.
#' @return The Information Criteron as a number.
#' @export
IC <- function(object, ...) {
  UseMethod("IC")
}

#' @export
IC.mb_analysis <- function(object, ...) {
  if (!is_bayesian(object)) {
    K <- nterms(object, include_constant = FALSE)
    n <- sample_size(object)
    c <- 2 * K * (K + 1) / (n - K - 1)
    return(2 * K - 2 * logLik(object) + c)
  }
  logLik <- logLik_matrix(object)

  npars <- logLik %>%
    matrixStats::colVars() %>%
    sum()

  logLik %<>%
    logColMeansExp() %>%
    sum()

  ic <- -2 * (logLik - npars)
  ic
}

#' @export
IC.mb_analyses <- function(object, ...) {
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
  tibble$IC <- vapply(object, IC, 1, ...)

  tibble$DeltaIC <- tibble$IC - min(tibble$IC)
  tibble$ICWt <- exp(-0.5 * tibble$DeltaIC)
  tibble$ICWt <- tibble$ICWt / sum(tibble$ICWt)

  tibble$DeltaIC %<>% round(1)
  tibble$ICWt %<>% round(2)
  tibble
}
