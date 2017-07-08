#' @export
parameters.character <- function(x, ...) {
  x %<>% str_extract_all("\\w+") %>% unlist() %>% unique() %>% sort()
  x
}

#' @export
parameters.mb_code <- function(x, ...) {
  parameters(template(x))
}

#' @export
parameters.mb_model <- function(x, param_type = "fixed", ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))

  if (param_type %in% c("primary", "all")) {
    parameters <- c("fixed", "random")
    if (param_type == "all") parameters %<>% c("derived")

    parameters %<>%
      purrr::map(parameters_arg2to1, x = x, ...) %>%
      unlist()

    return(parameters)
  }

  if (identical(param_type, "fixed"))
    .NotYetImplemented()

  if (identical(param_type, "random")) {
    random <- names(random_effects(x))
    if (is.null(random)) random <- character(0)
    return(random)
  }
  x$derived
}

#' @export
parameters.mb_analysis <- function(x, param_type = "fixed", ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))

  if (param_type %in% c("primary", "all")) {
    parameters <- c("fixed", "random")
    if (param_type == "all") parameters %<>% c("derived")

    parameters %<>%
      purrr::map(parameters_arg2to1, x = x, ...) %>%
      unlist()

    return(parameters)
  }

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  if (identical(param_type, "random")) return(random)

  derived <- x$model$derived
  if (identical(param_type, "derived")) return(derived)

  parameters <- parameters(as.mcmcr(x))

  parameters %<>% setdiff(random) %>% setdiff(derived)
  parameters
}
