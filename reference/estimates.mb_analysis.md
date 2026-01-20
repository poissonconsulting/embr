# Estimates

Calculates the estimates for an MCMC object.

## Usage

``` r
# S3 method for class 'mb_analysis'
estimates(x, param_type = "fixed", ...)
```

## Arguments

- x:

  An object.

- param_type:

  A string indicating the type of terms to get the names for.

- ...:

  Other arguments passed to methods.

## Value

A list of uniquely named numeric objects.

## See also

Other MCMC manipulations:
[`bind_chains()`](https://poissonconsulting.github.io/universals/reference/bind_chains.html),
[`bind_iterations()`](https://poissonconsulting.github.io/universals/reference/bind_iterations.html),
[`collapse_chains()`](https://poissonconsulting.github.io/universals/reference/collapse_chains.html),
[`split_chains()`](https://poissonconsulting.github.io/universals/reference/split_chains.html)
