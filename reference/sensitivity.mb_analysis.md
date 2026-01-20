# Summarize model sensitivity

Summarize model sensitivity

## Usage

``` r
# S3 method for class 'mb_analysis'
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
