#' pars to monitor
#'
#' @param object An mb model object to get the pars for.
#' @param param_type A string specifying the type of pars to get.
#' @return A character vector of the pars to monitor.
#' @export
monitor <- function(object, param_type = "all") {
  if (!is.mb_model(object)) err("object must be an mb_model", tidy = FALSE)

  pars <- pars(object, param_type = param_type)

  regexp <- object$fixed
  named <- object$random_effects
  named <- names(named)
  named <- c(named, object$derived)

  named <- intersect(named, pars)
  pars <- pars[grepl(regexp, pars, perl = TRUE)]

  pars <- c(pars, named)
  pars <- unique(pars)
  pars <- sort(pars)

  pars
}
