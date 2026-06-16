# Update MB Model

Updates an object inherting from class mb_model.

## Usage

``` r
update_model(
  model,
  code = NULL,
  gen_inits = NULL,
  random_effects = NULL,
  fixed = NULL,
  derived = NULL,
  select_data = NULL,
  center = NULL,
  scale = NULL,
  modify_data = NULL,
  nthin = NULL,
  new_expr = NULL,
  new_expr_vec = NULL,
  modify_new_data = NULL,
  drops = NULL,
  ...
)
```

## Arguments

- model:

  The model to update.

- code:

  A string of the model template or an object inheriting from class
  mb_code.

- gen_inits:

  A single-argument function returning a named list of initial values
  per chain. Receives the modified data list (i.e. after `select_data`,
  rescaling, type coercion, factor-count and `nObs` injection, and
  `modify_data`). Returning [`list()`](https://rdrr.io/r/base/list.html)
  lets the backend fall back to its own defaults (JAGS samples from
  priors; Stan uses its random init). Non-MCMC `cmdstan-*` engines
  ignore it.

- random_effects:

  Named list mapping parameter names in the model code to one or more
  grouping factor columns from `select_data`. Each named factor must
  appear in `select_data` and must not also be in `derived`.

- fixed:

  A string of a regular expression of parameter names to monitor as
  fixed effects.

- derived:

  A character vector of derived parameters to monitor.

- select_data:

  A named list specifying the columns to select and their expected
  classes and values as well as transformations and scaling options. See
  the **select_data** section of
  [`model()`](https://poissonconsulting.github.io/embr/reference/model.md).

- center:

  A character vector of the columns to center.

- scale:

  A character vector of the columns to scale (after centering).

- modify_data:

  A single argument function to modify the data (in list form)
  immediately prior to the analysis.

- nthin:

  An integer specifying the thinning interval.

- new_expr:

  An R expression or character string of R code defining the predictive
  relationships and derived quantities. See the **new_expr** section of
  [`model()`](https://poissonconsulting.github.io/embr/reference/model.md).

- new_expr_vec:

  Flag controlling whether to vectorise the `new_expr` code via
  [`mcmcderive::expression_vectorize()`](https://poissonconsulting.github.io/mcmcderive/reference/expression_vectorize.html).
  See the **new_expr** section of
  [`model()`](https://poissonconsulting.github.io/embr/reference/model.md)
  for safe patterns and silent fallbacks.

- modify_new_data:

  SA single argument function to modify new data (in list form)
  immediately prior to calculating new_expr.

- drops:

  A list of character vectors naming scalar parameters to fix at 0 in
  the model.

- ...:

  These dots are for future extensions and must be empty.

## Value

An object inheriting from class mb_model.
