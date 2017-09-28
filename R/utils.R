all1 <- function(x) all(x == 1)

dprint <- function(x, note = NULL, do = getOption("dprint.do", TRUE)) {
  if (!do) return(invisible())
  if (!is.null(note))
    cat("\n**", note, "**\n")
  cat("\n", deparse(substitute(x)), ": \n", sep = "")
  print(x)
}

parameters_arg2to1 <- function(param_type, x, scalar_only) {
  parameters(x = x, param_type = param_type, scalar_only = scalar_only)
}

coef_arg2to1 <- function(param_type, object, include_constant, conf_level, ...) {
  coef(object, param_type = param_type, include_constant = include_constant, conf_level = conf_level, ...)
}

allin <- function(x, y) all(x %in% y)

#' Is Named List
#'
#' @param x The object to test.
#'
#' @return A flag.
#' @export
#' @examples
#' is_nlist(1)
#' is_nlist(list())
#' is_nlist(list(1))
#' is_nlist(list(x = 1))
#' is_nlist(list(x = list(y = 2)))
is_nlist <- function(x) {
  if (!is.list(x)) return(FALSE)
  if (!length(x)) return(TRUE)
  if (is.null(names(x))) return(FALSE)
  return(!any(vapply(x, is.list, TRUE)))
}

#' Is syntactic
#'
#' @param x A character of possible variable names.
#' @return A logical vector indicating whether a syntactically correct variable name.
#' @export
#' @examples
#' is.syntactic(c("0", "x", "1x","x y", "x1"))
is.syntactic <- function(x) {
  x == make.names(x)
}

sort_random_effects <- function(x) {
  x %<>% sort_nlist()
  check_all_elements_class_character(x)
  x %<>% llply(function(x) sort(x))
  x
}

#' Sort Named List
#'
#' Sorts a named list by its names.
#'
#' @param x The named list to sort.
#' @return The sorted named list.
#' @export
#' @examples
#' sort_nlist(list(y = 2, x = 1, a = 10))
sort_nlist <- function(x) {
  stopifnot(is_nlist(x))

  if (!length(x)) return(x)
  x[order(names(x))]
}

lmcmcarray <- function(x) {
  nrow <- nrow(x)

  if (identical(nrow, 1L)) {
    dims <- 1L
  } else {
    dims <- str_replace(x$term[nrow], "^(\\w+)(.*)", "\\2") %>%
      str_replace("^(\\[)(.*)(\\])$", "\\2") %>%
      str_split(",", simplify = FALSE) %>%
      unlist() %>%
      as.integer()
  }
  dims %<>% c(1L, 1L, .)

  samples <- array(x$estimate, dim = dims)
  class(samples) <- "mcmcarray"

  samples
}

#' Scalar Named List
#'
#' Filters a named list so only scalar elements remain.wiby its names.
#'
#' @param x The named list to sort.
#' @return The sorted named list.
#' @export
#' @examples
#' scalar_nlist(list(y = 2, x = 1, a = c(10,1)))
scalar_nlist <- function(x) {
  stopifnot(is_nlist(x))

  if (!length(x)) return(x)
  x[vapply(x, dims, 0L) == 1]
}

indexes <- function(x) {
  x %<>% str_replace("^(\\w+)(\\[[:alnum:]+([,][:alnum:]+)*\\])$", "\\2")
  x[!str_detect(x, "\\[")] <- ""
  x
}

remainder <- function(x, y) {
  dplyr::setdiff(y, x)
}

model_names <- function(x, drops) {
  drops %<>% full_drop()
  stopifnot(all(unique(unlist((x))) %in% drops))
  x %<>% llply(remainder, drops)
  x[vapply(x, length, 1L) == 0] <- "base"
  x %<>% llply(str_c, collapse = "+") %>% unlist()
  x %<>% vapply(function(x) str_c("base+", x, collapse = ""), "")
  x[x == "base+base"] <- "base"
  x[x == str_c("base+", str_c(drops, collapse = "+"), collapse = "")] <- "full"
  names(x) <- NULL
  x
}

drop_indices <- function(x) {
  str_replace(x, "^(\\w+)(\\[.*)", "\\1")
}

#' Power
#'
#' R equivalent to the C++  function.
#'
#' @param x A numeric vector
#' @param n A numeric vector of the power term.
#' @export
#' @examples
#' pow(10,2)
pow <- function(x, n) {
  x^n
}

response_lm <- function(x) {
  if (!is.character(x)) x %<>% template()
  stringr::str_replace(x, "\\s+~.*", "") %>% str_replace_all("\\s{1,}", "")
}
