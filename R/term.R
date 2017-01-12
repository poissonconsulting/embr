as.term <- function(x, ...) {
  UseMethod("as.term")
}

parameter <- function(x, ...) {
  UseMethod("parameter")
}

as.term.character <- function(x, ...) {
  class(x) <- c("term", "character")
  x
}

as.character.term <- function(x, ...) {
  class(x) <- "character"
  x
}

is.term <- function(x, ...) {
  inherits(x, "term")
}

parameter.term <- function(x, ...) {
  str_replace(x, "^(\\w+)(.*)", "\\1")
}

rep.term <- function(x, times, ...) {
  x %<>% rep(times)
  as.term(x)
}

dims_term <- function(x, ...) {
  x %<>% str_replace("^(\\w+)(.*)", "\\2") %>%
    str_replace("^(\\[)(.*)(\\])$", "\\2") %>%
    str_split("\\s*[,]\\s*")
  x %<>% lapply(str_replace_all, "\\s+", "")
  x %<>% lapply(as.integer)
  x %<>% purrr::map_if(function(x) identical(x, NA_integer_), function(x) 1L)
  x
}

`>.term` <- function(e1, e2) {
  if (identical(length(e1), 1L)) e1 %<>% rep(length(e2))
  if (identical(length(e2), 1L)) e2 %<>% rep(length(e1))

  purrr::map2_lgl(e1, e2, greater_than_term)
}

greater_than_term <- function(e1, e2) {
  e1 %<>% as.term()
  e2 %<>% as.term()

  e1_parm <- parameter(e1)
  e2_parm <- parameter(e2)
  if (e1_parm != e2_parm) return(e1_parm > e2_parm)

  e1 <- dims_term(e1)[[1]]
  e2 <- dims_term(e2)[[1]]

  if (length(e1) != length(e2)) return(e1 > e2)

  equal <- e1 == e2

  if (all(equal)) return(FALSE)

  greaterthan <- !equal & e1 > e2
  greaterthan <- which(greaterthan)
  greaterthan[length(greaterthan)]
}
