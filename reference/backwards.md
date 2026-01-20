# Backwards

Perform backwards step-wise regression on a model. Returns a list of the
analysis at each step starting with the full model.

## Usage

``` r
backwards(
  model,
  data,
  drops = list(),
  conf_level = getOption("mb.conf_level", 0.95),
  beep = getOption("mb.beep", TRUE),
  ...
)
```

## Arguments

- model:

  An object.

- data:

  Data.

- drops:

  A list of character vectors specifying the scalar parameters to
  consider.

- conf_level:

  A number specifying the confidence level. By default 0.95.

- beep:

  A flag indicating whether to beep on completion of the analysis.

- ...:

  Unused.

## Value

A list of the analyses.

## Details

drop is a list of character vectors specifying the scalar parameters to
possibly drop. If a list element consists of two or more strings then
the earlier strings are only available to drop after the later strings
have been eliminated. This allows polynomial dependencies to be
respected.
