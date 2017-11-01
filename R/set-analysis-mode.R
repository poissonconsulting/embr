#' Set Analysis Mode
#'
#' Sets analysis mode. Possible values are 'reset', 'debug', 'check', 'quick', 'report' or 'paper'.
#'
#' @param mode A string of the analysis mode.
#' @export
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
            mb.conf_level = NULL,
            mb.profile = NULL)
  } else if (mode == "debug") {
    options(mb.nchains = 2L,
            mb.niters = 10L,
            mb.nthin = 1L,
            mb.parallel = FALSE,
            mb.quiet = FALSE,
            mb.beep = FALSE,
            mb.glance = TRUE,
            mb.nreanalyses = 0L,
            mb.conf_level = 0.95,
            mb.profile = FALSE)
  } else if (mode == "quick") {
    options(mb.nchains = 2L,
            mb.niters = 10L,
            mb.nthin = 1L,
            mb.parallel = getDoParWorkers() >= 2L,
            mb.quiet = TRUE,
            mb.beep = FALSE,
            mb.glance = TRUE,
            mb.nreanalyses = 0L,
            mb.conf_level = 0.95,
            mb.profile = FALSE)
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
            mb.conf_level = 0.95,
            mb.profile = FALSE)
  } else if (mode == "report") {
    options(mb.nchains = 3L,
            mb.niters = 500L,
            mb.nthin = NULL,
            mb.parallel = getDoParWorkers() >= 3L,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.glance = TRUE,
            mb.nreanalyses = 1L,
            mb.rhat = 1.1,
            mb.esr = 0.2,
            mb.duration = dhours(1),
            mb.conf_level = 0.95,
            mb.profile = FALSE)
  } else if (mode == "paper") {
    options(mb.nchains = 4L,
            mb.niters = 1000L,
            mb.nthin = NULL,
            mb.parallel = getDoParWorkers() >= 4L,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.glance = TRUE,
            mb.nreanalyses = 2L,
            mb.rhat = 1.05,
            mb.esr = 0.25,
            mb.duration = dhours(6),
            mb.conf_level = 0.95,
            mb.profile = TRUE)
  } else error("mode '", mode,"' unrecognised (possible values are 'debug', 'reset', 'check', 'quick', 'report' or 'paper')")
}
