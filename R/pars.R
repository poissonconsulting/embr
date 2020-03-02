#' @export
pars.character <- function(x, param_type = "all", scalar = NA, ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all"))
  chk_lgl(scalar)
  chk_unused(...)

  if (param_type != "all")
    err("pars.character is not able to identify parameter types - set param_type = 'all' instead")

  if (!is.na(scalar))
    err("pars.character is not able to identify scalar pars - set scalar = NA instead")

  x %<>%
    rm_comments() %>%
    str_extract_all("\\w+") %>%
    unlist() %>%
    unique() %>%
    magrittr::extract(., is.syntactic(.))

  if(is.null(x)) return(character(0))
  sort(x)
}

#' @export
pars.mb_code <- function(x, param_type = "all", scalar = NA, ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all"))
  chk_lgl(scalar)
  chk_unused(...)

  if (param_type != "all")
    err("pars.character is not able to identify parameter types - set param_type = 'all' instead")

  if (!is.na(scalar))
    err("pars.character is not able to identify scalar pars - set scalar = NA instead")

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
pars.mb_model <- function(x, param_type = "all", scalar = NA, ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all"))
  chk_lgl(scalar)
  chk_unused(...)

  if (!is.na(scalar))
    err("pars.mb_model is not able to identify scalar pars - set scalar = NA instead")

  if (param_type %in% c("primary", "all")) {
    pars <- c("fixed", "random")
    if (param_type == "all") pars <- c(pars, "derived")

    pars %<>%
      purrr::map(pars_arg2to1, x = x, scalar = scalar) %>%
      unlist() %>%
      sort()

    return(pars)
  }

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random <- sort(random)

  if (param_type == "random") return(random)

  derived <- x$derived %>%
    sort()
  if (param_type == "derived") return(derived)

  pars <- pars(code(x), param_type = "all", scalar = scalar)

  pars <- setdiff(pars, random)
  pars <- setdiff(pars, derived)
  pars <- sort(pars)

  pars
}

#' @export
pars.mb_analysis <- function(x, param_type = "all", scalar = NA, ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all"))
  chk_lgl(scalar)

  if (param_type %in% c("primary", "all")) {
    pars <- c("fixed", "random")
    if (param_type == "all") pars %<>% c("derived")

    pars %<>%
      purrr::map(pars_arg2to1, x = x, scalar = scalar) %>%
      unlist() %>%
      sort()

    return(pars)
  }

  pars <- pars(as.mcmcr(x), scalar = scalar)

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random %<>%
    intersect(pars) %>%
    sort()

  if (param_type ==  "random") return(random)

  derived <- x$model$derived %>%
    intersect(pars) %>%
    sort()

  if (param_type == "derived") return(derived)

  pars %<>%
    setdiff(random) %>%
    setdiff(derived) %>%
    sort()

  pars
}
