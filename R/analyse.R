#' Analyse
#'
#' Analyse a data set and model.
#'
#' @param model An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param drop A character vector of scalar parameters to drop (fix at 0).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse <- function(model, data, drop = character(0),
                    parallel = getOption("mb.parallel", FALSE),
                    quick = getOption("mb.quick", FALSE),
                    quiet = getOption("mb.quiet", TRUE),
                    beep = getOption("mb.beep", TRUE),
                    ...) {
  UseMethod("analyse")
}

analyse_list <- function(model, data, drop, parallel, quick, quiet, beep, ...) {
  cat("Model:", names(model), "\n")
  analysis <- analyse(model[[1]], data = data, drop = drop, parallel = parallel,
                      quick = quick, quiet = quiet, beep = beep, ...)
  list(analysis)
}

#' @export
analyse.list <- function(model, data, drop = character(0),
                         parallel = getOption("mb.parallel", FALSE),
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  .Deprecated()
  models <- models(model)
  analyse(models, data = data, drop = character(0), parallel = parallel,
          quick = quick, quiet = quiet, beep = beep, ...)
}

#' @export
analyse.mb_model <- function(model, data, drop = character(0),
                             parallel = getOption("mb.parallel", FALSE),
                             quick = getOption("mb.quick", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             ...) {
  error("analyse is not defined for objects of the virtual class 'mb_model'")
}

#' @export
analyse.mb_models <- function(model, data, drop = character(0),
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  names <- names(model)
  if (is.null(names)) {
    names(model) <- 1:length(model)
  }

  analyses <- purrr::lmap(model, analyse_list, data = data, drop = drop, parallel = parallel,
                          quick = quick, quiet = quiet, beep = FALSE, ...)

  names(analyses) <- names
  class(analyses) <- "mb_analyses"
  analyses
}
