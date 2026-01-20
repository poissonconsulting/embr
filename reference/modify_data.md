# Modify Data

Modifies a data frame to the form it will be passed to the analysis
code.

## Usage

``` r
modify_data(data, model, numericize_factors = FALSE)
```

## Arguments

- data:

  The data to modify.

- model:

  An object inheriting from class mb_model.

- numericize_factors:

  A flag indicating whether to convert factors to integer.

## Value

The modified data in list form.
