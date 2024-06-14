#' @export
pars.character <- function(x, ...) {
  check_dots_empty()
  if(is.null(x)) return(character(0))

  x <- rm_comments(x)
  x <- str_extract_all(x, "\\w+")
  x <- unlist(x)
  x <- unique(x)
  x <- x[is.syntactic(x)]

  sort(x)
}

#' @export
pars.mb_code <- function(x, ...) {
  check_dots_empty()

  pars(template(x))
}

#' @export
pars.mb_model <- function(x, param_type = "all", ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all", "raw"))
  check_dots_empty()

  if(param_type == "raw") {
    return(pars(code(x)))
  }


  if (param_type %in% c("primary", "all")) {
    pars <- c("fixed", "random")
    if (param_type == "all") pars <- c(pars, "derived")

    pars <- purrr::map(pars, pars_arg2to1, x = x)
    pars <- unlist(pars)
    pars <- sort(pars)

    return(pars)
  }

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random <- sort(random)

  if (param_type == "random") return(random)

  derived <- x$derived
  derived <- sort(derived)
  if (param_type == "derived") return(derived)

  pars <- pars(code(x))

  if(param_type == "raw") {
    return(pars)
  }
  pars <- pars[grepl(x$fixed, pars)]

  pars <- setdiff(pars, random)
  pars <- setdiff(pars, derived)
  pars <- sort(pars)
  # this is fixed pars
  pars
}

#' @export
pars.mb_analysis <- function(x, param_type = "all", scalar = NULL, ...) {
  chk_string(param_type)
  chk_subset(param_type,  c("fixed", "random", "derived", "primary", "all", "raw"))
  if(!is.null(scalar)) chk_flag(scalar)

  if(param_type == "raw") {
    return(pars(get_model(x), param_type = "raw"))
  }

  if (param_type %in% c("primary", "all")) {
    pars <- c("fixed", "random")
    if (param_type == "all") pars <- c(pars, "derived")

    pars <- purrr::map(pars, pars_arg2to1, x = x, scalar = scalar)
    pars <- unlist(pars)
    pars <- sort(pars)

    return(pars)
  }

  pars <- pars(as.mcmcr(x), scalar = scalar)

  random <- names(random_effects(x))
  if (is.null(random)) random <- character(0)
  random <- intersect(random, pars)
  random <- sort(random)

  if (param_type ==  "random") return(random)

  derived <- x$model$derived
  derived <- intersect(derived, pars)
  derived <- sort(derived)

  if (param_type == "derived") return(derived)

  pars <- setdiff(pars, random)
  pars <- setdiff(pars, derived)
  pars <- sort(pars)

  pars
}
