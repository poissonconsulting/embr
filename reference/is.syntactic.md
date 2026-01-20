# Is syntactic

Is syntactic

## Usage

``` r
is.syntactic(x)
```

## Arguments

- x:

  A character of possible variable names.

## Value

A logical vector indicating whether a syntactically correct variable
name.

## Examples

``` r
is.syntactic(c("0", "x", "1x", "x y", "x1"))
#> [1] FALSE  TRUE FALSE FALSE  TRUE
```
