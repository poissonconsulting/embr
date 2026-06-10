# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working
with code in this repository.

## Purpose

`embr` is the shared foundation for the model builder family of R
packages (jmbr/JAGS, smbr/Stan, tmbr/TMB). It provides virtual S3
classes and generic functions that engine-specific packages implement
via
[`analyse1()`](https://poissonconsulting.github.io/embr/reference/analyse1.md)
dispatch.

Several dependencies are installed from GitHub remotes
(poissonconsulting/mcmcr, mcmcdata, mcmcderive, newdata, rescale, jmbr)
— use `pak::pak("poissonconsulting/embr")` to install.

## Development Commands

``` r

# Document and reload
devtools::document()
devtools::load_all()

# Run all tests
devtools::test()

# Run a single test file
devtools::test(filter = "pars")

# Check package
devtools::check()
```

## Architecture

Three layered S3 class hierarchies, each with engine-specific subclasses
(`jmb_*`, `smb_*`, `tmb_*`, `pmb_*`, `lmb_*`):

**mb_code** — model code string with identified template type.
[`mb_code()`](https://poissonconsulting.github.io/embr/reference/mb_code.md)
detects type and dispatches
[`new_mb_code()`](https://poissonconsulting.github.io/embr/reference/mb_code.md).
`pars()` extracts parameter names;
[`rm_comments()`](https://poissonconsulting.github.io/embr/reference/rm_comments.md)
strips comments before parsing.

**mb_model** — complete model specification: `code` (mb_code),
`select_data` (column specs + transforms), `center`/`scale`
(normalization), `random_effects` (named list of factor vectors),
`fixed` (regex for monitored params), `derived` (character vector),
`modify_data`/`modify_new_data` (custom functions), `new_expr`
(predictive expression), `drops` (list of scalar params that can be
fixed at 0), `gen_inits`, `nthin`. Created via
`model(code_string, ...)`.

**mb_analysis** — fitted model result storing `model`, `data`, `mcmcr`
(posterior samples), `duration`, `logLik`. Engine packages implement
[`analyse1()`](https://poissonconsulting.github.io/embr/reference/analyse1.md)
and return an `mb_analysis` subclass. Collections: `mb_analyses` (same
data, multiple models), `mb_meta_analysis` (one model, multiple
datasets), `mb_meta_analyses`.

### Key dispatch pattern

    analyse(x, data, ...)
      analyse.character()   → model(x) → analyse(model, data)
      analyse.mb_model()    → analyse_data() → analyse1()   # engine implements this
      analyse.mb_models()   → analyse_model() per model

Most generics (`coef`, `pars`, `IC`, `glance`, `tidy`, `predict`,
`fitted`, `residuals`, `converged`) follow the same pattern: single
analysis → collection → meta-collection.

### Parameter management

[`drop_pars()`](https://poissonconsulting.github.io/embr/reference/drop_pars.md)
walks the model code AST to replace named scalar parameters with `0`,
enabling automated model selection.
[`make_all_models()`](https://poissonconsulting.github.io/embr/reference/make_all_models.md)
generates all combinations from `drops`;
[`backwards()`](https://poissonconsulting.github.io/embr/reference/backwards.md)
runs stepwise elimination by IC.

### Data flow

1.  [`select_rescale_data()`](https://poissonconsulting.github.io/embr/reference/select_rescale_data.md)
    — selects columns per `select_data` spec, applies centering/scaling
2.  [`modify_data()`](https://poissonconsulting.github.io/embr/reference/modify_data.md)
    — converts data.frame to named list via user-supplied function +
    `numericize_factors()`
3.  [`analyse1()`](https://poissonconsulting.github.io/embr/reference/analyse1.md)
    (engine) — fits model, returns `mb_analysis`
4.  [`coef()`](https://rdrr.io/r/stats/coef.html),
    [`predict()`](https://rdrr.io/r/stats/predict.html), `mcmc_derive()`
    — extract results from `mcmcr` posterior

### MCMC metadata

Global options control defaults (prefix `mb.`): `mb.nchains`,
`mb.niters`, `mb.nthin`, `mb.parallel`, `mb.quiet`, `mb.rhat` (1.1),
`mb.esr` (0.33), `mb.conf_level` (0.95), `mb.fixed` (`"^[^e]"`),
`mb.stan_engine`.

`converged()` checks rhat \< `mb.rhat` and ESR \> `mb.esr`.
[`IC()`](https://poissonconsulting.github.io/embr/reference/IC.md)
returns AICc for frequentist analyses and WAIC for Bayesian. Model
averaging in
[`coef.mb_analyses()`](https://poissonconsulting.github.io/embr/reference/coef.mb_analyses.md)
uses IC weights.

## Testing

Integration tests (`test-zzz-analyse*.R`) require jmbr/JAGS or Stan
installed and are slow. Pre-computed `.RDS` analysis objects in
`inst/test-objects/` are loaded by many tests to avoid re-fitting.
Snapshots are in `tests/testthat/_snaps/`.

Most unit tests follow the pattern: construct a minimal `mb_code` or
`mb_model`, call the function, check with `expect_identical` /
`expect_equal` / `expect_snapshot`.
