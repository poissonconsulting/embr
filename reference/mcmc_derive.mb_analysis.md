# Derive

Calculate derived parameters.

## Usage

``` r
# S3 method for class 'mb_analysis'
mcmc_derive(
  object,
  new_data = data_set(object),
  new_expr = NULL,
  new_values = list(),
  term = "prediction",
  modify_new_data = NULL,
  ref_data = FALSE,
  ref_fun2 = proportional_change2,
  random_effects = NULL,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  ...
)

# S3 method for class 'mb_analyses'
mcmc_derive(
  object,
  new_data = data_set(object),
  new_expr = NULL,
  new_values = list(),
  term = "prediction",
  modify_new_data = NULL,
  ref_data = FALSE,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
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

- random_effects:

  A named list specifying the random effects and the associated factors.

- new_expr_vec:

  A flag specifying whether to vectorize the new_expr code.

- parallel:

  A flag indicating whether to do predictions using parallel backend
  provided by foreach.

- quiet:

  A flag indicating whether to disable tracing information.

- ...:

  Additional arguments.

## Value

A object of class mcmcr.

## See also

- The [prediction
  article](https://poissonconsulting.github.io/embr/articles/prediction.html)
  for worked patterns including arithmetic on `mcmcr` posteriors.

- [`predict.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analysis.md)
  for tidy posterior summaries at new covariate values.

- [`mcmc_derive_data.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/mcmc_derive_data.mb_analysis.md)
  for raw MCMC samples paired with `new_data` and group-level summaries.

- [`mcmcr::combine_samples()`](https://poissonconsulting.github.io/mcmcr/reference/combine_samples.html)
  for combining MCMC samples across independent analyses on shared data
  keys.

## Examples

``` r
if (FALSE) { # \dontrun{
# Pull multiple scalar terms in one call by regex. Quantities defined in
# new_expr are usually easiest to extract individually with predict();
# mcmc_derive() is most useful when (a) you want raw mcmcr samples for
# downstream operations predict() does not support (probability
# statements, custom quantiles) or (b) you want to compose multiple terms
# with arbitrary arithmetic. See vignette("prediction") for worked
# patterns.

scalars <- mcmc_derive(
  analysis,
  new_data = character(0),
  term = "^(eBaseCount|eRestoredEffect)$"
)
coef(scalars)

# Custom expression with injected scalar constants
as.mcmcr(analysis) |>
  mcmc_derive(
    expr = "biomass <- exp(bIntercept) * mean_mass_g",
    values = list(mean_mass_g = 250)
  ) |>
  coef()
} # }
```
