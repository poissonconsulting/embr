#' Reanalyse
#'
#' Reanalyse an analysis.
#'
#' @inheritParams analyse
#' @inheritParams reanalyse
#' @param analysis An object inheriting from class mb_analysis or a list of such objects.
#' @export
reanalyse_priors <- function(analysis,
                             rhat = getOption("mb.rhat", 1.1),
                             duration = getOption("mb.duration", dminutes(10)),
                             parallel = getOption("mb.parallel", FALSE),
                             quick = getOption("mb.quick", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             ...) {
  UseMethod("reanalyse_priors")
}

#' @export
reanalyse_priors.mb_analysis <- function(analysis,
                                         rhat = getOption("mb.rhat", 1.1),
                                         duration = getOption("mb.duration", dminutes(10)),
                                         parallel = getOption("mb.parallel", FALSE),
                                         quick = getOption("mb.quick", FALSE),
                                         quiet = getOption("mb.quiet", TRUE),
                                         beep = getOption("mb.beep", TRUE),
                                         ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (is.null(analysis$priors)) error("prior analyses have not been generated")

  analysis$priors %<>% reanalyse(rhat = rhat, duration = duration, parallel = parallel,
                                 quick = quick, quiet = quiet, beep = FALSE)
  analysis
}
