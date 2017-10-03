#' Set Analysis Mode
#'
#' Sets analysis mode. Possible values are 'debug', 'trial', 'report' or 'paper'.
#'
#' @param mode A string of the analysis mode.
#' @export
set_analysis_mode <- function(mode = "report") {
  check_string(mode)

  if (mode == "debug") {
    options(mb.parallel = FALSE,
            mb.quick = TRUE,
            mb.quiet = FALSE,
            mb.beep = TRUE)
  } else if (mode == "trial") {
    options(mb.parallel = getDoParWorkers() >= 2L,
            mb.quick = TRUE,
            mb.quiet = TRUE,
            mb.beep = FALSE)
  } else if (mode == "report") {
    options(mb.parallel = getDoParWorkers() >= 4L,
            mb.quick = FALSE,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.rhat = 1.1,
            mb.esr = 0.25,
            mb.nreanalyses = 2L,
            mb.duration = dhours(1))
  } else if (mode == "paper") {
    options(mb.parallel =  getDoParWorkers() >= 4L,
            mb.quick = FALSE,
            mb.quiet = TRUE,
            mb.beep = TRUE,
            mb.rhat = 1.05,
            mb.esr = 0.5,
            mb.nreanalyses = 3L,
            mb.duration = dhours(10))
  } else error("mode '", mode,"' unrecognised (possible values are 'debug', 'trial', 'report' or 'paper')")
}
