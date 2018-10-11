
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/mbr.svg?branch=master)](https://travis-ci.org/poissonconsulting/mbr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/mbr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/mbr)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/mbr/master.svg)](https://codecov.io/github/poissonconsulting/mbr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1162349.svg)](https://doi.org/10.5281/zenodo.1162349)

# mbr

## Introduction

`mbr` (pronounced MBR) is an R package of utility functions and virtual
classes for the model builder family of R packages.

Currently there are packages which implement the functionality for JAGS
([jmbr](https://github.com/poissonconsulting/jmbr)), STAN
([smbr](https://github.com/poissonconsulting/smbr)) and TMB
([tmbr](https://github.com/poissonconsulting/tmbr)).

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/mbr)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/mbr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("mbr")

## Citation

``` 

To cite mbr in publications use:

  Joe Thorley (2018) mbr: Model Builder Utility Functions and
  Virtual Classes. doi: https://doi.org/10.5281/zenodo.1162349.

A BibTeX entry for LaTeX users is

  @Misc{,
    author = {Joe Thorley},
    year = {2018},
    title = {mbr: Model Builder Utility Functions and Virtual Classes},
    doi = {https://doi.org/10.5281/zenodo.1162349},
  }
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/mbr/issues).

[Pull requests](https://github.com/poissonconsulting/mbr/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Inspiration

[jaggernaut](https://github.com/poissonconsulting/jaggernaut)
