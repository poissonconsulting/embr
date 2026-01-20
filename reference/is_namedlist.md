# Is Named List

Is Named List

## Usage

``` r
is_namedlist(x)
```

## Arguments

- x:

  The object to test.

## Value

A flag.

## Examples

``` r
is_namedlist(1)
#> [1] FALSE
is_namedlist(list())
#> [1] TRUE
is_namedlist(list(1))
#> [1] FALSE
is_namedlist(list(x = 1))
#> [1] TRUE
is_namedlist(list(x = list(y = 2)))
#> [1] FALSE
```
