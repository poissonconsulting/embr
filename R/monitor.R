#' pars to monitor
#'
#' @param object An mb model object to get the pars for.
#' @param param_type A string specifying the type of pars to get.
#' @param scalar A logical scalar indicating whether to monitor all parameters (NA),
#' only scalar parameteres (TRUE) or only non-scalar parameters (FALSE).
#' @return A character vector of the pars to monitor.
#' @export
monitor <- function(object, param_type = "all", scalar = NA) {
  if (!is.mb_model(object)) err("object must be an mb_model")

  pars <- pars(object, param_type = param_type,
                           scalar = scalar)

  regexp <- object$fixed
  named <- object$random_effects %>%
    names() %>%
    c(object$derived)

  named %<>% intersect(pars)
  pars <- pars[grepl(regexp, pars, perl = TRUE)]

  pars %<>%
    c(named) %>%
    unique() %>%
    sort()

  pars
}
