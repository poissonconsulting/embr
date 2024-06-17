#' Get Analysis Mode
#'
#' Gets analysis mode.
#'
#' Retrieves what is set for each of the following package options.
#'
#' \describe{
#'   \item{mb.nchains}{A count of the number of chains.}
#'   \item{mb.niters}{A count of the number of simulations to save per chain.}
#'   \item{mb.nthin}{A count of the thining interval.}
#'   \item{mb.parallel}{A flag indicating whether to perform the analysis in parallel.}
#'   \item{mb.quiet}{A flag indicating whether to disable tracing information.}
#'   \item{mb.beep}{A flag indicating whether to beep on completion of the analysis.}
#'   \item{mb.glance}{A flag indicating whether to print a model summary.}
#'   \item{mb.nreanalyses}{A count specifying the maximum number of reanalyses.}
#'   \item{mb.rhat}{A number specifying the rhat threshold.}
#'   \item{mb.esr}{A number specifying the minimum effective sampling rate.}
#'   \item{mb.duration}{The maximum total time to spend on analysis and reanalysis.}
#'   \item{mb.conf_level}{A number specifying the confidence level.}
#' }
#'
#' @return A named list of the current package options.
#' @export
#' @examples
#' \dontrun{
#' get_analysis_mode()
#' }
get_analysis_mode <- function() {
  list(
    mb.nchains = getOption("mb.nchains"),
    mb.niters = getOption("mb.niters"),
    mb.nthin = getOption("mb.nthin"),
    mb.parallel = getOption("mb.parallel"),
    mb.quiet = getOption("mb.quiet"),
    mb.beep = getOption("mb.beep"),
    mb.glance = getOption("mb.glance"),
    mb.nreanalyses = getOption("mb.nreanalyses"),
    mb.rhat = getOption("mb.rhat"),
    mb.esr = getOption("mb.esr"),
    mb.duration = getOption("mb.duration"),
    mb.conf_level = getOption("mb.conf_level")
  )
}
