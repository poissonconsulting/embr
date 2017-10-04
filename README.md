
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![stability-unstable](https://img.shields.io/badge/stability-unstable-yellow.svg)](https://github.com/joethorley/stability-badges#unstable) [![Travis-CI Build Status](https://travis-ci.org/poissonconsulting/mbr.svg?branch=master)](https://travis-ci.org/poissonconsulting/mbr) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/mbr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/mbr) [![Coverage Status](https://img.shields.io/codecov/c/github/poissonconsulting/mbr/master.svg)](https://codecov.io/github/poissonconsulting/mbr?branch=master) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/mbr)](https://cran.r-project.org/package=mbr)

mbr
===

Introduction
------------

`mbr` (pronounced MBR) is an R package of utility functions and virtual classes for the model builder family of R packages.

Currently there are packages which implement the functionality for JAGS ([jmbr](https://github.com/poissonconsulting/jmbr)), STAN ([smbr](https://github.com/poissonconsulting/smbr)) and TMB ([tmbr](https://github.com/poissonconsulting/tmbr)).

Demonstration
-------------

``` r
library(magrittr)
library(ggplot2)
library(mbr)
#> Warning: package 'dplyr' was built under R version 3.4.2
```

Installation
------------

To install from GitHub

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/mbr")

Contribution
------------

Please report any [issues](https://github.com/poissonconsulting/mbr/issues).

[Pull requests](https://github.com/poissonconsulting/mbr/pulls) are always welcome.

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
