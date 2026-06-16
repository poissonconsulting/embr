# Analyse from Character Code

A convenience that builds the model and fits it in one call.

## Usage

``` r
# S3 method for class 'character'
analyse(
  x,
  data,
  select_data = list(),
  nchains = getOption("mb.nchains", 3L),
  niters = getOption("mb.niters", 1000L),
  nthin = getOption("mb.nthin", 1L),
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  glance = getOption("mb.glance", TRUE),
  beep = getOption("mb.beep", TRUE),
  seed = sample.int(.Machine$integer.max, 1),
  stan_engine = getOption("mb.stan_engine", character(0)),
  niters_warmup = niters,
  ...
)
```

## Arguments

- x:

  A character string of Stan or JAGS model code.

- data:

  A data frame.

- select_data:

  A named list specifying columns to select with their classes, values,
  transforms, and scaling options. Passed to
  [`model()`](https://poissonconsulting.github.io/embr/reference/model.md).

- nchains:

  A count of the number of chains (default: 3).

- niters:

  A count of the number of iterations to save per chain (default: 1000).

- nthin:

  A count of the thinning interval.

- parallel:

  A flag indicating whether to perform the analysis in parallel if
  possible.

- quiet:

  A flag indicating whether to disable messages and warnings, including
  sampling progress.

- glance:

  A flag indicating whether to print a model summary.

- beep:

  A flag indicating whether to beep on completion of the analysis.

- seed:

  A positive whole number specifying the seed to use. The default is
  random. This is currently only implemented for Stan models.

- stan_engine:

  A string selecting the Stan engine:

  - `"cmdstan-mcmc"`: MCMC via
    [`cmdstanr::sample()`](https://mc-stan.org/cmdstanr/reference/model-method-sample.html).

  - `"cmdstan-pathfinder"`: pathfinder via
    [`cmdstanr::pathfinder()`](https://mc-stan.org/cmdstanr/reference/model-method-pathfinder.html).

  - `"cmdstan-variational"`: variational ADVI via
    [`cmdstanr::variational()`](https://mc-stan.org/cmdstanr/reference/model-method-variational.html).

  - `"cmdstan-optimize"`: optimization via
    [`cmdstanr::optimize()`](https://mc-stan.org/cmdstanr/reference/model-method-optimize.html).

  - `"cmdstan-laplace"`: Laplace approximation via
    [`cmdstanr::laplace()`](https://mc-stan.org/cmdstanr/reference/model-method-laplace.html).

  Defaults to `character(0)`. Any value other than the five above
  (including the empty default) falls back to MCMC via
  [`rstan::sampling()`](https://mc-stan.org/rstan/reference/stanmodel-method-sampling.html).
  Ignored for JAGS models, which always use
  [rjags](https://rdrr.io/pkg/rjags/man/rjags-package.html).

- niters_warmup:

  A count of the number of warmup iterations. The default is to use the
  same number of iterations as `niters`. This is currently only
  implemented for Stan models.

- ...:

  Additional arguments passed to
  [`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md).

## Value

An `mb_analysis` or `mb_meta_analysis`. See
[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
for details.

## Details

Only `select_data` is forwarded to
[`model()`](https://poissonconsulting.github.io/embr/reference/model.md).
If you need to set `new_expr`, `random_effects`, `new_expr_vec`, or
`gen_inits`, build the model with
[`model()`](https://poissonconsulting.github.io/embr/reference/model.md)
directly and pass it to
[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md).

## See also

[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
for full argument documentation and engine details.
