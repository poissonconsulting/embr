# Predict from a `mb_analysis` object

Summarises the posterior predictive distribution at new covariate
values. Returns a tidy data frame with point estimates and compatibility
limits.

## Usage

``` r
# S3 method for class 'mb_analysis'
predict(
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
)
```

## Arguments

- object:

  An object inheriting from class mb_analysis.

- new_data:

  A data frame at which to derive the term. Pass `character(0)` to
  extract a scalar `term` from new_expr.

- new_expr:

  An R expression (e.g. `{ ... }`) or a character string of R code
  specifying the predictive relationship. If `NULL`, uses the expression
  set in
  [`model()`](https://poissonconsulting.github.io/embr/reference/model.md)
  and stored in the `mb_analysis` object.

- new_values:

  A named list of new or replacement values to pass to new_expr.

- term:

  A string of the term in new_expr.

- conf_level:

  A number specifying the confidence level. By default 0.95.

- modify_new_data:

  A single argument function to modify new data (in list form)
  immediately prior to calculating new_expr.

- ref_data:

  A flag or a data frame with 1 row indicating the reference values for
  calculating the effects size. If `FALSE`, no reference applied. If
  `TRUE`, the reference is a 1 row data.frame with all variables held at
  reference value.

- ref_fun2:

  A function whose first argument takes a vector of two numbers and
  returns a scalar of a metric of the difference between them.

- new_expr_vec:

  A flag specifying whether to vectorize the new_expr code.

- random_effects:

  A named list specifying the random effects and the associated factors.

- parallel:

  A flag indicating whether to do predictions using parallel backend
  provided by foreach.

- quiet:

  A flag indicating whether to disable tracing information.

- ...:

  Additional arguments.

## Value

A data frame with one row per row of `new_data`, containing the
posterior summary columns produced by
[`mcmcdata::coef.mcmc_data()`](https://rdrr.io/pkg/mcmcdata/man/coef.mcmc_data.html)
and all columns of `new_data`.

## Details

`new_data` defaults to `data_set(object)` (the analysis dataset). Build
covariate grids with
[`newdata::xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.html)
and related helpers
([`newdata::xnew_seq()`](https://poissonconsulting.github.io/newdata/reference/xnew_seq.html),
[`newdata::xcast()`](https://poissonconsulting.github.io/newdata/reference/xcast.html),
[`newdata::xobs_only()`](https://poissonconsulting.github.io/newdata/reference/xobs_only.html))
for explicit control over which covariates vary. A character vector of
column names is also accepted as a shortcut: `predict(analysis, "year")`
is equivalent to
`predict(analysis, new_data = newdata::xnew_data(data_set(analysis), year))`,
which generates a grid varying `year` and holding the rest at their
reference values. Covariates not specified are held at a reference
value: mean for continuous, first level for factors.

`term` selects the quantity defined in the model's `new_expr` to
calculate (default `"prediction"`). Pass `new_data = character(0)` to
extract a scalar quantity.

## See also

- The [prediction
  article](https://poissonconsulting.github.io/embr/articles/prediction.html)
  for detailed examples of prediction patterns.

- [`predict.mb_analyses()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analyses.md)
  for predictions on meta-analysis object.

- [`mcmc_derive_data.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/mcmc_derive_data.mb_analysis.md)
  for raw MCMC samples paired with `new_data`, regex term matching, and
  group-level summaries via `group_by()` + `summarise()`.

- [`mcmc_derive.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/mcmc_derive.mb_analysis.md)
  for scalar derived quantities and arithmetic on `mcmcr` posteriors.

- [`mcmcr::combine_samples()`](https://poissonconsulting.github.io/mcmcr/reference/combine_samples.html)
  for combining MCMC samples across independent analyses on shared data
  keys.

- [`newdata::xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.html)
  for building covariate grids.

## Examples

``` r
if (FALSE) { # \dontrun{
library(newdata)
data <- data_set(analysis)

# Character shortcut: vary a single column, hold others at reference
predict(analysis, "temperature")

# Equivalent explicit form
xnew_data(data, temperature) |>
  predict(analysis, new_data = _)

# Set custom sequence for continuous covariate
xnew_data(data, xnew_seq(temperature, length_out = 5)) |>
  predict(analysis, new_data = _)

# Predict for all factor levels and set specific continuous reference value
xnew_data(data, site, temperature = 5) |>
  predict(analysis, new_data = _)

# Predict only for observed combinations of factor levels
xnew_data(data, xobs_only(site, annual)) |>
  predict(analysis, new_data = _)

# Proportional change relative to a 1-row reference state
ref <- xnew_data(data, xcast(treatment = "control"))
xnew_data(data, treatment) |>
  predict(analysis, new_data = _, ref_data = ref)

# Predict for first level of random effect levels rather than 'typical'
xnew_data(data, temperature) |>
  predict(analysis, new_data = _, random_effects = FALSE)

# Extract a scalar derived quantity from new_expr
predict(analysis, new_data = character(0), term = "eBaseCount")
} # }
```
