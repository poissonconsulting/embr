#' Analyse
#'
#' Analyse a data set and model.
#'
#' @inheritParams analyse_data
#' @export
analyse <- function(model, data, beep = getOption("mb.beep", TRUE),
                         debug = getOption("mb.debug", FALSE), ...) {UseMethod("analyse")}
