# Define a Model

Define a model, including code, data, monitoring, and post-fitting
specification. The returned `mb_model` is consumed by
[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
and downstream by
[`predict.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analysis.md)
and
[`mcmc_derive_data()`](https://rdrr.io/pkg/mcmcdata/man/mcmc_derive_data.html).

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

  An `mb_code` object built with
  [`mb_code()`](https://poissonconsulting.github.io/embr/reference/mb_code.md),
  or `NULL` (the default). When `NULL`, the model code is built inline
  from `code`. Passing a character string or an `mb_analysis` is
  deprecated.

- ...:

  These dots are for future extensions and must be empty.

- code:

  Model code (Stan or JAGS expression or string) to pass to
  [`mb_code()`](https://poissonconsulting.github.io/embr/reference/mb_code.md).
  Only used when `x = NULL`.

- gen_inits:

  A single-argument function returning a named list of initial values
  per chain. Receives the modified data list (i.e. after `select_data`,
  rescaling, type coercion, factor-count and `nObs` injection, and
  `modify_data`). Returning [`list()`](https://rdrr.io/r/base/list.html)
  lets the backend fall back to its own defaults (JAGS samples from
  priors; Stan uses its random init). Non-MCMC `cmdstan-*` engines
  ignore it.

- random_effects:

  Named list mapping parameter names in the model code to one or more
  grouping factor columns from `select_data`. Each named factor must
  appear in `select_data` and must not also be in `derived`.

- fixed:

  A string of a regular expression of parameter names to monitor as
  fixed effects.

- derived:

  A character vector of derived parameters to monitor.

- select_data:

  A named list specifying the columns to select and their expected
  classes and values as well as transformations and scaling options. See
  the **select_data** section of `model()`.

- center:

  A character vector of the columns to center.

- scale:

  A character vector of the columns to scale (after centering).

- modify_data:

  A single argument function to modify the data (in list form)
  immediately prior to the analysis.

- nthin:

  An integer specifying the thinning interval.

- new_expr:

  An R expression or character string of R code defining the predictive
  relationships and derived quantities. See the **new_expr** section of
  `model()`.

- new_expr_vec:

  Flag controlling whether to vectorise the `new_expr` code via
  [`mcmcderive::expression_vectorize()`](https://poissonconsulting.github.io/mcmcderive/reference/expression_vectorize.html).
  See the **new_expr** section of `model()` for safe patterns and silent
  fallbacks.

- modify_new_data:

  SA single argument function to modify new data (in list form)
  immediately prior to calculating new_expr.

- drops:

  A list of character vectors naming scalar parameters to fix at 0 in
  the model.

## Value

An object inheriting from class `"mb_model"`.

## Details

The data passed to
[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
is transformed through a fixed pipeline before reaching the model code:
`select_data` selects columns and applies any rescaling suffixes;
logical, date, and difftime columns are coerced to numeric; one
`n<Factor>` count is injected per factor; `nObs` is injected; and
finally the user's `modify_data` function runs against the resulting
list. `gen_inits` is then invoked against this same modified list, once
per chain, to seed initial values.

The monitored parameter set is the union of: names matching the `fixed`
regex, the names of `random_effects`, and `derived`. The default
`fixed = "^[^e]"` matches everything not starting with `e`. Names listed
in `random_effects` are always monitored regardless of the regex.

## select_data

Named list mapping data column names to type or range specifications:
`1L` for integer, `1` for numeric, `factor("")` for factor, `TRUE` for
logical. Where an explicit check is wanted, use a range form such as
`c(0L, 100L)` and append `NA` to allow missing values:
`c(0L, 100L, NA)`.

Appending a suffix to a column name requests a rescaling transformation;
the original column is replaced with the transformed version in the
analysis dataset.

|        |                                                  |
|--------|--------------------------------------------------|
| Suffix | Transformation                                   |
| (none) | Raw, untransformed                               |
| `+`    | Subtract the mean (center)                       |
| `-`    | Subtract the minimum (shift to 0)                |
| `=`    | Subtract the minimum and add 1 (shift to 1)      |
| `/`    | Divide by SD (scale)                             |
| `*`    | Subtract the mean and divide by SD (standardise) |

`*` is conventional for continuous covariates and `+` for year or date
variables. Never apply a suffix to the response. The `center` and
`scale` character-vector arguments are kept for backwards compatibility
and emit a deprecation warning; prefer `select_data` suffixes.

## new_expr

An R expression (e.g. `{ ... }`) or a character string of R code that is
evaluated post-fitting against the MCMC draws. It has access to the
sampled parameters, the modified data list, and `extras` helpers such as
`log_lik_*` and `res_*`. The expression typically defines the named
terms used by downstream tooling:

- `prediction[i]` for
  [`predict.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/predict.mb_analysis.md)

- `fit[i]` for
  [`fitted.mb_analysis()`](https://poissonconsulting.github.io/embr/reference/fitted.mb_analysis.md)
  and for residuals

- `log_lik[i]` for information criteria and prior sensitivity

- `lprior[k]` for prior sensitivity

The scale of `fit[i]` is model-specific: define it to match the
signature of the `res_*` and `log_lik_*` helpers you use (e.g.
response-scale for `res_neg_binom`, log-scale for `res_student` on
log-normal data). Scalar derived quantities defined outside the loop are
extractable via
`predict(analysis, new_data = character(0), term = "myScalar")`.

If `new_expr` is supplied as a string without wrapping braces they are
added automatically. Setting `new_expr_vec = TRUE` vectorises the
for-loop body via
[`mcmcderive::expression_vectorize()`](https://poissonconsulting.github.io/mcmcderive/reference/expression_vectorize.html)
for substantial speed gains. Vectorisation silently falls back to the
un-vectorised loop (no error) when the loop body contains
[`sum()`](https://rdrr.io/r/base/sum.html), nested for loops, or dynamic
range indexing such as `eK[year[i]:(year[i] + n)]`. Safe patterns:
linear predictors built from indexed terms, single-level
(`bSite[site[i]]`) and multi-level (`bParam[site[i], annual[i]]`)
indexing, link-function assignments (`log(eY[i]) <- ...`), and
polynomial terms on standardised predictors.

## See also

- The [analyse
  article](https://poissonconsulting.github.io/embr/articles/analyse.html)
  for a walkthrough including `select_data` transformations and
  `new_expr` structure.

- [`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
  to fit the model to data.

- [`analyse.character()`](https://poissonconsulting.github.io/embr/reference/analyse.character.md)
  for a shortcut that builds and fits in one call.

- [`update_model()`](https://poissonconsulting.github.io/embr/reference/update_model.md)
  to change arguments on an existing `mb_model`.

## Examples

``` r
if (FALSE) { # \dontrun{
# Stan model with a standardised continuous covariate and a site
# random effect.
count_model <- model(
  code = count_code, # a string or read_file("stan/count.stan")
  select_data = list(
    count = 1L,
    site = factor("a"),
    `temperature*` = 1
  ),
  random_effects = list(z_bSite = "site"),
  new_expr = {
    bSite <- z_bSite * sSite
    for (i in 1:nObs) {
      log(eCount[i]) <- bIntercept + bTemp * temperature[i] +
        bSite[site[i]]
      prediction[i] <- eCount[i]
      fit[i] <- eCount[i]
      log_lik[i] <- log_lik_neg_binom(count[i], eCount[i], bPhi)
    }
  },
  new_expr_vec = TRUE
)

# Reshape multi-pass data into a matrix and add a per-row pass count
# before the analysis runs; seed eAbundance with the observed totals.
depletion_model <- model(
  code = depletion_code,
  select_data = list(
    Pass1 = 1L, Pass2 = 1L, Pass3 = 1L,
    site = factor("a")
  ),
  modify_data = function(data) {
    Pass <- as.matrix(data[c("Pass1", "Pass2", "Pass3")])
    data$Pass <- Pass
    data$nPass <- ncol(Pass)
    data$Pass1 <- data$Pass2 <- data$Pass3 <- NULL
    data
  },
  gen_inits = function(data) {
    list(eAbundance = rowSums(data$Pass, na.rm = TRUE) + 1)
  }
)
} # }
```
