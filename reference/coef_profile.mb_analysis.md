# Coef Profile Analysis

Coefficients for a analysis.

## Usage

``` r
# S3 method for class 'mb_analysis'
coef_profile(
  object,
  param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  parallel = getOption("mb.parallel", FALSE),
  beep = getOption("mb.profile", TRUE),
  simplify = TRUE,
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

- parallel:

  A flag indicating whether to using parallel backend provided by
  foreach.

- beep:

  A flag indicating whether to beep on completion of the analysis.

- simplify:

  A flag specifying whether to simplify with svalue.

- ...:

  Not used.

## Value

A tidy tibble of the coefficient terms.

## Details

The `zscore` is mean / sd.
