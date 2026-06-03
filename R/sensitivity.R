#' Summarize model sensitivity
#'
#' @param x The mb_analysis object.
#' @param by A string indicating whether to determine by "term", "parameter", or
#'   "all".
#' @param param_type A string specifying which parameters to include: 'fixed',
#'   'random', 'derived', 'primary', or 'all'.
#' @param ... Arguments passed to [add_sensitivity()].
#'
#' @return A dataframe summarizing the sensitivity of the analysis object.
#' @export
sensitivity <- function(x, by = "term", param_type = "all", ...) {
  UseMethod("sensitivity")
}

#' @export
sensitivity.mb_analysis <- function(x, by = "term", param_type = "all", ...) {
  check_mb_analysis(x)
  chk_string(by)
  chk_subset(by, c("all", "parameter", "term"))
  chk_string(param_type)
  chk_subset(param_type, c("fixed", "random", "derived", "primary", "all"))

  x <- add_sensitivity(x, ...)
  ps <- x$sensitivity

  if (param_type != "all") {
    params <- pars(x, param_type)
    ps <- ps[stringr::str_remove_all(ps$term, "\\[.*\\]") %in% params, , drop = FALSE]
  }

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
