#' Parameters to monitor
#'
#' @param object An mb model object to get the parameters for.
#' @param param_type A string specifying the type of parameters to get.
#' @param scalar_only A flag indicating whether to only get scalar parameters.
#' @return A character vector of the parameters to monitor.
#' @export
monitor <- function(object, param_type = "all", scalar_only = FALSE) {
  if (!is.mb_model(object)) err("object must be an mb_model")

  parameters <- parameters(object, param_type = param_type,
                           scalar_only = scalar_only)

  regexp <- object$fixed
  named <- object$random_effects %>%
    names() %>%
    c(object$derived)

  named %<>% intersect(parameters)
  parameters <- parameters[grepl(regexp, parameters, perl = TRUE)]

  parameters %<>%
    c(named) %>%
    unique() %>%
    sort()

  parameters
}
