#' Summarize model sensitivity
#'
#' @param x The mb_analysis object.
#' @param by A string indicating whether to determine by "term", "parameter",
#'   or "all".
#' @param param_type A string specifying which parameters to include: 'fixed',
#'   'random', 'derived', 'primary', or 'all'.
#' @param mb.prior_cjs A number specifying the CJS threshold for weak prior 
#'   classification.
#' @param mb.lik_cjs A number specifying the CJS threshold for strong data 
#'   classification.
#' @param ... Arguments passed to [add_sensitivity()].
#'
#' @return A tibble summarizing the sensitivity of the analysis object.
#' @export
sensitivity <- function(x, by = "term", param_type = "all",
                        mb.prior_cjs = getOption("mb.prior_cjs", 0.1),
                        mb.lik_cjs = getOption("mb.lik_cjs", 0.05), ...) {
  UseMethod("sensitivity")
}

#' @export
sensitivity.mb_analysis <- function(x, by = "term", param_type = "all",
                                    mb.prior_cjs = getOption("mb.prior_cjs", 0.1),
                                    mb.lik_cjs = getOption("mb.lik_cjs", 0.05),
                                    ...) {
  check_mb_analysis(x)
  chk_string(by)
  chk_subset(by, c("all", "parameter", "term"))
  chk_string(param_type)
  chk_subset(param_type, c("fixed", "random", "derived", "primary", "all"))
  chk_number(mb.prior_cjs)
  chk_gt(mb.prior_cjs, 0)
  chk_number(mb.lik_cjs)
  chk_gt(mb.lik_cjs, 0)

  x <- add_sensitivity(x, ...)

  ps <-
    x$sensitivity |>
    dplyr::as_tibble() |>
    dplyr::mutate(term = mcmcr::as_term(.data$term)) |>
    dplyr::mutate(parameter = term::pars_terms(.data$term)) |>
    dplyr::filter(!is.nan(.data$prior)) |>
    dplyr::select(
      "parameter", "term", "prior", "likelihood"
    ) |>
    dplyr::mutate(
      dplyr::across(c("prior", "likelihood"), \(x) round(x, 3)),
      weak_prior = .data$prior < mb.prior_cjs,
      strong_data = .data$likelihood >= mb.lik_cjs
    ) |>
    dplyr::arrange(.data$term)

  if (param_type != "all") {
    params <- pars(x, param_type)
    ps <- dplyr::filter(ps, .data$parameter %in% params)
  }

  if (by == "parameter") {
    ps <-
      ps |>
      dplyr::group_by(.data$parameter, .data$weak_prior, .data$strong_data) |>
      dplyr::summarize(
        prior = max(.data$prior, na.rm = TRUE),
        likelihood = min(.data$likelihood, na.rm = TRUE),
        nterms = dplyr::n(),
        .groups = "drop"
      ) |>
      dplyr::select(
        "parameter", "nterms", "prior", "likelihood",
        "weak_prior", "strong_data"
      ) |>
      dplyr::arrange(.data$parameter, .data$weak_prior, .data$strong_data)
  } else if (by == "all") {
    ps <-
      ps |>
      dplyr::group_by(.data$weak_prior, .data$strong_data) |>
      dplyr::summarize(
        prior = max(.data$prior, na.rm = TRUE),
        likelihood = min(.data$likelihood, na.rm = TRUE),
        nterms = dplyr::n(),
        .groups = "drop"
      ) |>
      dplyr::select(
        "nterms", "prior", "likelihood", "weak_prior", "strong_data"
      ) |>
      dplyr::arrange(.data$weak_prior, .data$strong_data)
  }
  ps
}
