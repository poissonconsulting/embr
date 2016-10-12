#' Analyse
#'
#' Analyse a data set and model.
#'
#' @inheritParams analyse_data
#' @export
analyse <- function(model, data,
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  UseMethod("analyse")
}
