#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @inheritParams analyse_data
#' @param analysis An object inheriting from class mb_analysis or a list of such objects.
#' @export
reanalyse <- function(analysis, quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE),
                      ...) {
  UseMethod("reanalyse")
}

#' @export
reanalyse.list <- function(analysis,
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  plyr::llply(analysis, reanalyse, quick = quick, quiet = quiet, beep = FALSE, ...)
}

#' @export
reanalyse.mb_model <- function(analysis,
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects inheriting from class 'mb_model'")
}

#' @export
reanalyse.mb_analysis <- function(analysis,
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects of the virtual class 'mb_analysis'")
}
