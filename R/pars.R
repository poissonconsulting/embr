#' @export
pars.mb_code <- function(x, param_type = "all", scalar_only = FALSE, ...) {
  check_vector(param_type, c("fixed", "random", "derived", "primary", "all"), length = 1)
  check_flag(scalar_only)

  if (param_type != "all")
    err("parameters.character is not able to identify parameter types - set param_type = 'all' instead")

  if (scalar_only)
    err("parameters.character is not able to identify scalar parameters - set scalar_only = FALSE instead")

  x %<>%
    template() %>%
    rm_comments() %>%
    str_extract_all("\\w+") %>%
    unlist() %>%
    unique() %>%
    magrittr::extract(., is.syntactic(.))

  if(is.null(x)) return(character(0))
  sort(x)
}

#' @export
pars.mb_model <- function(x, param_type = "all", scalar_only = FALSE, ...) {
  check_vector(param_type, c("fixed", "random", "derived", "primary", "all"), length = 1)
  check_flag(scalar_only)

  if (scalar_only)
    err("pars.mb_model is not able to identify scalar parameters - set scalar_only = FALSE instead")

  if (param_type %in% c("primary", "all")) {
    parameters <- c("fixed", "random")
    if (param_type == "all") parameters %<>% c("derived")

    parameters %<>%
      purrr::map(parameters_arg2to1, x = x, scalar_only = scalar_only) %>%
      unlist() %>%
      sort()

    return(parameters)
  }

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random %<>%
    sort()

  if (param_type == "random") return(random)

  derived <- x$derived %>%
    sort()
  if (param_type == "derived") return(derived)

  parameters <- pars(code(x), param_type = "all", scalar_only = scalar_only)

  parameters %<>%
    setdiff(random) %>%
    setdiff(derived) %>%
    sort()

  parameters
}

#' @export
pars.mb_analysis <- function(x, param_type = "all", scalar_only = FALSE, ...) {
  check_vector(param_type, c("fixed", "random", "derived", "primary", "all"), length = 1)
  check_flag(scalar_only)

  if (param_type %in% c("primary", "all")) {
    parameters <- c("fixed", "random")
    if (param_type == "all") parameters %<>% c("derived")

    parameters %<>%
      purrr::map(parameters_arg2to1, x = x, scalar_only = scalar_only) %>%
      unlist() %>%
      sort()

    return(parameters)
  }

  parameters <- parameters(as.mcmcr(x), scalar_only = scalar_only)

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random %<>%
    intersect(parameters) %>%
    sort()

  if (param_type ==  "random") return(random)

  derived <- x$model$derived %>%
    intersect(parameters) %>%
    sort()

  if (param_type == "derived") return(derived)

  parameters %<>%
    setdiff(random) %>%
    setdiff(derived) %>%
    sort()

  parameters
}
