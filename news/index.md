# Changelog

## embr 0.2.0.9000

- Merge pull request
  [\#103](https://github.com/poissonconsulting/embr/issues/103) from
  poissonconsulting/joethorley/issue102.

- Merge pull request
  [\#100](https://github.com/poissonconsulting/embr/issues/100) from
  poissonconsulting/joethorley/issue99.

- Merge pull request
  [\#94](https://github.com/poissonconsulting/embr/issues/94) from
  poissonconsulting/sensitivity.

## embr 0.2.0

- Add
  [`sensitivity()`](https://poissonconsulting.github.io/embr/reference/sensitivity.md)
  function to summarize powerscaled sensitivity analysis for reports.

## embr 0.1.1

- Add functions to do powerscaling sensitivity analyses on `mb_analysis`
  objects, using the `priorsense` package.

## embr 0.1.0

- Add `stan_engine` argument to
  [`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
  and methods to allow setting cmdstan engine and implementation of
  cmdstanr features via methods in `smbr2` package.
- Add `seed` and `niters_warmup` arguments to
  [`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
  and methods so that can be used by `smbr` and `smbr2`.
- Pass `...` to `analyse_data()` and
  [`analyse1()`](https://poissonconsulting.github.io/embr/reference/analyse1.md)
  to allow additional arguments to be passed to cmdstanr functions.

## embr 0.0.1.9038

- Remove `logLik` and `IC` columns from glance output.

## embr 0.0.1.9037

### Features

- Add
  [`get_analysis_mode()`](https://poissonconsulting.github.io/embr/reference/get_analysis_mode.md)
  function to get current package options

## embr 0.0.1.9036

### Features

- Implement `"pmb_code"` class to support a strict subset of the nimble
  language
  ([\#64](https://github.com/poissonconsulting/embr/issues/64)).

- [`check_model_pars()`](https://poissonconsulting.github.io/embr/reference/check_model_pars.md)
  returns `derived`
  ([\#62](https://github.com/poissonconsulting/embr/issues/62)).

### Chore

- `engine = "jags"`.

- Use raw GitHub file.

- Get JAGS.exe from S3 bucket.

- Relax test.

## embr 0.0.1.9035

- Remove `param_type` and `scalar` arguments from `pars.character()` and
  `pars.mb_code()` and `scalar` from `pars.model()` and add `"raw"`
  parameter type to `pars.mb_model()` and pars.mb_analysis().

## embr 0.0.1.9034

- Set default value of `new_expr_vec` to be
  `getOption("mb.new_expr_vec", FALSE)`
- Add `new_expr_vec = FALSE` to
  [`predict()`](https://rdrr.io/r/stats/predict.html).

## embr 0.0.1.9033

- Automatically wrap new expression if more than one.
- Set `new_expr_vec` to be flag that FALSE by default.
- Add `new_expr = FALSE` argument to mcmc_derive.mb_analyses.

## embr 0.0.1.9032

- `mcmc_derive()` and
  [`mcmc_derive_data()`](https://rdrr.io/pkg/mcmcdata/man/mcmc_derive_data.html)
  no longer vectorize new expression by default
- Rename from mbr to embr.
- [`posterior_predictive_check()`](https://poissonconsulting.github.io/embr/reference/posterior_predictive_check.md)
  now gives zeros by default.
- soft deprecated
  [`plot_data()`](https://poissonconsulting.github.io/embr/reference/plot_data.md).
- make `pars.character()` internal only.

## embr 0.0.1.9031

- Added `ref_fun2` argument.

- Added random_effects argument to predict etc to control random
  effects.

- Merge pull request
  [\#30](https://github.com/poissonconsulting/embr/issues/30) from
  poissonconsulting/changes_to_actions.

Updating R CMD check Actions

- Merge pull request
  [\#29](https://github.com/poissonconsulting/embr/issues/29) from
  poissonconsulting/chkor.

replace chkor

- Added zeros = FALSE argument to posterior_predictive_check() and type
  = NULL to residuals and simulate residuals.

- Remove zeros from posterior predictive checks.

- No longer export mcmc packages.

- Merge branch ‘master’ of github.com:poissonconsulting/embr.

- Renamed `resample_residuals()` to
  [`simulate_residuals()`](https://poissonconsulting.github.io/embr/reference/simulate_residuals.md).

- Added resample residuals which alters residual code!

## embr 0.0.1.9030

- Added
  [`posterior_predictive_check()`](https://poissonconsulting.github.io/embr/reference/posterior_predictive_check.md).

## embr 0.0.1.9029

- fix up simplify = TRUE

- add `deltaIC` to
  [`glance()`](https://generics.r-lib.org/reference/glance.html)

- add split and bound to rhat and converged

- add `deltaIC` to
  [`glance()`](https://generics.r-lib.org/reference/glance.html)

- add `marginalize_random_effects` argument to `data_set`

- numericize difftime values as cause problems for STAN

- [`set_analysis_mode()`](https://poissonconsulting.github.io/embr/reference/set_analysis_mode.md)
  now ensures all options are set unless `mode = "reset"` and `rhat` has
  been decreased from `1.1` to `1.05` for report mode and from `1.05` to
  `1.01` for paper mode.

- `parameters()` now returns `character(0)` as opposed to `NULL` if no
  parameters.

- Rename `derive()` and `derive_data()` to `mcmc_derive()` and
  [`mcmc_derive_data()`](https://rdrr.io/pkg/mcmcdata/man/mcmc_derive_data.html).

- Moved `pow()` to `mcmcderive` package.

## embr 0.0.1

- Added a `NEWS.md` file to track changes to the package.
