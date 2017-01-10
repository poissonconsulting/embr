#' @export
parameters.character <- function(x, ...) {
  x %<>% str_extract_all("\\w+") %>% unlist() %>% unique() %>% sort()
  x
}

#' @export
parameters.mb_code <- function(x, ...) {
  parameters(template(x))
}
