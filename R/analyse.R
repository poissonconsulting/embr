#' Analyse
#'
#' @param x The object to analyse.
#' @param ...  Additional arguments.
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

analyse_list <- function(x, data, drop, parallel, quick, quiet, beep, ...) {
  cat("Model:", names(x), "\n")
  analysis <- analyse(x[[1]], data = data, drop = drop, parallel = parallel,
                      quick = quick, quiet = quiet, beep = beep, ...)
  list(analysis)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param drop A character vector of scalar parameters to drop (fix at 0).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.list <- function(x, data, drop = character(0),
                         parallel = getOption("mb.parallel", FALSE),
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  .Deprecated("analyse.mb_models")
  models <- as.models(x)
  analyse(models, data = data, drop = character(0), parallel = parallel,
          quick = quick, quiet = quiet, beep = beep, ...)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param select_data A named list specifying the columns to select and their associated classes and values as well as transformations and scaling options.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.character <- function(x, data, select_data = list(),
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  x %<>% model(select_data = select_data)
  analyse(x, data = data, parallel = parallel, quick = quick, quiet = quiet, beep = beep)
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param drop A character vector of scalar parameters to drop (fix at 0).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.mb_model <- function(x, data, drop = character(0),
                             parallel = getOption("mb.parallel", FALSE),
                             quick = getOption("mb.quick", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
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
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse.mb_models <- function(x, data,
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::lmap(x, analyse_list, data = data, parallel = parallel,
                          quick = quick, quiet = quiet, beep = FALSE, ...)

  names(analyses) <- names
  class(analyses) <- "mb_analyses"
  analyses
}

lmb_analysis <- function(data, model, quiet) {
  timer <- timer::Timer$new()
  timer$start()

  obj <- list(model = model, data = data)
  class(obj) <- c("lmb_analysis", "mb_analysis")

  on.exit(print(glance(obj)))

  data %<>% select_rescale_data(model)

  lm <- stats::lm(template(model), data = data)

  obj$lm <- lm
  obj$ngens <- 1L
  obj$duration <- timer$elapsed()

  obj
}

#' @export
analyse.lmb_model <- function(x, data, parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  if (is.data.frame(data)) {
    check_data2(data)
  } else if (is.list(data)) {
    llply(data, check_data2)
  } else error("data must be a data.frame or a list of data.frames")

  check_flag(parallel)
  check_flag(quick)
  check_flag(quiet)
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (is.data.frame(data))
    return(lmb_analysis(data = data, model = x, quiet = quiet))
  purrr::map(data, lmb_analysis, model = x, quiet = quiet, .parallel = parallel)
}
