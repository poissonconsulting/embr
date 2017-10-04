#' Load Model
#'
#' @param x The model to load.
#' @param ...  Additional arguments.
#' @export
load_model <- function(x, ...) {
  UseMethod("load_model")
}
