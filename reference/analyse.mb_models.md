# Analyse

Analyse

## Usage

``` r
# S3 method for class 'mb_models'
analyse(
  x,
  data,
  nchains = getOption("mb.nchains", 3L),
  niters = getOption("mb.niters", 1000L),
  nthin = getOption("mb.thin", NULL),
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

  An object inheriting from class mb_model or a list of such objects.

- data:

  The data frame to analyse.

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

  Additional arguments.
