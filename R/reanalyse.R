#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @inheritParams analyse_data
#' @param analysis An object inheriting from class mb_analysis or a list of such objects.
#' @param duration The target maximum amount of time to spend on analysis.
#' @export
reanalyse <- function(analysis,
                      duration = getOption("mb.duration", duration(1, "hours")),
                      parallel = getOption("mb.parallel", FALSE),
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE),
                      ...) {
  UseMethod("reanalyse")
}

#' @export
reanalyse.list <- function(analysis,
                           duration = getOption("mb.duration", duration(1, "hours")),
                           parallel = getOption("mb.parallel", FALSE),
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  plyr::llply(analysis, reanalyse, duration = duration, quick = quick, quiet = quiet, beep = FALSE, ...)
}

#' @export
reanalyse.mb_model <- function(analysis,
                               duration = getOption("mb.duration", duration(1, "hours")),
                               parallel = getOption("mb.parallel", FALSE),
                               quick = getOption("mb.quick", FALSE),
                               quiet = getOption("mb.quiet", TRUE),
                               beep = getOption("mb.beep", TRUE),
                               ...) {
  error("reanalyse is not defined for objects inheriting from class 'mb_model'")
}

#' @export
reanalyse.mb_analysis <- function(analysis,
                                  duration = getOption("mb.duration", duration(1, "hours")),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects of the virtual class 'mb_analysis'")
}
