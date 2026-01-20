# Coef TMB Meta Analysis

Coef TMB Meta Analysis

## Usage

``` r
# S3 method for class 'mb_meta_analysis'
coef_profile(
  object,
  param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  parallel = getOption("mb.parallel", FALSE),
  beep = getOption("mb.beep", TRUE),
  ...
)
```

## Arguments

- object:

  The mb_meta_analysis object.

- param_type:

  A flag specifying whether 'fixed', 'random' or 'derived' terms.

- include_constant:

  A flag specifying whether to include constant terms.

- conf_level:

  A number specifying the confidence level. By default 0.95.

- estimate:

  The function to use to calculate the estimate.

- parallel:

  A flag indicating whether to using parallel backend provided by
  foreach.

- beep:

  A flag indicating whether to beep on completion of the analysis.

- ...:

  Not used.

## Value

A tidy tibble.
