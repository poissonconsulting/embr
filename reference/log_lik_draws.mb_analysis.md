# Extract log likelihood draws

Extract log likelihood from fitted model and return as a draws object.
Adapted from the `priorsense` package.

## Usage

``` r
# S3 method for class 'mb_analysis'
log_lik_draws(x, joint = FALSE, log_lik_name = "log_lik", ...)
```

## Arguments

- x:

  The mb_analysis object.

- joint:

  A flag indicating whether to return the joint log likelihood or array,
  default is FALSE.

- log_lik_name:

  A string of the name of the parameter corresponding to the log
  likelihood, default is "log_lik".

- ...:

  Unused.

## Value

A draws_array object containing log_lik values.
