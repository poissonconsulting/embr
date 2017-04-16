#' Analysis Priors
#'
#' If present returns a list of the analysis priors. Otherwise returns NULL.
#'
#' @param object The analysis object with the priors to return.
#' @param ...  Additional arguments.
#' @export
analysis_priors <- function(object, ...) {
  object$priors
}
