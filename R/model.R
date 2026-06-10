#' Define a Model
#'
#' @description
#' Define a model, including code, data, monitoring, and post-fitting
#' specification. The returned `mb_model` is consumed by [analyse()] and
#' downstream by [predict.mb_analysis()] and [mcmc_derive_data()].
#'
#' @details
#' The data passed to [analyse()] is transformed through a fixed pipeline
#' before reaching the model code: `select_data` selects columns and applies
#' any rescaling suffixes; logical, date, and difftime columns are coerced to
#' numeric; one `n<Factor>` count is injected per factor; `nObs` is injected;
#' and finally the user's `modify_data` function runs against the resulting
#' list. `gen_inits` is then invoked against this same modified list, once
#' per chain, to seed initial values.
#'
#' The monitored parameter set is the union of: names matching the `fixed`
#' regex, the names of `random_effects`, and `derived`. The default
#' `fixed = "^[^e]"` matches everything not starting with `e`. Stan models
#' with non-centred random effects typically set `fixed = "^(b|s)"` so that
#' the raw `z_b*` parameters are not monitored.
#'
#' Non-MCMC `cmdstan-*` engines (pathfinder, variational, optimize, laplace)
#' ignore `gen_inits`; see [analyse()] for engine-specific behaviour.
#'
#' @section select_data:
#' Named list mapping data column names to type or range specifications. The
#' recommended default is a permissive type-only spec: `1L` for integer, `1`
#' for numeric, `factor("a")` for factor, `TRUE` for logical. Where an
#' explicit check is wanted, use a range form such as `c(0L, 100L)` and
#' append `NA` to allow missing values: `c(0L, 100L, NA)`.
#'
#' Appending a suffix to a column name requests a rescaling transformation;
#' the original column is replaced with the transformed version in the
#' analysis dataset.
#'
#' | Suffix | Transformation |
#' |---|---|
#' | (none) | Raw, untransformed |
#' | `+` | Subtract the mean (center) |
#' | `-` | Subtract the minimum (shift to 0) |
#' | `=` | Subtract the minimum and add 1 (shift to 1) |
#' | `/` | Divide by SD (scale) |
#' | `*` | Subtract the mean and divide by SD (standardise) |
#'
#' `*` is conventional for continuous covariates and `+` for year or date
#' variables. Never apply a suffix to the response. The `center` and `scale`
#' character-vector arguments are kept for backwards compatibility and emit
#' a deprecation warning; prefer `select_data` suffixes.
#'
#' @section new_expr:
#' An R expression (e.g. `{ ... }`) or a character string of R code that is
#' evaluated post-fitting against the MCMC draws. It has access to the
#' sampled parameters, the modified data list, and `extras` helpers such as
#' `log_lik_*` and `res_*`. The expression typically defines the named terms
#' used by downstream tooling:
#'
#' * `prediction[i]` for [predict.mb_analysis()]
#' * `fit[i]` for [fitted.mb_analysis()] and for residuals
#' * `log_lik[i]` for information criteria and prior sensitivity
#' * `lprior[k]` for prior sensitivity
#'
#' The scale of `fit[i]` is model-specific: define it to match the signature
#' of the `res_*` and `log_lik_*` helpers you use (e.g. response-scale for
#' `res_neg_binom`, log-scale for `res_student` on log-normal data). Scalar
#' derived quantities defined outside the loop are extractable via
#' `predict(analysis, new_data = character(0), term = "myScalar")`.
#'
#' If `new_expr` is supplied as a string without wrapping braces they are
#' added automatically. Setting `new_expr_vec = TRUE` vectorises the for-loop
#' body via [mcmcderive::expression_vectorize()] for substantial speed gains.
#' Vectorisation silently falls back to the un-vectorised loop (no error)
#' when the loop body contains `sum()`, nested for loops, or dynamic range
#' indexing such as `eK[year[i]:(year[i] + n)]`. Safe patterns: linear
#' predictors built from indexed terms, single-level (`bSite[site[i]]`) and
#' multi-level (`bParam[site[i], annual[i]]`) indexing, link-function
#' assignments (`log(eY[i]) <- ...`), and polynomial terms on standardised
#' predictors.
#'
#' @param x An `mb_code` object built with [mb_code()], or `NULL` (the
#'   default). When `NULL`, the model code is built inline from `code`.
#'   Passing a character string or an `mb_analysis` is deprecated.
#' @inheritParams rlang::args_dots_empty
#' @param code Model code (Stan or JAGS expression or string) to pass to
#'   [mb_code()]. Only used when `x = NULL`.
#' @param gen_inits A single-argument function returning a named list of
#'   initial values per chain. Receives the modified data list (i.e. after
#'   `select_data`, rescaling, type coercion, factor-count and `nObs`
#'   injection, and `modify_data`). Returning `list()` lets the backend fall
#'   back to its own defaults (JAGS samples from priors; Stan uses its
#'   random init). Non-MCMC `cmdstan-*` engines ignore it. For tmb models
#'   `gen_inits` must specify all the fixed parameters; missing random
#'   parameters are assigned 0.
#' @param random_effects Named list mapping parameter names in the model
#'   code to one or more grouping factor columns from `select_data`. A
#'   length-1 character vector specifies a one-way effect; a length-2 vector
#'   specifies a crossed effect that is matrix-indexed in the model code (do
#'   not pre-build an interaction column). Each named factor must appear in
#'   `select_data` and must not also be in `derived`. Names in
#'   `random_effects` are added to the monitor set on top of `fixed`.
#' @param fixed Perl regex of parameter names to monitor as fixed effects.
#'   Defaults to `getOption("mb.fixed", "^[^e]")`.
#' @param derived Character vector of additional parameter names to monitor
#'   beyond those captured by `fixed` and `random_effects`. Cannot overlap
#'   with `select_data` column names or `random_effects` names.
#' @param select_data Named list specifying the columns to select and how to
#'   transform them. See the **select_data** section of [model()].
#' @inheritParams rescale::rescale
#' @param modify_data Single-argument function applied to the modified data
#'   **list** (not a data frame) immediately before the analysis. Use for
#'   restructuring not expressible via `select_data`, e.g. reshaping
#'   multi-pass columns into a matrix or adding derived counts (`nPass`,
#'   `nStage`). Must return a list. Default is `identity`.
#' @param nthin Count of the thinning interval baked into the model.
#'   Defaults from `getOption("mb.nthin", 1L)`; overridable from [analyse()].
#' @param new_expr An R expression or character string of R code defining
#'   the predictive relationships and derived terms. See the **new_expr**
#'   section of [model()].
#' @param new_expr_vec Flag controlling whether to vectorise the `new_expr`
#'   code via [mcmcderive::expression_vectorize()]. See the **new_expr**
#'   section of [model()] for safe patterns and silent fallbacks.
#' @param modify_new_data Single-argument function applied to new data (in
#'   list form) immediately before `new_expr` is evaluated. Counterpart to
#'   `modify_data` applied to new data passed to `predict()` and friends.
#' @param drops List of character vectors naming scalar parameters to fix at
#'   0 in the model.
#'
#' @return An object inheriting from class `"mb_model"`.
#'
#' @seealso
#' * The [analyse article](https://poissonconsulting.github.io/embr/articles/analyse.html)
#'   for a walkthrough including `select_data` transformations and `new_expr`
#'   structure.
#' * [analyse()] to fit the model to data.
#' * [analyse.character()] for a shortcut that builds and fits in one call.
#' * [update_model()] to change arguments on an existing `mb_model`.
#' * [set_analysis_mode()] to set session-wide sampling defaults.
#' * [newdata::xnew_data()] to build covariate grids consistent with
#'   `select_data`.
#'
#' @examples
#' \dontrun{
#' # Stan model with a standardised continuous covariate and a site
#' # random effect.
#' count_model <- model(
#'   code = count_code, # a string or read_file("stan/count.stan")
#'   select_data = list(
#'     count = 1L,
#'     site = factor("a"),
#'     `temperature*` = 1
#'   ),
#'   random_effects = list(z_bSite = "site"),
#'   fixed = "^(b|s)",
#'   new_expr = {
#'     bSite <- z_bSite * sSite
#'     for (i in 1:nObs) {
#'       log(eCount[i]) <- bIntercept + bTemp * temperature[i] +
#'         bSite[site[i]]
#'       prediction[i] <- eCount[i]
#'       fit[i] <- eCount[i]
#'       log_lik[i] <- log_lik_neg_binom(count[i], eCount[i], bPhi)
#'     }
#'   },
#'   new_expr_vec = TRUE
#' )
#'
#' # Reshape multi-pass data into a matrix and add a per-row pass count
#' # before the analysis runs; seed eAbundance with the observed totals.
#' depletion_model <- model(
#'   code = depletion_code,
#'   select_data = list(
#'     Pass1 = 1L, Pass2 = 1L, Pass3 = 1L,
#'     site = factor("a")
#'   ),
#'   modify_data = function(data) {
#'     Pass <- as.matrix(data[c("Pass1", "Pass2", "Pass3")])
#'     data$Pass <- Pass
#'     data$nPass <- ncol(Pass)
#'     data$Pass1 <- data$Pass2 <- data$Pass3 <- NULL
#'     data
#'   },
#'   gen_inits = function(data) {
#'     list(eAbundance = rowSums(data$Pass, na.rm = TRUE) + 1)
#'   }
#' )
#' }
#' @export
model <- function(
  x = NULL,
  ...,
  code = NULL,
  gen_inits = NULL,
  random_effects = list(),
  fixed = getOption("mb.fixed", "^[^e]"),
  derived = character(0),
  select_data = list(),
  center = character(0),
  scale = character(0),
  modify_data = identity,
  nthin = getOption("mb.nthin", 1L),
  new_expr = NULL,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  modify_new_data = identity,
  drops = list()
) {
  chk_unused(...)

  if (is.null(x)) {
    x <- mb_code({{ code }})
  } else {
    chk_null(code)
    if (is.character(x)) {
      deprecate_soft(
        "0.0.1.9036",
        "model(x = 'character()')",
        "model(code = 'character()')",
        details = 'Passing a string to model() is deprecated. Use model(code = ...) or model(mb_code("..."), ...) instead.'
      )
      x <- mb_code(x)
    } else if (is.mb_analysis(x)) {
      deprecate_soft(
        "0.0.1.9036",
        "model(x = 'new_analysis()')",
        details = "Passing an mb_analysis object to model() is deprecated. Use get_model() instead."
      )
      return(get_model(x))
    }
  }

  check_mb_code(x)

  # For test stability
  code <- NULL

  if (is.null(gen_inits)) {
    # Need to initialize here, for test stability
    gen_inits <- function(data) {
      list()
    }
  }

  check_single_arg_fun(gen_inits)
  check_uniquely_named_list(random_effects)
  chk_string(fixed)
  check_unique_character_vector(derived)
  check_uniquely_named_list(select_data)
  check_valid_rescalers(names(select_data))
  check_unique_character_vector(center)
  check_unique_character_vector(scale)
  check_single_arg_fun(modify_data)
  check_single_arg_fun(modify_new_data)
  chk_flag(new_expr_vec)
  new_expr <- enexpr_new_expr({{ new_expr }}, vectorize = new_expr_vec)
  chk_whole_number(nthin)
  chk_scalar(nthin)
  check_drops(drops)

  select_colnames <- rescale::get_rescaler_colnames(names(select_data))
  if (!length(select_colnames)) {
    select_colnames <- NULL
  }

  if (!identical(center, character(0)) || !identical(scale, character(0))) {
    if (!identical(names(select_data), select_colnames)) {
      err(
        "scaling (and transforms) should be specified with select_data or center/scale not both",
        tidy = FALSE
      )
    }

    warning(
      "arguments center and scale are deprecated; please use select_data instead.",
      call. = FALSE
    )
  }

  check_all_elements_class_character(random_effects)
  check_x_in_y(
    unlist(random_effects),
    select_colnames,
    x_name = "random_effects",
    y_name = "select_data",
    type_x = "elements",
    type_y = "names"
  )
  check_x_not_in_y(
    names(random_effects),
    select_colnames,
    x_name = "random_effects",
    y_name = "select_data",
    type_x = "names",
    type_y = "names"
  )
  check_x_not_in_y(
    derived,
    select_colnames,
    x_name = "derived",
    y_name = "select_data",
    type_y = "names"
  )
  check_x_not_in_y(
    names(random_effects),
    derived,
    x_name = "random_effects",
    y_name = "derived",
    type_x = "names"
  )
  check_x_not_in_y(
    unlist(random_effects),
    center,
    x_name = "random_effects",
    type_x = "elements"
  )
  check_x_not_in_y(
    unlist(random_effects),
    scale,
    x_name = "random_effects",
    type_x = "elements"
  )
  check_x_not_in_y(
    derived,
    center,
    x_name = "random_effects",
    type_x = "elements"
  )
  check_x_not_in_y(
    derived,
    scale,
    x_name = "random_effects",
    type_x = "elements"
  )

  check_x_in_y(
    center,
    select_colnames,
    y_name = "select_data",
    type_y = "names"
  )
  check_x_in_y(scale, select_colnames, y_name = "select_data", type_y = "names")

  derived <- check_model_pars(
    x,
    fixed,
    random = names(random_effects),
    derived = derived,
    drops = unlist(drops)
  )

  center <- sort(center)
  scale <- sort(scale)
  random_effects <- sort_nlist(random_effects)

  obj <- list(
    code = x,
    gen_inits = gen_inits,
    fixed = fixed,
    derived = derived,
    select_data = select_data,
    center = center,
    scale = scale,
    random_effects = random_effects,
    modify_data = modify_data,
    new_expr = new_expr,
    new_expr_vec = new_expr_vec,
    modify_new_data = modify_new_data,
    drops = drops,
    nthin = nthin
  )

  new_mb_model(obj, class(x))
}

new_mb_model <- function(x, code_class) {
  chk_list(x)
  class(x) <- sub("code", "model", code_class)
  x
}
