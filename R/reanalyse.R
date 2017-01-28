#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @inheritParams analyse_data
#' @param analysis An object inheriting from class mb_analysis or a list of such objects.
#' @param rhat A number specifying the rhat threshold.
#' @param minutes The target maximum number of minutes to spend on analysis/reanalysis.
#' @export
reanalyse <- function(analysis,
                      rhat = getOption("mb.rhat", 1.1),
                      minutes = getOption("mb.minutes", 60L),
                      parallel = getOption("mb.parallel", FALSE),
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE),
                      ...) {
  UseMethod("reanalyse")
}

reanalyse_list <- function(analysis, rhat, minutes, parallel, quick, quiet, beep, ...) {
  cat("Model:", names(analysis), "\n")
  analysis <- reanalyse(analysis[[1]], rhat = rhat, minutes = minutes, quick = quick, quiet = quiet, beep = FALSE, ...)
  list(analysis)
}

#' @export
reanalyse.list <- function(analysis,
                           rhat = getOption("mb.rhat", 1.1),
                           minutes = getOption("mb.minutes", 60L),
                           parallel = getOption("mb.parallel", FALSE),
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(analysis)) return(analysis)

  names <- names(analysis)
  if (is.null(names)) {
    names(analysis) <- 1:length(analysis)
  }

  analysis %<>% purrr::lmap(reanalyse_list, rhat = rhat, minutes = minutes, quick = quick, quiet = quiet, beep = FALSE, ...)
  names(analysis) <- names
  analysis
}

#' @export
reanalyse.mb_model <- function(analysis,
                               rhat = getOption("mb.rhat", 1.1),
                               minutes = getOption("mb.minutes", 60L),
                               parallel = getOption("mb.parallel", FALSE),
                               quick = getOption("mb.quick", FALSE),
                               quiet = getOption("mb.quiet", TRUE),
                               beep = getOption("mb.beep", TRUE),
                               ...) {
  error("reanalyse is not defined for objects inheriting from class 'mb_model'")
}

#' @export
reanalyse.mb_analysis <- function(analysis,
                                  rhat = getOption("mb.rhat", 1.1),
                                  minutes = getOption("mb.minutes", 60L),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  error("reanalyse is not defined for objects of the virtual class 'mb_analysis'")
}
