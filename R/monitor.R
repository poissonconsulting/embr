#' pars to monitor
#'
#' @param object An mb model object to get the pars for.
#' @param param_type A string specifying the type of pars to get.
#' @param scalar_only A flag indicating whether to only get scalar pars.
#' @return A character vector of the pars to monitor.
#' @export
monitor <- function(object, param_type = "all", scalar_only = FALSE) {
  if (!is.mb_model(object)) err("object must be an mb_model")

  pars <- pars(object, param_type = param_type,
                           scalar_only = scalar_only)

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
