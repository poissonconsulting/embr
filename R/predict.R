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

#' Predict from a Bayesian Model
#'
#' @description
#' Summarises the posterior predictive distribution at new covariate values.
#' Returns a tidy data frame with point estimates and compatibility intervals.
#'
#' For raw MCMC samples paired with `new_data`, see
#' [mcmc_derive_data.mb_analysis()]. For IC-weighted model-averaged predictions
#' across an `mb_analyses` list, see [predict.mb_analyses()].
#'
#' @details
#' `new_data` defaults to `data_set(object)`. Covariates not specified are held
#' at a reference value: mean for continuous, first level for factors. Build
#' covariate grids with `newdata::xnew_data()` and related helpers
#' (`xnew_seq()`, `xcast()`, `xobs_only()`).
#'
#' `term` selects the quantity defined in the model's `new_expr` to summarise
#' (default `"prediction"`). Pass `new_data = character(0)` to extract a scalar
#' quantity.
#'
#' `new_expr` overrides the model's default predictive expression as a string.
#' `new_values` injects named scalar constants into that expression's
#' environment.
#'
#' @section Reference data and effect sizes:
#' When `ref_data` is a 1-row data frame (or `TRUE`, which builds default 1-row data.frame with all variables held at reference value), per MCMC iteration the function:
#'
#' 1. Predicts at the reference state, yielding `ref_iter`.
#' 2. Predicts at each row of `new_data`, yielding `new_iter`.
#' 3. Applies `ref_fun2(c(ref_iter, new_iter))` per iteration.
#' 4. Summarises the resulting scalar across iterations.
#'
#' The returned summary describes the posterior of the transformed quantity,
#' not of the raw prediction. The default `ref_fun2` is `proportional_change2`
#' from the `extras` package (`(new - ref) / ref`); pass a custom function for
#' absolute difference, log ratio, etc.
#'
#' @section Random-effect zeroing:
#' A random-effect parameter is zeroed when *any* of its associated factor columns in `new_data`
#' is entirely at level 1. For a single-factor RE such as `z_bSite = "site"`,
#' that means `site` must be entirely at level 1; for a multi-factor RE such
#' as `z_bSiteAnnual = c("site", "annual")`, zeroing fires if *either* `site`
#' or `annual` is entirely at level 1.
#'
#' * `NULL` (default): zero any RE whose any associated factor is all at level
#'   1.
#' * `FALSE`: skip all zeroing regardless of factor levels; the full
#'   random-effect samples are kept.
#' * Named list: only the listed `z_b*` parameters (with their factor
#'   mappings) are candidates for zeroing; unlisted REs are kept regardless.
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @return A data frame with columns `estimate`, `lower`,
#'   `upper`, `svalue`, and all columns of `new_data`.
#' @seealso
#' * [predict.mb_analyses()] for predictions on meta-analysis object.
#' * [mcmc_derive_data.mb_analysis()] for raw MCMC samples paired with
#'   `new_data`, regex term matching, and group-level summaries via
#'   `group_by()` + `summarise()`.
#' * [mcmc_derive.mb_analysis()] for scalar derived quantities and arithmetic
#'   on `mcmcr` posteriors.
#' * [mcmcr::combine_samples()] for combining MCMC samples across independent
#'   analyses on shared data keys.
#' * [model()] for `new_expr` syntax.
#' * [newdata::xnew_data()] for building covariate grids.
#' @examples
#' \dontrun{
#' library(newdata)
#'
#' # Minimal model: one fixed factor (treatment, 2 levels), two factor
#' # covariates (site, annual) entering through single- and multi-factor
#' # random effects, one continuous covariate (temperature). new_expr
#' # defines prediction[i], fit[i], and scalars eBaseCount and eHighEffect.
#' model <- model(
#'   code = stan_code,
#'   new_expr = {
#'     bSite <- z_bSite * sSite
#'     bSiteAnnual <- z_bSiteAnnual * sSiteAnnual
#'     bTreatment <- c(0, bTreatment_dev)
#'     eBaseCount <- exp(bIntercept)
#'     eHighEffect <- exp(bTreatment_dev)
#'     for (i in 1:nObs) {
#'       log(eCount[i]) <- bIntercept +
#'         bTreatment[treatment[i]] +
#'         bTemp * temperature[i] +
#'         bSite[site[i]] +
#'         bSiteAnnual[site[i], annual[i]]
#'       prediction[i] <- eCount[i]
#'       fit[i] <- log(eCount[i])
#'     }
#'   },
#'   new_expr_vec = TRUE,
#'   select_data = list(
#'     count = 1L,
#'     treatment = factor("a"),
#'     site = factor("a"),
#'     annual = factor("a"),
#'     `temperature*` = 1
#'   ),
#'   random_effects = list(
#'     z_bSite = "site",
#'     z_bSiteAnnual = c("site", "annual")
#'   )
#' )
#' analysis <- analyse(model, data)
#' data <- data_set(analysis)
#'
#' # --- Covariate grids ----------------------------------------------------
#'
#' # Continuous covariate; other covariates held at reference values
#' xnew_data(data, temperature) |>
#'   predict(analysis, new_data = _)
#'
#' # Specific sequence of values
#' xnew_data(data, xnew_seq(temperature, length_out = 5)) |>
#'   predict(analysis, new_data = _)
#'
#' # Factor (random effect)
#' xnew_data(data, site) |>
#'   predict(analysis, new_data = _)
#'
#' # Vary a factor at a fixed value of another covariate
#' xnew_data(data, treatment, temperature = 1.5) |>
#'   predict(analysis, new_data = _)
#'
#' # Cast specific factor levels
#' xnew_data(
#'   data,
#'   xcast(site = "a", treatment = "high"),
#'   temperature = 2
#' ) |>
#'   predict(analysis, new_data = _)
#'
#' # --- Term selection -----------------------------------------------------
#'
#' # Link-scale fit instead of default prediction
#' xnew_data(data, treatment) |>
#'   predict(analysis, new_data = _, term = "fit")
#'
#' # Scalar derived quantity from new_expr
#' predict(analysis, new_data = character(0), term = "eBaseCount")
#'
#' # --- Override new_expr --------------------------------------------------
#'
#' # Substitute new_expr and inject a scalar constant (e.g. area correction)
#' predict(
#'   analysis,
#'   new_data = xnew_data(data, site),
#'   new_expr = "
#'     bSite <- z_bSite * sSite
#'     for (i in 1:length(site)) {
#'       prediction[i] <- exp(bIntercept + bSite[site[i]]) * area_correction
#'     }
#'   ",
#'   new_values = list(area_correction = 10)
#' )
#'
#' # --- Reference data and effect sizes ------------------------------------
#'
#' # Default ref_fun2 = proportional_change2: (new - ref) / ref
#' ref <- xnew_data(data, xcast(treatment = "high"))
#' xnew_data(data, treatment) |>
#'   predict(analysis, new_data = _, ref_data = ref)
#'
#' # Custom ref_fun2: absolute difference
#' xnew_data(data, treatment) |>
#'   predict(
#'     analysis,
#'     new_data = _,
#'     ref_data = ref,
#'     ref_fun2 = function(x) x[2] - x[1]
#'   )
#'
#' # --- Random-effect zeroing ----------------------------------------------
#'
#' # NULL (default), site omitted: site and annual both at level 1, so both
#' # z_bSite and z_bSiteAnnual are zeroed for population-level prediction
#' xnew_data(data, temperature) |>
#'   predict(analysis, new_data = _)
#'
#'
#' # FALSE: all zeroing skipped, both z_bSite and z_bSiteAnnual kept,
#' # differing from the NULL case above
#' xnew_data(data, site) |>
#'   predict(analysis, new_data = _, random_effects = FALSE)
#'
#' # Named list, zero only z_bSite: z_bSiteAnnual excluded from candidates so
#' # annual at level 1 no longer triggers zeroing for it
#' xnew_data(data, site) |>
#'   predict(
#'     analysis,
#'     new_data = _,
#'     random_effects = list(z_bSite = "site")
#'   )
#'
#' # Named list, zero only z_bSiteAnnual (annual at level 1 triggers it);
#' # z_bSite excluded so site variation is kept across levels
#' xnew_data(data, site) |>
#'   predict(
#'     analysis,
#'     new_data = _,
#'     random_effects = list(z_bSiteAnnual = c("site", "annual"))
#'   )
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

#' Predict (IC-weighted Model Average)
#'
#' Returns IC-weighted model-averaged predictions across an `mb_analyses` list.
#' Arguments are forwarded to [predict.mb_analysis()] for each model; results
#' are combined using IC weights. Interval columns are `NA` in the averaged
#' output.
#'
#' @inheritParams predict.mb_analysis
#' @return A data frame with the same structure as [predict.mb_analysis()],
#'   with `estimate` as the IC-weighted average and `sd`, `zscore`, `lower`,
#'   `upper`, and `pvalue` set to `NA`.
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
