# Coef JAGS Analysis

Coefficients for a JAGS analysis.

## Usage

``` r
# S3 method for class 'mb_analysis'
coef(
  object,
  param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  simplify = FALSE,
  directional_information = FALSE,
  ...
)
```

## Arguments

- object:

  The mb_analysis object.

- param_type:

  A flag specifying whether 'fixed', 'random' or 'derived' terms.

- include_constant:

  A flag specifying whether to include constant terms.

- conf_level:

  A number specifying the confidence level. By default 0.95.

- estimate:

  The function to use to calculating the estimate for Bayesian models.

- simplify:

  A flag specifying whether to drop sd and zscore columns and return
  svalue instead of pvalue.

- directional_information:

  A flag specifying whether the svalue column for a Bayesian analysis
  should be calculated using
  [`extras::directional_information()`](https://poissonconsulting.github.io/extras/reference/directional-information.html)
  instead of
  [`extras::svalue()`](https://poissonconsulting.github.io/extras/reference/svalue.html).
  The default value will change from `FALSE` to `TRUE` in a future
  release; set the argument explicitly to avoid the deprecation warning.
  Ignored for frequentist analyses where the svalue is always
  `-log2(pvalue)`.

- ...:

  Not used.

## Value

A tidy tibble of the coefficient terms.

## Details

The `zscore` is mean / sd.
