# Derive Data

Calculate derived parameters.

## Usage

``` r
# S3 method for class 'mb_analysis'
mcmc_derive_data(
  object,
  new_data = data_set(object),
  new_expr = NULL,
  new_values = list(),
  term = "prediction",
  modify_new_data = NULL,
  ref_data = FALSE,
  ref_fun2 = proportional_change2,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  random_effects = NULL,
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  beep = getOption("mb.beep", FALSE),
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

- beep:

  A flag indicating whether to beep on completion of the analysis.

- ...:

  Additional arguments.

## Value

A object of class mcmc_data.

## See also

- The [prediction
  article](https://poissonconsulting.github.io/embr/articles/prediction.html)
  for worked patterns including group-level summaries.

- [`predict.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analysis.md)
  for tidy posterior summaries at new covariate values.

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
# `analysis` is a fitted mb_analysis with factors site, treatment and
# new_expr that defines per-row term `eCount`.
data <- data_set(analysis)

# Per-group posterior summaries via group_by() + summarise().
# Default .fun = sum; use mean for the per-treatment posterior mean.
mcmc_derive_data(analysis, new_data = data, term = "^eCount$") |>
  group_by(treatment) |>
  summarise(.fun = mean) |>
  coef()

# Custom summarise function, e.g. range within group
mcmc_derive_data(analysis, new_data = data, term = "^eCount$") |>
  group_by(treatment) |>
  summarise(.fun = function(x) max(x) - min(x)) |>
  coef()
} # }
```
