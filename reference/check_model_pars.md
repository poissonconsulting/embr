# Check Model Parameters

Check Model Parameters

## Usage

``` r
check_model_pars(x, fixed, random, derived, drops)
```

## Arguments

- x:

  The model code to check.

- fixed:

  A string of a regular expression specifying the fixed parameters to
  monitor.

- random:

  NULL or a character vector of the random effects.

- derived:

  NULL or a character vector of the derived parameters.

- drops:

  NULL or a character vector of the parameters to drop.

## Value

The possibly updated derived parameters.
