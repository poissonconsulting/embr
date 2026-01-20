# Analyse Single Model

Performs parameter estimation on a single mb_model object using Stan or
JAGS.

The model fitting method dispatched depends on the class of the mb_model
object and the `stan_engine` argument.

If the model is a JAGS model, [rjags](https://github.com/cran/rjags) is
used for MCMC sampling. If the model is a Stan model,
[rstan](https://github.com/stan-dev/rstan) or
[cmdstanr](https://mc-stan.org/cmdstanr/) is used, depending on the
value provided to `stan_engine`:

- `"cmdstan-mcmc"` for [MCMC
  sampling](https://mc-stan.org/docs/cmdstan-guide/mcmc_config.html) via
  `cmdstanr::sample()`

- `"cmdstan-optimize"` for
  [optimization](https://mc-stan.org/docs/cmdstan-guide/optimize_config.html)
  via `cmdstanr::optimize()`

- `"cmdstan-pathfinder"` for
  [pathfinder](https://mc-stan.org/docs/cmdstan-guide/pathfinder_config.html)
  estimation via `cmdstanr::pathfinder()`

- `"cmdstan-variational"` for [variational
  ADVI](https://mc-stan.org/docs/cmdstan-guide/variational_config.html)
  estimation via `cmdstanr::variational()`

- `"cmdstan-laplace"` for [Laplace
  approximation](https://mc-stan.org/docs/cmdstan-guide/laplace_sample_config.html)
  via `cmdstanr::laplace()`

- Any other character value will default to MCMC sampling via
  `rstan::sampling()`

## Usage

``` r
# S3 method for class 'mb_model'
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

  An mb_model object to analyse.

- data:

  The data frame to analyse, or a list of data frames for multiple
  datasets.

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

  Additional arguments passed to the underlying estimation function (see
  below for details).

## Value

- If `data` is a data.frame: An mb_analysis object

- If `data` is a list of data.frames: An mb_meta_analysis object

## Details

For CmdStan models, additional arguments can be passed to the
engine-specific estimation functions via the `...` argument.

For example, additional options in `cmdstanr::sample()` include:

- `adapt_delta` - Target acceptance rate (0 \< adapt_delta \< 1)

- `max_treedepth` - Maximum tree depth for NUTS sampler

- `step_size` - Initial step size for sampler

- `refresh` - How often to print sampling progress

- `output_dir` - Directory to save output files (default: NULL, uses
  temporary directory)

Some additional options in `cmdstanr::pathfinder()` include:

- `num_paths` - Number of single-path Pathfinders to run (default: 4)

- `history_size` - L-BFGS history size for approximating Hessian
  (default: 5)

- `max_lbfgs_iters` - Maximum L-BFGS iterations per path (default: 1000)

- `psis_resample` - Whether to use Pareto-smoothed importance sampling
  (default: TRUE)

Some additional options in `cmdstanr::variational()` include:

- `algorithm` - Variational algorithm: "meanfield" (default) or
  "fullrank"

Some aditional options in `cmdstanr::optimize()` include:

- `algorithm` - Optimization algorithm: "lbfgs" (default), "bfgs", or
  "newton"

Some additional options in `cmdstanr::laplace()` include:

- `mode` - CmdStanMLE object from previous optimization (if NULL, runs
  optimize)

- `jacobian` - Whether mode used Jacobian adjustment (default: TRUE)

Each `analyse1` method checks for the presence of conflicting arguments
and will ignore these (e.g., `iter_sampling` with
`stan_engine = 'cmdstan-mcmc'` will be ignored in favour of iterations
set via `niters`)

One exception is for `init`, which can be passed via '...' to override
defaults or inits generated via `gen_inits()` in
[`model()`](https://poissonconsulting.github.io/embr/reference/model.md).
Non-MCMC model fitting methods cannot use `gen_inits()`. Some arguments
in `analyse.mb_model()` are unused in non-MCMC methods (e.g., `nthin`,
`niters_warmup`).

For pathfinder, variational, and laplace methods, `niters` samples are
drawn from the approximated posterior distributions.

## See also

- [`analyse.character()`](https://poissonconsulting.github.io/embr/reference/analyse.character.md)
  for analysing a character model template

- [`analyse.mb_models()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_models.md)
  for analysing multiple models

## Examples

``` r
if (FALSE) { # \dontrun{
# Stan model with RStan (default)
analysis <- analyse(stan_model, data, nchains = 4, niters = 1000)

# Stan model with CmdStanR MCMC
analysis <- analyse(stan_model, data,
  stan_engine = "cmdstan-mcmc",
  nchains = 4, niters = 1000
)

# Stan model with CmdStanR Pathfinder
analysis <- analyse(stan_model, data,
  stan_engine = "cmdstan-pathfinder",
  niters = 500
)

# JAGS model
analysis <- analyse(jags_model, data, nchains = 4, niters = 2000)

# Passing engine-specific arguments
analysis <- analyse(stan_model, data,
  stan_engine = "cmdstan-mcmc",
  nchains = 4, niters = 2000,
  adapt_delta = 0.99, # cmdstanr::sample argument
  iter_warmup = 500L
) # cmdstanr::sample argument

analysis <- analyse(stan_model, data,
  nchains = 4, niters = 2000,
  control = list(adapt_delta = 0.95)
) # rstan::sampling argument

# Multiple datasets
data_list <- list(dataset1 = data1, dataset2 = data2)
analyses <- analyse(model, data_list, nchains = 3)
} # }
```
