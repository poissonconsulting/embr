#' Analyse
#'
#' Analyse a data set and model.
#'
#' @inheritParams analyse_data
#' @export
analyse <- function(model, data, beep = TRUE, debug = FALSE, ...) {UseMethod("analyse")}
