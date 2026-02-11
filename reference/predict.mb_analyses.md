# Predict

Predict

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

  The data frame to calculate the predictions for.

- new_expr:

  A string of R code specifying the predictive relationship.

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
  calculating the effects size.

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
