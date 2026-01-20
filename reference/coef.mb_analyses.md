# Coef TMB Analyses

Coefficients for fixed parameters from an ML based MB analyses averaged
by IC weights.

## Usage

``` r
# S3 method for class 'mb_analyses'
coef(
  object,
  param_type = "fixed",
  include_constant = TRUE,
  conf_level = getOption("mb.conf_level", 0.95),
  estimate = getOption("mb.estimate", median),
  ...
)
```

## Arguments

- object:

  The mb_analyses object.

- param_type:

  A flag specifying whether 'fixed', 'random' or 'derived' terms.

- include_constant:

  A flag specifying whether to include constant terms.

- conf_level:

  A number specifying the confidence level. By default 0.95.

- estimate:

  The function to use to calculate the estimate for Bayesian models.

- ...:

  Not used.

## Value

A tidy tibble of the coeffcient terms with the model averaged estimate,
the Akaike's weight and the proportion of models including the term.
