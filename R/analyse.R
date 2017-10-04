#' Analyse
#'
#' @param x The object to analyse.
#' @param ...  Additional arguments.
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

analyse_model <- function(x, name, data, parallel, nchains, niters, nthin, quiet, glance, beep, ...) {
  if (glance) cat("Model:", name, "\n")
  analyse(x, data = data, parallel = parallel,
          nchains = nchains, niters = niters, nthin = nthin,
          quiet = quiet, glance = glance, beep = beep, ...)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param nchains A count of the number of chains.
#' @param niters A count of the number of simulations to save per chain.
#' @param nthin A count of the thining interval or NULL (in which case taken from model).
#' @param select_data A named list specifying the columns to select and their associated classes and values as well as transformations and scaling options.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.character <- function(x, data,
                              select_data = list(),
                              nchains = getOption("mb.nchains", 3L),
                              niters = getOption("mb.niters", 1000L),
                              nthin = getOption("mb.nthin", 1L),
                              parallel = getOption("mb.parallel", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  x %<>% model(select_data = select_data)
  analyse(x, data = data,
          parallel = parallel, nchains = nchains, niters = niters, nthin = nthin, quiet = quiet,
          glance = glance, beep = beep)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param nchains A count of the number of chains.
#' @param niters A count of the number of simulations to save per chain.
#' @param nthin A count of the thining interval or NULL (in which case taken from model).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.mb_models <- function(x, data,
                              nchains = getOption("mb.nchains", 3L),
                              niters = getOption("mb.niters", 1000L),
                              nthin = getOption("mb.niters", NULL),
                              parallel = getOption("mb.parallel", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::imap(x, analyse_model, data = data,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance, beep = FALSE, ...)

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
