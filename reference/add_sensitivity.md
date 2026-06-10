# Add sensitivity data frame to an analysis object

Computes power-scaling sensitivity and stores the result as
`x$sensitivity`. Subsequent calls return `x` unchanged unless
`replace = TRUE`.

## Usage

``` r
add_sensitivity(x, new_expr = NULL, replace = FALSE, ...)
```

## Arguments

- x:

  The object.

- new_expr:

  A string of R code specifying the predictive relationship. Must use
  `replace = TRUE` for this to be applied.

- replace:

  A flag specifying whether to replace an existing sensitivity data
  frame.

- ...:

  Arguments passed to
  [`powerscale_sensitivity()`](https://n-kall.github.io/priorsense/reference/powerscale-sensitivity.html).

## Value

The analysis object with an added `sensitivity` data frame.
