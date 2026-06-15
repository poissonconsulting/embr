#' @export
stats::fitted

#' @export
stats::predict

#' Fitted Values
#'
#' Extract fitted values for a MB analysis.
#'
#' The new_expr in the model must include the term 'fit'.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the fitted values.
#' @export
fitted.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "fit")
}

#' Predict from a `mb_analysis` object
#'
#' @description
#' Summarises the posterior predictive distribution at new covariate values.
#' Returns a tidy data frame with point estimates and compatibility limits.
#'
#' @details
#' `new_data` defaults to `data_set(object)` (the analysis dataset). Build
#' covariate grids with
#' [newdata::xnew_data()] and related helpers ([newdata::xnew_seq()],
#' [newdata::xcast()], [newdata::xobs_only()]) for explicit control over
#' which covariates vary. A character vector of column names is also accepted
#' as a shortcut: `predict(analysis, "year")` is equivalent to
#' `predict(analysis, new_data = newdata::xnew_data(data_set(analysis), year))`,
#' which generates a grid varying `year` and holding the rest at their
#' reference values. Covariates not specified are held at a reference value:
#' mean for continuous, first level for factors.
#'
#' `term` selects the quantity defined in the model's `new_expr` to calculate
#' (default `"prediction"`). Pass `new_data = character(0)` to extract a scalar
#' quantity.
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @return A data frame with one row per row of `new_data`, containing the
#'   posterior summary columns produced by [coef.mcmc_data()] and all columns
#'   of `new_data`.
#' @seealso
#' * The [prediction article](https://poissonconsulting.github.io/embr/articles/prediction.html)
#'   for detailed examples of prediction patterns.
#' * [predict.mb_analyses()] for predictions on meta-analysis object.
#' * [mcmc_derive_data.mb_analysis()] for raw MCMC samples paired with
#'   `new_data`, regex term matching, and group-level summaries via
#'   `group_by()` + `summarise()`.
#' * [mcmc_derive.mb_analysis()] for scalar derived quantities and arithmetic
#'   on `mcmcr` posteriors.
#' * [mcmcr::combine_samples()] for combining MCMC samples across independent
#'   analyses on shared data keys.
#' * [newdata::xnew_data()] for building covariate grids.
#' @examples
#' \dontrun{
#' library(newdata)
#' data <- data_set(analysis)
#'
#' # Character shortcut: vary a single column, hold others at reference
#' predict(analysis, "temperature")
#'
#' # Equivalent explicit form
#' xnew_data(data, temperature) |>
#'   predict(analysis, new_data = _)
#'
#' # Set custom sequence for continuous covariate
#' xnew_data(data, xnew_seq(temperature, length_out = 5)) |>
#'   predict(analysis, new_data = _)
#'
#' # Predict for all factor levels and set specific continuous reference value
#' xnew_data(data, site, temperature = 5) |>
#'   predict(analysis, new_data = _)
#'
#' # Predict only for observed combinations of factor levels
#' xnew_data(data, xobs_only(site, annual)) |>
#'   predict(analysis, new_data = _)
#'
#' # Proportional change relative to a 1-row reference state
#' ref <- xnew_data(data, xcast(treatment = "control"))
#' xnew_data(data, treatment) |>
#'   predict(analysis, new_data = _, ref_data = ref)
#'
#' # Predict for first level of random effect levels rather than 'typical'
#' xnew_data(data, temperature) |>
#'   predict(analysis, new_data = _, random_effects = FALSE)
#'
#' # Extract a scalar derived quantity from new_expr
#' predict(analysis, new_data = character(0), term = "eBaseCount")
#' }
#' @export
predict.mb_analysis <- function(
  object,
  new_data = data_set(object),
  new_expr = NULL,
  new_values = list(),
  term = "prediction",
  conf_level = getOption("mb.conf_level", 0.95),
  modify_new_data = NULL,
  ref_data = FALSE,
  ref_fun2 = proportional_change2,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  random_effects = NULL,
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  ...
) {
  chk_number(conf_level)
  chk_range(conf_level, c(0.5, 0.99))

  term <- p0("^", term, "$")

  object <- mcmc_derive_data(
    object,
    new_data = new_data,
    new_expr = {{ new_expr }},
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    ref_fun2 = ref_fun2,
    new_expr_vec = new_expr_vec,
    random_effects = random_effects,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE,
    ...
  )

  object <- coef(object, conf_level = conf_level)

  object
}

#' Predict from a `mb_analyses` object
#'
#' Returns IC-weighted model-averaged predictions across an `mb_analyses` list.
#'
#' @inheritParams predict.mb_analysis
#' @return A data frame with one row per row of `new_data`.
#' @seealso [predict.mb_analysis()] for full argument documentation and
#'   examples.
#' @export
predict.mb_analyses <- function(
  object,
  new_data = data_set(object),
  new_expr = NULL,
  new_values = list(),
  term = "prediction",
  conf_level = getOption("mb.conf_level", 0.95),
  modify_new_data = NULL,
  ref_data = FALSE,
  ref_fun2 = proportional_change2,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  ...
) {
  ic <- IC(object)

  prediction <- lapply(
    object,
    predict,
    new_data = new_data,
    new_expr = {{ new_expr }},
    new_values = new_values,
    term = term,
    conf_level = conf_level,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    ref_fun2 = ref_fun2,
    new_expr_vec = new_expr_vec,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE
  )

  if (!all(is.finite(ic$IC))) {
    prediction <- dplyr::mutate(
      prediction[[1]],
      estimate = NA_real_,
      sd = NA_real_,
      zscore = NA_real_,
      lower = NA_real_,
      upper = NA_real_,
      pvalue = NA_real_
    )
    return(prediction)
  }

  new_data <- prediction[[1]]
  new_data <- dplyr::select_(
    new_data,
    ~ -estimate,
    ~ -sd,
    ~ -zscore,
    ~ -lower,
    ~ -upper,
    ~ -pvalue
  )

  prediction <- prediction[is.finite(ic$IC)]
  ic <- ic[is.finite(ic$IC), , drop = FALSE]

  prediction <- purrr::map2(prediction, ic$ICWt, function(x, y) {
    x$ICWt <- y
    x
  })

  prediction <- purrr::map_df(prediction, function(x) {
    x$.row <- 1:nrow(x)
    x
  })

  prediction <- dplyr::bind_rows(prediction, .id = ".model")
  prediction <- dplyr::group_by_(prediction, ~.row)
  prediction <- dplyr::summarise_(prediction, estimate = ~ sum(ICWt * estimate))
  prediction <- dplyr::ungroup(prediction)
  prediction <- dplyr::mutate(
    prediction,
    lower = NA_real_,
    upper = NA_real_,
    sd = NA_real_,
    zscore = NA_real_,
    pvalue = NA_real_
  )
  prediction <- dplyr::arrange_(prediction, ~.row)
  prediction <- dplyr::select(
    prediction,
    estimate = "estimate",
    sd = "sd",
    zscore = "zscore",
    lower = "lower",
    upper = "upper",
    pvalue = "pvalue"
  )
  new_data <- dplyr::bind_cols(prediction, new_data, prediction)
  new_data
}
