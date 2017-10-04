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

reanalyse_model <- function(object, name, rhat, esr, nreanalyses, duration, parallel, quiet, glance, beep, ...) {
  if (glance) cat("Model:", name, "\n")
  reanalyse(object, rhat = rhat, esr = esr, nreanalyses = nreanalyses,
            duration = duration, quiet = quiet,
            glance = glance, beep = FALSE, ...)
}

#' Reanalyse
#'
#' @param object The object to reanalyse.
#' @param rhat A number specifying the rhat threshold.
#' @param esr A number specifying the effective sampling rate.
#' @param nreanalyses A count between 1 and 7 specifying the maximum number of reanalyses.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible
#' @param ... Unused arguments.
#' @export
reanalyse.mb_analyses <- function(object,
                                  rhat = getOption("mb.rhat", 1.1),
                                  esr = getOption("mb.esr", 0.33),
                                  nreanalyses = getOption("mb.nreanalyses", 1L),
                                  duration = getOption("mb.duration", dhours(1)),
                                  parallel = getOption("mb.parallel", FALSE),
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

  object %<>% purrr::imap(reanalyse_model, rhat = rhat, esr = esr,
                          nreanalyses = nreanalyses, duration = duration,
                          quiet = quiet, glance = glance, beep = FALSE, ...)
  names(object) <- names
  class(object) <- "mb_analyses"
  object
}

#' Reanalyse
#'
#' @param object The object to reanalyse.
#' @param rhat A number specifying the rhat threshold.
#' @param esr A number specifying the effective sampling rate.
#' @param nreanalyses A count between 1 and 7 specifying the maximum number of reanalyses.
#' @param duration The maximum total time to spend on analysis/reanalysis.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible
#' @param ... Unused arguments.
#' @export
reanalyse.mb_meta_analyses <- function(object,
                                  rhat = getOption("mb.rhat", 1.1),
                                  esr = getOption("mb.esr", 0.33),
                                  nreanalyses = getOption("mb.nreanalyses", 1L),
                                  duration = getOption("mb.duration", dhours(1)),
                                  parallel = getOption("mb.parallel", FALSE),
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

  object %<>% purrr::imap(reanalyse_model, rhat = rhat, esr = esr,
                          nreanalyses = nreanalyses, duration = duration,
                          quiet = quiet, glance = glance, beep = FALSE, ...)
  names(object) <- names
  class(object) <- "mb_analyses"
  object
}

