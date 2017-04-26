#' Add model(s)
#'
#' @param x An mb_model or mb_models object.
#' @param x2 n mb_model or mb_models object.
#' @return An object of class mb_models.
#' @export
add_models <- function(x, x2) {
  if (is.mb_model(x)) x %<>% list()
  if (is.mb_model(x2)) x2 %<>% list()
  x %<>% c(x2)
  as.models(x)
}

#' Add analyses
#'
#' @param x An mb_analysis or mb_analyses object.
#' @param x2 n mb_analysis or mb_analyses object.
#' @return An object of class mb_analyses.
#' @export
add_analyses <- function(x, x2) {
  if (is.mb_analysis(x)) x %<>% list()
  if (is.mb_analysis(x2)) x2 %<>% list()
  x %<>% c(x2)
  as.analyses(x)
}
