#' Describe
#'
#' Describe the parameters in a model.
#'
#' Requires that the model has a user-supplied description.
#'
#' @param x The model or analysis to describe.
#' @param latex A flag indicating whether to replace the parameters with their latex values.
#' @param quote A string specifying the text to place immediately before and after the parameters.
#' @param ... Unused.
#' @return A tibble with the columns parameter and description.
#' @export
describe <- function(x, latex = FALSE, quote = "", ...) {
  UseMethod("describe")
}

#' @export
describe.mb_model <- function(x, latex = FALSE, quote = "", ...) {
  check_flag(latex)
  check_string(quote)
  check_unused(...)

  if (latex && !length(x$latex)) error("latex is undefined for x")

  if (!length(x$description)) {
    return(dplyr::data_frame(parameter = character(0), description = character(0)))
  }

  data <- dplyr::data_frame(parameter = names(x$description), description = x$description)

  data %<>% dplyr::mutate_(indexes = ~indexes(parameter),
                           name = ~drop_indices(parameter),
                           org_name = ~name)

  if (latex) {
    data$parameter %<>% replace_latex(x$latex)
    data$name %<>% replace_latex(x$latex)
  }

  if (!identical(quote, "")) {
    data$parameter %<>% str_c(quote, .) %>% str_c(quote)
    data$name  %<>% str_c(quote, .) %>% str_c(quote)
  }

  data$org_name %<>% str_c("(?<=\\b)", .) %>% str_c("(?=\\b)")

  data %<>% dplyr::mutate_(replacement = ~str_replace_all(name, "\\\\", "\\\\\\\\"),
                           description = ~str_replace_all(description, org_name, replacement))

  data %<>% dplyr::select_(~-org_name, ~-indexes, ~-name, ~-replacement)
  data
}

#' @export
describe.mb_analysis <- function(x, latex = FALSE, quote = "", ...) {
  describe(model(x, latex = latex, quote = quote, ...))
}
