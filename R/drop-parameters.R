#' Drop Parameters
#'
#' Drops named scalar fixed parameters from an object by fixing them at 0.
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


  if (!length(parameters))
    return(x)

  # check that [ not in parameter name or followed by [ in x
  if (any(str_detect(parameters, "\\["))) error("parameters must be scalar")
  if (any(str_detect(x, str_c(parameters, "\\s*\\["))))
    error("parameters must be scalar")

  for (parameter in parameters) {
    x %<>% str_replace_all(str_c("\\s+", parameter, "\\s+"), str_c(" 0 "))
  }
  x
}

#' @export
drop_parameters.mb_model <- function(x, parameters = character(0), ...) {
  check_vector(parameters, "", min_length = 0)
  check_unique(parameters)


  if (!length(parameters)) return(x)

  x$code %<>% drop_parameters(parameters = parameters)
  x$new_expr %<>% drop_parameters(parameters = parameters)
  x
}
