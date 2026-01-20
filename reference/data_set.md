# Data Set

Gets the data set for an object inheriting from class mb_analysis.

## Usage

``` r
data_set(
  x,
  modify = FALSE,
  numericize_factors = FALSE,
  marginalize_random_effects = FALSE,
  ...
)
```

## Arguments

- x:

  The object.

- modify:

  A flag indicating whether to modify the data.

- numericize_factors:

  A flag indicating whether to convert factors to integers if modifying
  the data.

- marginalize_random_effects:

  A flag indicating whether to set each factor in one or more random
  effects at its first level.

- ...:

  Unused.

## Value

The data set as a tibble.
