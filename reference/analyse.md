# Analyse Models

Generic function for performing Bayesian analysis on models using Stan
or JAGS, or maximum likelihood analysis using TMB.

For more useful documentation, see the specific methods:

- [`analyse.mb_model()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_model.md)
  for single model analysis (Stan/JAGS). This is the most commonly used
  method.

- [`analyse.mb_models()`](https://poissonconsulting.github.io/embr/reference/analyse.mb_models.md)
  for multiple model analysis (Stan/JAGS).

- [`analyse.character()`](https://poissonconsulting.github.io/embr/reference/analyse.character.md)
  for character model analysis (Stan/JAGS). This allows you to skip the
  model creation step.

## Usage

``` r
analyse(x, ...)
```

## Arguments

- x:

  The object to analyse.

- ...:

  Additional arguments passed to methods.

## Value

An analysis object (type depends on input and engine used).
