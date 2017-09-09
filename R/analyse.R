#' Analyse
#'
#' @param x The object to analyse.
#' @param ...  Additional arguments.
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

analyse_list <- function(x, data, parallel, quick, quiet, glance, beep, ...) {
  if (glance) cat("Model:", names(x), "\n")
  analysis <- analyse(x[[1]], data = data, parallel = parallel,
                      quick = quick, quiet = quiet, glance = glance, beep = beep, ...)
  list(analysis)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.list <- function(x, data,
                         parallel = getOption("mb.parallel", FALSE),
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         glance = getOption("mb.glance", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  .Deprecated("analyse.mb_models")
  models <- as.models(x)
  analyse(models, data = data, parallel = parallel,
          quick = quick, quiet = quiet, glance = glance, beep = beep, ...)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param select_data A named list specifying the columns to select and their associated classes and values as well as transformations and scaling options.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.character <- function(x, data,
                              select_data = list(),
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  x %<>% model(select_data = select_data)
  analyse(x, data = data,
          parallel = parallel, quick = quick, quiet = quiet,
          glance = glance, beep = beep)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.mb_model <- function(x, data,
                             parallel = getOption("mb.parallel", FALSE),
                             quick = getOption("mb.quick", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             glance = getOption("mb.glance", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             ...) {
  error("analyse is not defined for objects of the virtual class 'mb_model'")
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.mb_models <- function(x, data,
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::lmap(x, analyse_list, data = data,
                          parallel = parallel,
                          quick = quick, quiet = quiet, glance = glance, beep = FALSE, ...)

  as_mb_analyses <- function(x, names) {
    names(x) <- names
    class(x) <- "mb_analyses"
    x
  }

  if (is.data.frame(data)) {
    analyses %<>% as_mb_analyses(names = names)
    return(analyses)
  }
  analyses %<>% purrr::transpose()
  analyses %<>% purrr::map(as_mb_analyses, names = names)
  analyses
}
