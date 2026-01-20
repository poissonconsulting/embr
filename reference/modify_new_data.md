# Modify New Data

Modifies a data frame to the form it will be passed to the analysis
code.

## Usage

``` r
modify_new_data(
  data,
  data2,
  model,
  modify_new_data = NULL,
  numericize_factors = FALSE
)
```

## Arguments

- data:

  The data to modify.

- data2:

  The base data.

- model:

  An object inheriting from class mb_model.

- modify_new_data:

  A single argument function to modify new data (in list form)
  immediately prior to calculating new_expr.

- numericize_factors:

  A flag indicating whether to convert factors to integer.

## Value

The modified data in list form.
