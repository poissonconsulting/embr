# Get Analysis Mode

Gets analysis mode.

## Usage

``` r
get_analysis_mode()
```

## Value

A named list of the current package options.

## Details

Retrieves what is set for each of the following package options.

- mb.nchains:

  A count of the number of chains.

- mb.niters:

  A count of the number of simulations to save per chain.

- mb.nthin:

  A count of the thining interval.

- mb.parallel:

  A flag indicating whether to perform the analysis in parallel.

- mb.quiet:

  A flag indicating whether to disable tracing information.

- mb.beep:

  A flag indicating whether to beep on completion of the analysis.

- mb.glance:

  A flag indicating whether to print a model summary.

- mb.nreanalyses:

  A count specifying the maximum number of reanalyses.

- mb.rhat:

  A number specifying the rhat threshold.

- mb.esr:

  A number specifying the minimum effective sampling rate.

- mb.duration:

  The maximum total time to spend on analysis and reanalysis.

- mb.conf_level:

  A number specifying the confidence level.

## Examples

``` r
if (FALSE) { # \dontrun{
get_analysis_mode()
} # }
```
