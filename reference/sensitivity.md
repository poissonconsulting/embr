# Summarize model sensitivity

Summarize model sensitivity

## Usage

``` r
sensitivity(x, by = "term", ...)
```

## Arguments

- x:

  The mb_analysis object.

- by:

  A string indicating whether to determine by "term", "parameter", or
  "all".

- ...:

  Additional arguments passed to
  [`priorsense::powerscale_sensitivity()`](https://n-kall.github.io/priorsense/reference/powerscale-sensitivity.html).

## Value

A dataframe summarizing the sensitivity of the analysis object.
