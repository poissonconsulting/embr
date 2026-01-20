# Multiply Standard Deviation of Priors By

Multiply Standard Deviation of Priors By

## Usage

``` r
sd_priors_by(x, by = 10, distributions = c("normal", "lognormal", "t"), ...)

# S3 method for class 'mb_model'
sd_priors_by(x, by = 10, distributions = c("normal", "lognormal", "t"), ...)

# S3 method for class 'mb_analysis'
sd_priors_by(
  x,
  by = 10,
  distributions = c("normal", "lognormal", "t"),
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  glance = getOption("mb.glance", TRUE),
  beep = getOption("mb.beep", TRUE),
  ...
)
```

## Arguments

- x:

  The object.

- by:

  A double scalar of the multiplier.

- distributions:

  A character vector of the distributions to adjust. Possible values are
  "laplace" (double exponential), "logistic", "lognormal", "normal", "t"
  and "nt" (non-central Student t).

- ...:

  Not used.

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

## Value

The updated object.

## Methods (by class)

- `sd_priors_by(mb_model)`: Multiply Standard Deviation of Priors for an
  MB model

- `sd_priors_by(mb_analysis)`: Multiply Standard Deviation of Priors for
  an MB analysis
