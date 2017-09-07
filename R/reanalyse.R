#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param analysis An object inheriting from class mb_analysis or a list of such objects.
#' @param rhat A number specifying the rhat threshold.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param ... Additional arguments.
#' @export
reanalyse <- function(analysis,
                      rhat = getOption("mb.rhat", 1.1),
                      duration = getOption("mb.duration", dminutes(10)),
                      parallel = getOption("mb.parallel", FALSE),
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      glance = getOption("mb.glance", TRUE),
                      beep = getOption("mb.beep", TRUE),
                      ...) {
  UseMethod("reanalyse")
}

reanalyse_list <- function(analysis, rhat, duration, parallel, quick, quiet, glance, beep, ...) {
  cat("Model:", names(analysis), "\n")
  analysis <- reanalyse(analysis[[1]], rhat = rhat, duration = duration, quick = quick, quiet = quiet, glance = glance, beep = FALSE, ...)
  list(analysis)
}

#' @export
reanalyse.list <- function(analysis,
                           rhat = getOption("mb.rhat", 1.1),
                           duration = getOption("mb.duration", dminutes(10)),
                           parallel = getOption("mb.parallel", FALSE),
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           glance = getOption("mb.glance", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  .Deprecated("reanalyse.mb_analyses")
  class(analysis) <- "mb_analyses"
  reanalyse(analysis, rhat = rhat, duration = duration, parallel = parallel,
            quick = quick, quiet = quiet, glance = glance, beep = beep, ...)
}

#' @export
reanalyse.mb_analysis <- function(analysis,
                                  rhat = getOption("mb.rhat", 1.1),
                                  duration = getOption("mb.duration", dminutes(10)),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects of the virtual class 'mb_analysis'")
}

#' @export
reanalyse.mb_analyses <- function(analysis,
                                  rhat = getOption("mb.rhat", 1.1),
                                  duration = getOption("mb.duration", dminutes(10)),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(analysis)) return(analysis)

  names <- names(analysis)
  if (is.null(names)) {
    names(analysis) <- 1:length(analysis)
  }

  analysis %<>% purrr::lmap(reanalyse_list, rhat = rhat, duration = duration,
                            quick = quick, quiet = quiet, glance = glance, beep = FALSE, ...)
  names(analysis) <- names
  class(analysis) <- "mb_analyses"
  analysis
}
