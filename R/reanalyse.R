#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @param object The object to reanalyse.
#' @param ... Additional arguments.
#' @export
reanalyse <- function(object, ...) {
  UseMethod("reanalyse")
}

reanalyse_list <- function(object, rhat, efs, nreanalyses, duration, parallel, quick, quiet, glance, beep, ...) {
  cat("Model:", names(object), "\n")
  object <- reanalyse(object[[1]], rhat = rhat, efs = efs, nreanalyses = nreanalyses,
                      duration = duration, quick = quick, quiet = quiet,
                      glance = glance, beep = FALSE, ...)
  list(object)
}

#' Reanalyse List
#'
#' @param object The object to reanalyse.
#' @param rhat A number specifying the rhat threshold.
#' @param efs A number specifying the effective sampling rate.
#' @param nreanalyses A count between 1 and 6 specifying the maximum number of reanalyses.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param ... Unused arguments.
#' @export
reanalyse.list <- function(object,
                           rhat = getOption("mb.rhat", 1.1),
                           efs = getOption("mb.efs", 0.33),
                           nreanalyses = getOption("mb.nreanalyses", 1L),
                           duration = getOption("mb.duration", dhours(1)),
                           parallel = getOption("mb.parallel", FALSE),
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           glance = getOption("mb.glance", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  .Deprecated("reanalyse.mb_analyses")
  class(object) <- "mb_analyses"
  reanalyse(object, rhat = rhat, efs = efs, duration = duration, parallel = parallel,
            quick = quick, quiet = quiet, glance = glance, beep = beep, ...)
}

#' Reanalyse
#'
#' @param object The object to reanalyse.
#' @param nreanalyses A count between 1 and 6 specifying the maximum number of reanalyses.
#' @param rhat A number specifying the rhat threshold.
#' @param efs A number specifying the minimum effective sampling rate.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible
#' @param ... Unused arguments.
#' @export
reanalyse.mb_analysis <- function(object,
                                  rhat = getOption("mb.rhat", 1.1),
                                  efs = getOption("mb.efs", 0.33),
                                  nreanalyses = getOption("mb.nreanalyses", 1L),
                                  duration = getOption("mb.duration", dhours(1)),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects of the virtual class 'mb_analysis'")
}

#' Reanalyse
#'
#' @param object The object to reanalyse.
#' @param rhat A number specifying the rhat threshold.
#' @param efs A number specifying the effective sampling rate.
#' @param nreanalyses A count between 1 and 7 specifying the maximum number of reanalyses.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible
#' @param ... Unused arguments.
#' @export
reanalyse.mb_analyses <- function(object,
                                  rhat = getOption("mb.rhat", 1.1),
                                  efs = getOption("mb.efs", 0.33),
                                  nreanalyses = getOption("mb.nreanalyses", 1L),
                                  duration = getOption("mb.duration", dhours(1)),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(object)) return(object)

  names <- names(object)
  if (is.null(names)) {
    names(object) <- 1:length(object)
  }

  object %<>% purrr::lmap(reanalyse_list, rhat = rhat, efs = efs,
                          nreanalyses = nreanalyses, duration = duration,
                          quick = quick, quiet = quiet, glance = glance, beep = FALSE, ...)
  names(object) <- names
  class(object) <- "mb_analyses"
  object
}
