# Simulate Residuals

Requires that new_expr includes `residual <- res_bern(` or
`residual[i] <- res_norm(`.

## Usage

``` r
simulate_residuals(x, type = NULL)
```

## Arguments

- x:

  The MB analysis object.

- type:

  A string of the residual type.

## Value

An mcmc_data of the simulated residuals.

## See also

extras::res_binom
