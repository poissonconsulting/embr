# Run Power-Scaling Sensitivity Analysis

Calculates the prior/likelihood sensitivity based on power-scaling
perturbations. This is done using importance sampling (and optionally
moment matching).

## Usage

``` r
# S3 method for class 'mb_analysis'
powerscale_sensitivity(x, ...)
```

## Arguments

- x:

  The mb_analysis object.

- ...:

  Arguments passed to methods to
  [`priorsense::powerscale_sensitivity()`](https://n-kall.github.io/priorsense/reference/powerscale-sensitivity.html).
  Alternative functions for `log_lik_fn` and `log_prior_fn` cannot be
  used.

## Value

Table of sensitivity values for each specified variable.
