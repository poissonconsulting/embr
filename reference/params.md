# Parameter Descriptions

Parameter Descriptions

## Arguments

- param_type:

  A string indicating the type of terms to get the names for.

- type:

  A string of the residual type.

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

- niters_warmup:

  A count of the number of warmup iterations. The default is to use the
  same number of iterations as `niters`. This is currently only
  implemented for Stan models.

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

- ...:

  Unused.
