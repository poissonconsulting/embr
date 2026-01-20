# Scalar Named List

Filters a named list so only scalar elements remain.wiby its names.

## Usage

``` r
scalar_nlist(x)
```

## Arguments

- x:

  The named list to sort.

## Value

The sorted named list.

## Examples

``` r
scalar_nlist(list(y = 2, x = 1, a = c(10, 1)))
#> $y
#> [1] 2
#> 
#> $x
#> [1] 1
#> 
```
