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
  .Deprecated("analyse.mb_models")
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
analyse.lmb_model <- function(model, data, drop = character(0),
                              parallel = getOption("mb.parallel", FALSE),
                              quick = getOption("mb.quick", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              ...) {
  if (is.data.frame(data)) {
    check_data2(data)
  } else if (is.list(data)) {
    llply(data, check_data2)
  } else error("data must be a data.frame or a list of data.frames")

  check_vector(drop, "", min_length = 0)
  check_flag(parallel)
  check_flag(quick)
  check_flag(quiet)
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  model %<>% drop_parameters(parameters = drop)

  if (is.data.frame(data))
    return(lmb_analysis(data = data, model = model, quiet = quiet))
  llply(data, lmb_analysis, model = model, quiet = quiet, .parallel = parallel)
}
