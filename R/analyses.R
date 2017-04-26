#' MB Analyses
#'
#' Creates an object inherting from class mb_analyses.
#'
#' @param ... Named objects.
#' @return An object inheriting from class mb_analyses.
#' @export
analyses <- function(...) {
  as.analyses(list(...))
}
