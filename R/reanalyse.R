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

#' Reanalyse
#'
#' Reanalyse an analysis.
#' For user to override.
#'
#' @param object The object to reanalyse.
#' @param parallel A flag indicating whether to perform the reanalysis in parallel.
#' @param quiet A flag indicating whether to capture output.
#' @param ... Additional arguments.
#' @export
reanalyse1 <- function(object, parallel, quiet, ...) {
  UseMethod("reanalyse1")
}

reanalyse_model <- function(object, name = NULL, rhat, esr, nreanalyses, duration, parallel, quiet, glance, beep, ...) {
  if (!is.null(name) & glance) cat("Model:", name, "\n")
  reanalyse(object, rhat = rhat, esr = esr, nreanalyses = nreanalyses,
            duration = duration, quiet = quiet,
            glance = glance, beep = beep, ...)
}

reanalyse_data <- function(object, name = NULL, rhat, esr, nreanalyses, duration, parallel, quiet, glance, beep, ...) {
  if (!is.null(name) & glance) cat("Data:", name, "\n")
  reanalyse(object, rhat = rhat, esr = esr, nreanalyses = nreanalyses,
            duration = duration, quiet = quiet,
            glance = glance, beep = beep, ...)
}

#' Reanalyse
#'
#' @param object The object to reanalyse.
#' @param rhat A number specifying the rhat threshold.
#' @param esr A number specifying the minimum effective sampling rate.
#' @param nreanalyses A count between 0 and 4 specifying the maximum number of reanalyses.
#' @param duration The maximum total time to spend on analysis and reanalysis.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print summary of model.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param ... Unused arguments.
#' @export
reanalyse.mb_analysis <- function(object,
                                  rhat = getOption("mb.rhat", 1.1),
                                  esr = getOption("mb.esr", 0.33),
                                  nreanalyses = getOption("mb.nreanalyses", 1L),
                                  duration = getOption("mb.duration", dhours(1)),
                                  parallel = getOption("mb.parallel", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {

  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  chk_whole_number(nreanalyses)
  chk_range(nreanalyses,  c(0L, 4L))
  if (!is.duration(duration)) err("duration must be an object of class Duration")
  chk_flag(quiet)
  chk_flag(parallel)
  chk_flag(glance)
  chk_number(esr)
  chk_range(esr, c(0, 1))

  if (nreanalyses == 0L || duration < elapsed(object) * 2 || converged(object, rhat = rhat, esr = esr)) {
    if (glance) print(glance(object))
    return(object)
  }
  while (nreanalyses > 0L && duration >= elapsed(object) * 2 && !converged(object, rhat = rhat, esr = esr)) {
    object <- analyse(model(object), data_set(object),
                      nchains = nchains(object), niters = niters(object),
                      nthin = nthin(object) * 2L,
                      parallel = parallel, quiet = quiet,
                      glance = glance, beep = FALSE)
    nreanalyses <- nreanalyses - 1L
  }
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
  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(object)) return(object)

  names <- names(object)
  if (is.null(names)) {
    names(object) <- 1:length(object)
  }

  object <- purrr::imap(object, reanalyse_model, rhat = rhat, esr = esr,
                          nreanalyses = nreanalyses, duration = duration,
                          quiet = quiet, glance = glance, beep = FALSE, ...)

  object <- as_mb_analyses(object, names)
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
reanalyse.mb_meta_analysis <- function(object,
                                       rhat = getOption("mb.rhat", 1.1),
                                       esr = getOption("mb.esr", 0.33),
                                       nreanalyses = getOption("mb.nreanalyses", 1L),
                                       duration = getOption("mb.duration", dhours(1)),
                                       parallel = getOption("mb.parallel", FALSE),
                                       quiet = getOption("mb.quiet", TRUE),
                                       glance = getOption("mb.glance", TRUE),
                                       beep = getOption("mb.beep", TRUE),
                                       ...) {
  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(object)) return(object)

  names <- names(object)
  if (is.null(names)) {
    names(object) <- 1:length(object)
  }

  object <- purrr::imap(object, reanalyse_data, rhat = rhat, esr = esr,
                          nreanalyses = nreanalyses, duration = duration,
                          quiet = quiet, glance = glance, beep = FALSE, ...)

  object <- as_mb_meta_analysis(object, names)
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
  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!length(object)) return(object)

  names <- names(object)
  if (is.null(names)) {
    names(object) <- 1:length(object)
  }

  object <- purrr::transpose(object)
  object <- lapply(object, as_mb_meta_analysis)

  object <- purrr::imap(object, reanalyse_model, rhat = rhat, esr = esr,
                          nreanalyses = nreanalyses, duration = duration,
                          quiet = quiet, glance = glance, beep = FALSE, ...)

  object <- purrr::transpose(object)
  object <- lapply(object, as_mb_analyses)

  names(object) <- names
  class(object) <- "mb_meta_analyses"
  object
}
