#' Load Model
#'
#' @param x The model to load.
#' @param quiet A flag indicating whether to suppress warnings and output.
#' @param ...  Additional arguments.
#' @export
load_model <- function(x, quiet, ...) {
  UseMethod("load_model")
}


#' @export
load_model.mb_analysis <- function(x, quiet, ...) {
  load_model(model(x), quiet, ...)
}
