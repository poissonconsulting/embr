# MB Model

Creates MB model.

## Usage

``` r
model(
  x = NULL,
  ...,
  code = NULL,
  gen_inits = NULL,
  random_effects = list(),
  fixed = getOption("mb.fixed", "^[^e]"),
  derived = character(0),
  select_data = list(),
  center = character(0),
  scale = character(0),
  modify_data = identity,
  nthin = getOption("mb.nthin", 1L),
  new_expr = NULL,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  modify_new_data = identity,
  drops = list()
)
```

## Arguments

- x:

  A string, or an object inheriting from class `"mb_code"`.

- ...:

  Unused arguments.

- code:

  Passed on to
  [`mb_code()`](https://poissonconsulting.github.io/embr/reference/mb_code.md).
  If `x` is not `NULL`, `code` must be `NULL`, and vice versa.

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

## Value

An object inherting from class mb_model.

## Details

For tmb models gen_inits must specify all the fixed pars. Missing random
pars are assigned the value 0.

For jmb models unspecified the initial values for each chain are drawn
from the prior distributions.

## See also

[`chk::check_data()`](https://poissonconsulting.github.io/chk/reference/check_data.html)
[`rescale::rescale_c()`](https://poissonconsulting.github.io/rescale/reference/rescale_c.html)
