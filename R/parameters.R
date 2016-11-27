#' Parameters
#'
#' Gets the parameter names for an object.
#'
#' @param x The object.
#' @param terms A string indicating the type of terms to get the names for.
#' @param scalar_only A flag indicating whether to only return scalar terms.
#' @param ... Not used.
#' @return A character vector of the parameter names.
#' @export
parameters <- function(x, terms = "fixed", scalar_only = FALSE, ...) {UseMethod("parameters")}

#' @export
parameters.character <- function(x, ...) {
  check_unused(...)
  x %<>% str_extract_all("\\w+") %>% unlist() %>% unique() %>% sort()
  x
}

#' @export
parameters.mb_code <- function(x, terms = "fixed", scalar_only = FALSE, ...) {
  check_unused(...)
  parameters(template(x))
}

#' @export
parameters.mb_analysis <- function(x, terms = "fixed", scalar_only = FALSE, ...) {
  check_unused(...)
  estimates(x, terms = terms, scalar_only = scalar_only)$term
}
