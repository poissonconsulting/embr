# Update MB Model

Updates an object inherting from class mb_model.

## Usage

``` r
update_model(
  model,
  code = NULL,
  gen_inits = NULL,
  random_effects = NULL,
  fixed = NULL,
  derived = NULL,
  select_data = NULL,
  center = NULL,
  scale = NULL,
  modify_data = NULL,
  nthin = NULL,
  new_expr = NULL,
  new_expr_vec = NULL,
  modify_new_data = NULL,
  drops = NULL,
  ...
)
```

## Arguments

- model:

  The model to update.

- code:

  A string of the model template or an object inheriting from class
  mb_code.

- gen_inits:

  A single argument function taking the modified data and returning a
  named list of initial values.

- random_effects:

  A named list specifying the random effects and the associated factors.

- fixed:

  A string of a regular expression specifying the fixed pars to monitor.

- derived:

  A character vector of the derived pars to monitor.

- select_data:

  A named list specifying the columns to select and their associated
  classes and values as well as transformations and scaling options.

- center:

  A character vector of the columns to center.

- scale:

  A character vector of the columns to scale (after centering).

- modify_data:

  A single argument function to modify the data (in list form)
  immediately prior to the analysis.

- nthin:

  A count specifying the thinning interval.

- new_expr:

  A string of R code specifying the predictive relationships.

- new_expr_vec:

  A flag specifying whether to vectorize the new_expr code.

- modify_new_data:

  A single argument function to modify new data (in list form)
  immediately prior to calculating new_expr.

- drops:

  A list of character vector of possible scalar pars to drop (fix at 0).

- ...:

  Unused arguments.

## Value

An object inheriting from class mb_model.
