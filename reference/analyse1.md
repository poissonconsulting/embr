# Internal dispatch for fitting a single model + dataset

Called by
[`analyse.mb_model()`](https://poissonconsulting.github.io/embr/reference/analyse.md)
once the data have been validated and the model has been compiled.
Backend packages (`smbr2`, `jmbr`) register methods for each engine.

End users should call
[`analyse()`](https://poissonconsulting.github.io/embr/reference/analyse.md),
not `analyse1()` directly.

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

  A validated data frame.

- loaded:

  The compiled / loaded model, as returned by
  [`load_model()`](https://poissonconsulting.github.io/embr/reference/load_model.md).

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

  Additional arguments passed to the engine-specific estimation
  function.

## Value

An `mb_analysis` object.
