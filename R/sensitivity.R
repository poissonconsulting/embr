#' Summarize model sensitivity
#'
#' @param x The mb_analysis object.
#' @param by A string indicating whether to determine by "term", "parameter", or
#'   "all".
#' @param ...  Additional arguments passed to
#' [priorsense::powerscale_sensitivity()].
#'
#' @return A dataframe summarizing the sensitivity of the analysis object.
#' @export
sensitivity <- function(x, by = "term", ...) {
  UseMethod("sensitivity")
}

#' Summarize model sensitivity
#'
#' @param x The mb_analysis object.
#' @param by A string indicating whether to determine by "term", "parameter", or
#'   "all".
#' @param ... Additional arguments passed to
#' [priorsense::powerscale_sensitivity()].
#'
#' @export
sensitivity.mb_analysis <- function(x, by = "term", ...) {
  check_mb_analysis(x)
  chk_string(by)
  chk_subset(by, c("all", "parameter", "term"))

  ps <- powerscale_sensitivity(x, ...)
  ps <- data.frame(
    term = ps$variable,
    prior = ps$prior,
    likelihood = ps$likelihood,
    diagnosis = ps$diagnosis
  )

  if (by == "term") {
    return(ps)
  } else if (by == "parameter") {
    ps <-
      ps |>
      dplyr::mutate(
        term = stringr::str_remove_all(string = .data$term, pattern = "\\[.*\\]")
      ) |>
      dplyr::group_by(.data$term) |>
      dplyr::summarize(
        term = dplyr::first(.data$term),
        prior = max(.data$prior, na.rm = TRUE),
        likelihood = min(.data$likelihood, na.rm = TRUE),
        .groups = "drop"
      ) |>
      dplyr::select(parameter = "term", "prior", "likelihood") |>
      as.data.frame()
    return(ps)
  } else if (by == "all") {
    ps <-
      ps |>
      dplyr::summarize(
        all = "all",
        prior = max(.data$prior, na.rm = TRUE),
        likelihood = min(.data$likelihood, na.rm = TRUE),
        .groups = "drop"
      )
    return(ps)
  }
}
