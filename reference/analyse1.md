# Analyse

Analyse

## Usage

``` r
analyse1(
  model,
  data,
  loaded,
  nchains,
  niters,
  nthin,
  quiet,
  glance,
  parallel,
  seed,
  niters_warmup,
  ...
)
```

## Arguments

- model:

  The mb_model to analyse.

- data:

  The data.

- loaded:

  The loaded model.

- nchains:

  A count of the number of chains (default: 3).

- niters:

  A count of the number of iterations to save per chain (default: 1000).

- nthin:

  A count of the thinning interval.

- quiet:

  A flag indicating whether to disable messages and warnings, including
  sampling progress.

- glance:

  A flag indicating whether to print a model summary.

- parallel:

  A flag indicating whether to perform the analysis in parallel if
  possible.

- seed:

  A positive whole number specifying the seed to use. The default is
  random. This is currently only implemented for Stan models.

- niters_warmup:

  A count of the number of warmup iterations. The default is to use the
  same number of iterations as `niters`. This is currently only
  implemented for Stan models.

- ...:

  Additional arguments.
