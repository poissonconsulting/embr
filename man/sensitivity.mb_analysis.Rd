% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sensitivity.R
\name{sensitivity.mb_analysis}
\alias{sensitivity.mb_analysis}
\title{Summarize model sensitivity}
\usage{
\method{sensitivity}{mb_analysis}(x, by = "term", ...)
}
\arguments{
\item{x}{The mb_analysis object.}

\item{by}{A string indicating whether to determine by "term", "parameter", or
"all".}

\item{...}{Additional arguments passed to
\code{\link[priorsense:powerscale-sensitivity]{priorsense::powerscale_sensitivity()}}.}
}
\description{
Summarize model sensitivity
}
