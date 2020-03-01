#' Analyse
#'
#' @param x The object to analyse.
#' @param ...  Additional arguments.
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

#' Analyse
#'
#' @param model The mb_model to analyse.
#' @param data The data.
#' @param loaded The loaded model.
#' @param nchains chains.
#' @param niters iters
#' @param nthin thin
#' @param quiet quiet
#' @param glance glance
#' @param parallel parallel
#' @param ...  Additional arguments.
#' @export
analyse1 <- function(model, data, loaded, nchains, niters, nthin, quiet, glance, parallel, ...) {
  UseMethod("analyse1")
}

analyse_data <- function(data, name = NULL, x, loaded, nchains, niters, nthin,
                          parallel, quiet, glance, ...) {
  if (!is.null(name) & glance) cat("Data:", name, "\n")
  analyse1(x, data, loaded = loaded, nchains = nchains, niters = niters,
           nthin = nthin, parallel = parallel, quiet = quiet, glance = glance, ...)
}


analyse_model <- function(x, name = NULL, data, parallel, nchains, niters, nthin, quiet, glance, beep, ...) {
  if (!is.null(name) & glance) cat("Model:", name, "\n")
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
analyse.mb_model <- function(x, data,
                             nchains = getOption("mb.nchains", 3L),
                             niters = getOption("mb.niters", 1000L),
                             nthin = getOption("mb.thin", NULL),
                             parallel = getOption("mb.parallel", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             glance = getOption("mb.glance", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             ...) {

  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  if (is.data.frame(data)) {
    chk_data(data)
  } else if (is.list(data)) {
    llply(data, chk_data)
  } else err("data must be a data.frame or a list of data.frames")

  check_vector(nchains, c(2L, 10L), length = 1)
  check_vector(niters, c(10L, 100000L), length = 1)
  checkor(chk_null(nthin), check_vector(nthin, c(1L, 10000L), length = 1))

  chk_flag(parallel)
  chk_flag(quiet)
  chk_flag(glance)

  if (is.null(nthin)) nthin <- nthin(x)

  loaded <- load_model(x, quiet)

  if (is.data.frame(data)) {
    return(analyse_data(data = data, x = x, loaded = loaded,
                         nchains = nchains, niters = niters, nthin = nthin,
                         parallel = parallel, quiet = quiet, glance = glance))
  }

  names <- names(data)
  if (is.null(names)) {
    names(data) <- 1:length(x)
  }

  analyses <- purrr::imap(data, analyse_data, x = x, loaded = loaded,
              nchains = nchains, niters = niters, nthin = nthin,
              parallel = parallel, quiet = quiet, glance = glance)

  names(data) <- names

  class(analyses) <- "mb_meta_analysis"
  analyses
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
                              nthin = getOption("mb.thin", NULL),
                              parallel = getOption("mb.parallel", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::imap(x, analyse_model, data = data,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance, beep = FALSE, ...)

  if (is.data.frame(data)) {
    analyses %<>% as_mb_analyses(names)
    return(analyses)
  }
  analyses %<>% purrr::transpose()
  analyses %<>% purrr::map(as_mb_analyses, names)
  class(analyses) <- "mb_meta_analyses"
  analyses
}
