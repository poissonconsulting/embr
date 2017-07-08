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

  if (param_type == "primary") {
    return(purrr::map_df(c("fixed", "random"), parameters, ...))
  } else if (param_type == "all")
    return(purrr::map_df(c("fixed", "random", "derived"), parameters, ...))

  if (identical(param_type, "fixed"))
    error("fixed parameters are not defined for mb_models")

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

  if (param_type == "primary") {
    return(purrr::map_chr(c("fixed", "random"), parameters, ...))
  } else if (param_type == "all")
    return(purrr::map_chr(c("fixed", "random", "derived"), parameters, ...))

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  derived <- x$model$derived

  if (identical(param_type, "random")) return(random)
  if (identical(param_type, "derived")) return(derived)

  parameters <- parameters(as.mcmcr(x))

  parameters %<>% setdiff(random) %>% setdiff(derived)
  parameters
}
