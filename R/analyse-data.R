#' Analyse Data
#'
#' Analyse data using an object inheriting from class mb_model.
#'
#' @param data The data frame to analyse.
#' @param model The model to use for the analysis.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param debug A flag indicating whether to run in debug mode.
#' @param ...  Additional arguments.
#' @export
analyse_data <- function(data, model, beep = getOption("mb.beep", TRUE),
                         debug = getOption("mb.debug", FALSE), ...) {
  check_mb_model(model)
  analyse(model, data = data, beep = beep, debug = debug, ...)
}
