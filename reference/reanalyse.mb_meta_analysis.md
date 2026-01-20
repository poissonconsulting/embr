# Reanalyse

Reanalyse

## Usage

``` r
# S3 method for class 'mb_meta_analysis'
reanalyse(
  object,
  rhat = getOption("mb.rhat", 1.1),
  esr = getOption("mb.esr", 0.33),
  nreanalyses = getOption("mb.nreanalyses", 1L),
  duration = getOption("mb.duration", dhours(1)),
  parallel = getOption("mb.parallel", FALSE),
  quiet = getOption("mb.quiet", TRUE),
  glance = getOption("mb.glance", TRUE),
  beep = getOption("mb.beep", TRUE),
  ...
)
```

## Arguments

- object:

  The object to reanalyse.

- rhat:

  A number specifying the rhat threshold.

- esr:

  A number specifying the effective sampling rate.

- nreanalyses:

  A count between 1 and 7 specifying the maximum number of reanalyses.

- duration:

  The maximum total time to spend on analysis/reanalysis.

- parallel:

  A flag indicating whether to perform the analysis in parallel if
  possible

- quiet:

  A flag indicating whether to disable tracing information.

- glance:

  A flag indicating whether to print summary of model.

- beep:

  A flag indicating whether to beep on completion of the analysis.

- ...:

  Unused arguments.
