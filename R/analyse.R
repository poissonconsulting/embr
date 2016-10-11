#' Analyse
#'
#' Analyse a data set and model.
#'
#' @param data The data frame to analyse.
#' @param model The model to use for the analysis.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param debug A flag indicating whether to run in debug mode.
#' @param ...  Not used.
#' @export
analyse <- function(model, data, beep = TRUE, debug = FALSE, ...) {UseMethod("analyse")}
