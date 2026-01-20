# Residuals

Extract residual values for an MB analysis.

## Usage

``` r
# S3 method for class 'mb_analysis'
residuals(object, type = NULL, ...)
```

## Arguments

- object:

  The MB analysis object.

- type:

  A string of the residual type.

- ...:

  Unused.

## Value

The analysis data set with the residual values.

## Details

The new_expr in the model must include the term 'residual'.
