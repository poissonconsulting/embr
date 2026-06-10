# Summarize model sensitivity

Summarize model sensitivity

## Usage

``` r
sensitivity(
  x,
  by = "term",
  param_type = "all",
  mb.prior_cjs = getOption("mb.prior_cjs", 0.1),
  mb.lik_cjs = getOption("mb.lik_cjs", 0.05),
  ...
)
```

## Arguments

- x:

  The mb_analysis object.

- by:

  A string indicating whether to determine by "term", "parameter", or
  "all".

- param_type:

  A string specifying which parameters to include: 'fixed', 'random',
  'derived', 'primary', or 'all'.

- mb.prior_cjs:

  A number specifying the CJS threshold for weak prior classification.

- mb.lik_cjs:

  A number specifying the CJS threshold for strong data classification.

- ...:

  Arguments passed to
  [`add_sensitivity()`](https://poissonconsulting.github.io/embr/reference/add_sensitivity.md).

## Value

A tibble summarizing the sensitivity of the analysis object.
