% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model.R
\name{model}
\alias{model}
\title{MB Model}
\usage{
model(
  x = NULL,
  ...,
  code = NULL,
  gen_inits = NULL,
  random_effects = list(),
  fixed = getOption("mb.fixed", "^[^e]"),
  derived = character(0),
  select_data = list(),
  center = character(0),
  scale = character(0),
  modify_data = identity,
  nthin = getOption("mb.nthin", 1L),
  new_expr = NULL,
  new_expr_vec = getOption("mb.new_expr_vec", FALSE),
  modify_new_data = identity,
  drops = list()
)
}
\arguments{
\item{x}{A string, or an object inheriting from class \code{"mb_code"}.}

\item{...}{Unused arguments.}

\item{code}{Passed on to \code{\link[=mb_code]{mb_code()}}. If \code{x} is not \code{NULL}, \code{code} must be \code{NULL},
and vice versa.}

\item{gen_inits}{A single argument function taking the modified data and
returning a named list of initial values.}

\item{random_effects}{A named list specifying the random effects and the associated factors.}

\item{fixed}{A string of a regular expression specifying the fixed pars to monitor.}

\item{derived}{A character vector of the derived pars to monitor.}

\item{select_data}{A named list specifying the columns to select and their associated classes and values as well as transformations and scaling options.}

\item{center}{A character vector of the columns to center.}

\item{scale}{A character vector of the columns to scale (after centering).}

\item{modify_data}{A single argument function to modify the data (in list form) immediately prior to the analysis.}

\item{nthin}{A count specifying the thinning interval.}

\item{new_expr}{A string of R code specifying the predictive relationships.}

\item{new_expr_vec}{A flag specifying whether to vectorize the new_expr code.}

\item{modify_new_data}{A single argument function to modify new data (in list form) immediately prior to calculating new_expr.}

\item{drops}{A list of character vector of possible scalar pars to drop (fix at 0).}
}
\value{
An object inherting from class mb_model.
}
\description{
Creates MB model.
}
\details{
For tmb models gen_inits must specify all the fixed pars.
Missing random pars are assigned the value 0.

For jmb models unspecified the initial values for each chain are drawn from the prior distributions.
}
\seealso{
\code{\link[chk:check_data]{chk::check_data()}} \code{\link[rescale:rescale_c]{rescale::rescale_c()}}
}
