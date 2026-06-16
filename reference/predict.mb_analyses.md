# Predict from a `mb_analyses` object

Returns IC-weighted model-averaged predictions across an `mb_analyses`
list.

## Usage

``` r
# S3 method for class 'mb_analyses'
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

- parallel:

  A flag indicating whether to do predictions using parallel backend
  provided by foreach.

- quiet:

  A flag indicating whether to disable tracing information.

- ...:

  Additional arguments.

## Value

A data frame with one row per row of `new_data`.

## See also

[`predict.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analysis.md)
for full argument documentation and examples.
