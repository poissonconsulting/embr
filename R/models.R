#' MB Models
#'
#' Creates an object inherting from class mb_models.
#'
#' @param ... Named objects.
#' @return An object inheriting from class mb_models.
#' @export
models <- function(...) {
  as.models(list(...))
}
