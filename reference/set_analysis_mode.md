# Set Analysis Mode

Sets analysis mode.

## Usage

``` r
set_analysis_mode(mode = "report")
```

## Arguments

- mode:

  A string of the analysis mode.

## Value

The old options.

## Details

The possible modes are as follows:

- 'debug':

  To rapidly identify problems with a model definition.

- 'quick':

  To quickly test code runs.

- 'report':

  To produce results for a report.

- 'paper':

  To produce results for a peer-reviewed paper.

- 'check':

  To run when checking a package.

- 'reset':

  To reset all the options to NULL so that they are the default values
  for each function call.

In each case the mode is a unique combination of the following package
options

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
set_analysis_mode("reset")
} # }
```
