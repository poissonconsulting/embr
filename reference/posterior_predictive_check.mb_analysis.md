# Posterior Predictive Check

Posterior Predictive Check

## Usage

``` r
# S3 method for class 'mb_analysis'
posterior_predictive_check(x, zeros = TRUE, sd = FALSE, ...)
```

## Arguments

- x:

  The MB analysis object.

- zeros:

  A flag specifying whether to perform a posterior predictive check on
  the number of zeros in the data.

- sd:

  A flag specifying whether to include the standard deviation of the
  simulated moments as column `sd`.

- ...:

  Unused.

## Value

A tibble of the checks with the columns `moment`, `observed`,
`estimate`, `lower`, `upper`, `sd` (only when `sd = TRUE`) and `svalue`.
The `estimate`, `lower` and `upper` columns are the median and 95%
compatibility limits of the simulated moments.
