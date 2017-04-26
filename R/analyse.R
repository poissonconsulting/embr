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
analyse.character <- function(x, data, select_data = list(),
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  x %<>% model(select_data = select_data)
  analyse(x, data = data, parallel = parallel, quick = quick, quiet = quiet,
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

  analyses <- purrr::lmap(x, analyse_list, data = data, parallel = parallel,
                          quick = quick, quiet = quiet, glance = glance, beep = FALSE, ...)

  names(analyses) <- names
  class(analyses) <- "mb_analyses"
  analyses
}

lmb_analysis <- function(data, model, glance, quiet) {
  timer <- timer::Timer$new()
  timer$start()

  obj <- list(model = model, data = data)
  class(obj) <- c("lmb_analysis", "mb_analysis")

  if (glance) on.exit(print(glance(obj)))

  data %<>% select_rescale_data(model)

  lm <- stats::lm(template(model), data = data)

  obj$lm <- lm
  obj$ngens <- 1L
  obj$duration <- timer$elapsed()

  obj
}

#' @export
analyse.lmb_model <- function(x, data,
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  if (is.data.frame(data)) {
    check_data2(data)
  } else if (is.list(data)) {
    llply(data, check_data2)
  } else error("data must be a data.frame or a list of data.frames")

  check_flag(parallel)
  check_flag(quick)
  check_flag(glance)
  check_flag(quiet)
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (is.data.frame(data))
    return(lmb_analysis(data = data, model = x, quiet = quiet, glance = glance))
  purrr::map(data, lmb_analysis, model = x, quiet = quiet, glance = glance, .parallel = parallel)
}
