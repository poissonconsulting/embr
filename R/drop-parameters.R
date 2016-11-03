#' Drop Parameters
#'
#' Drops named scalar fixed parameters from a model by fixing them at 0.
#'
#' @param x The object.
#' @param parameters A character vector of the parameters to drop.
#' @param ... Not used.
#' @return The updated object.
#' @export
drop_parameters <- function(x, parameters = character(0), ...) {UseMethod("drop_parameters")}

#' @export
drop_parameters.character <- function(x, parameters = character(0), ...) {
  check_vector(parameters, "", min_length = 0)
  check_unique(parameters)
  check_unused(...)

  if (!length(parameters))
    return(x)

  for (parameter in parameters) {
    x %<>% str_replace_all(str_c("\\s+", parameter, "\\s+"), str_c(" 0 "))
  }
  x
}
