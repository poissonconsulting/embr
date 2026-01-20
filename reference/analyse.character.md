# Analyse Character Model

Analyses a model defined as a character string containing Stan or JAGS
code. The character string is first converted to an mb_model object,
then passed on to
[`analyse.mb_model()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_model.md)

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

  A character string containing Stan or JAGS model code.

- data:

  The data frame to analyse.

- select_data:

  A named list specifying the columns to select and their associated
  classes and values as well as transformations and scaling options.

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

  A string specifying the Stan engine to use:

  - `"rstan"` for MCMC sampling via `rstan::sampling()` (default).

  - `"cmdstan-mcmc"` for MCMC sampling via `cmdstanr::sample()`

  - `"cmdstan-pathfinder"` for pathfinder estimation via
    `cmdstanr::pathfinder()`

  - `"cmdstan-optimize"` for optimization via `cmdstanr::optimize()`

  - `"cmdstan-laplace"` for Laplace approximation via
    `cmdstanr::laplace()`

- niters_warmup:

  A count of the number of warmup iterations. The default is to use the
  same number of iterations as `niters`. This is currently only
  implemented for Stan models.

- ...:

  Additional arguments passed to the underlying estimation function. See
  [`analyse.mb_model()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_model.md)
  for details.

## Value

An mb_analysis object containing the fitted model results.

## See also

- [`analyse.mb_model()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_model.md)
  for analysing a single model

- [`analyse.mb_models()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_models.md)
  for analysing multiple models
