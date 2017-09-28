#' Set Analysis Mode
#'
#' Sets analysis mode. Possible values are 'debug', 'test', 'report' or 'paper'.
#'
#' @param mode A string of the analysis mode.
#' @export
set_analysis_mode <- function(mode = "report") {
  check_string(mode)

  if (mode == "debug") {
    options(mb.parallel = FALSE,
            mb.quick = FALSE,
            mb.quiet = FALSE,
            mb.glance = TRUE,
            mb.beep = TRUE,
            mb.rhat = 1.2,
            mb.nreanalyses = 1L,
            mb.duration = dhours(1))
  } else if (mode == "test") {
    options(mb.parallel = TRUE,
            mb.quick = TRUE,
            mb.quiet = TRUE,
            mb.glance = TRUE,
            mb.beep = FALSE,
            mb.rhat = 1.5,
            mb.nreanalyses = 1L,
            mb.duration = dminutes(10))
  } else if (mode == "report") {
    options(mb.parallel = TRUE,
            mb.quick = FALSE,
            mb.quiet = TRUE,
            mb.glance = TRUE,
            mb.beep = TRUE,
            mb.rhat = 1.1,
            mb.nreanalyses = 2L,
            mb.duration = dhours(1))
  } else if (mode == "paper") {
    options(mb.parallel = TRUE,
            mb.quick = FALSE,
            mb.quiet = TRUE,
            mb.glance = FALSE,
            mb.beep = TRUE,
            mb.rhat = 1.05,
            mb.nreanalyses = 3L,
            mb.duration = dhours(10))
  } else error("mode '", mode,"' unrecognised (possible values are 'debug', 'test', 'report' or 'paper')")
}
