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
parameters.mb_analysis <- function(x, fixed = TRUE, ...) {

  check_flag(fixed)

  random <- names(random_effects(x))

  if (!fixed) return(random)

  parameters <- parameters(as.mcmcr(x))

  setdiff(parameters, random)
}
