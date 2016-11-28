#' Analyse Data
#'
#' Analyse data using an object inheriting from class mb_model.
#'
#' @param data The data frame to analyse.
#' @param model The model to use for the analysis.
#' @param drop A character vector of scalar parameters to drop (fix at 0).
#' @param parallel A flag indicating whether to analyse multiple models using parallel backend provided by foreach.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @export
analyse_data <- function(data, model, drop = character(0),
                         parallel = getOption("parallel", FALSE),
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  check_mb_model(model)
  analyse(model, data = data, drop = drop, parallel = parallel, quick = quick, quiet = quiet, beep = beep, ...)
}
