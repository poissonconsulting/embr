#' Set Analysis Mode
#'
#' Sets analysis mode.
#'
#' The possible modes are as follows:
#' \describe{
#'   \item{'debug'}{To rapidly identify problems with a model definition.}
#'   \item{'quick'}{To quickly test code runs.}
#'   \item{'report'}{To produce results for a report.}
#'   \item{'paper'}{To produce results for a peer-reviewed paper.}
#'   \item{'check'}{To run when checking a package.}
#'   \item{'reset'}{To reset all the options to NULL so that they are the default values for each function call.}
#' }
#'
#' In each case the mode is a unique combination of the following package options
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
#' @param mode A string of the analysis mode.
#' @return The old options.
#' @export
#' @examples
#' \dontrun{
#' set_analysis_mode("reset")
#' }
set_analysis_mode <- function(mode = "report") {
  check_string(mode)

  if (mode == "reset") {
    options(mb.nchains = NULL,
            mb.niters = NULL,
            mb.nthin = NULL,
            mb.parallel = NULL,
            mb.quiet = NULL,
            mb.beep = NULL,
            mb.glance = NULL,
            mb.nreanalyses = NULL,
            mb.rhat = NULL,
            mb.esr = NULL,
            mb.duration = NULL,
            mb.conf_level = NULL)
  } else if (mode == "debug") {
    options(mb.nchains = 2L,
            mb.niters = 10L,
            mb.nthin = 1L,
            mb.parallel = FALSE,
            mb.quiet = FALSE,
            mb.beep = FALSE,
            mb.glance = TRUE,
            mb.nreanalyses = 0L,
            mb.rhat = 1.05,
            mb.esr = 0.1,
            mb.duration = dminutes(1),
            mb.conf_level = 0.95)
  } else if (mode == "quick") {
    options(mb.nchains = 2L,
            mb.niters = 10L,
            mb.nthin = 1L,
            mb.parallel = getDoParWorkers() >= 2L,
            mb.quiet = TRUE,
            mb.beep = FALSE,
            mb.glance = TRUE,
            mb.nreanalyses = 0L,
            mb.rhat = 1.05,
            mb.esr = 0.1,
            mb.duration = dminutes(1),
            mb.conf_level = 0.95)
  } else if (mode == "check") {
    options(mb.nchains = 2L,
            mb.niters = 500L,
            mb.nthin = NULL,
            mb.parallel = getDoParWorkers() >= 2L,
            mb.quiet = TRUE,
            mb.beep = FALSE,
            mb.glance = FALSE,
            mb.nreanalyses = 1L,
            mb.rhat = 1.0,
            mb.esr = 1.0,
            mb.duration = dminutes(2),
            mb.conf_level = 0.95)
  } else if (mode == "report") {
    options(mb.nchains = 3L,
            mb.niters = 500L,
            mb.nthin = NULL,
            mb.parallel = getDoParWorkers() >= 3L,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.glance = TRUE,
            mb.nreanalyses = 1L,
            mb.rhat = 1.05,
            mb.esr = 0.1,
            mb.duration = dhours(1),
            mb.conf_level = 0.95)
  } else if (mode == "paper") {
    options(mb.nchains = 4L,
            mb.niters = 1000L,
            mb.nthin = NULL,
            mb.parallel = getDoParWorkers() >= 4L,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.glance = TRUE,
            mb.nreanalyses = 2L,
            mb.rhat = 1.01,
            mb.esr = 0.25,
            mb.duration = dhours(6),
            mb.conf_level = 0.95)
  } else err("mode '", mode,"' unrecognised (possible values are 'debug', 'reset', 'check', 'quick', 'report' or 'paper')")
}
