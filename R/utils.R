all1 <- function(x) all(x == 1)

as_mb_analyses <- function(x, text = names(x)) {
  names(x) <- text
  class(x) <- "mb_analyses"
  x
}

as_mb_meta_analysis <- function(x, text = names(x)) {
  names(x) <- text
  class(x) <- "mb_meta_analysis"
  x
}

pars_arg2to1 <- function(param_type, x, scalar = NULL) {
  if(missing(scalar)) {
    return(pars(x = x, param_type = param_type))
  }
  pars(x = x, param_type = param_type, scalar = scalar)
}

coef_arg2to1 <- function(param_type, object, include_constant, conf_level, ...) {
  coef(object, param_type = param_type, include_constant = include_constant, conf_level = conf_level, ...)
}


is_new_parameter <- function(x, parameter) {
  # https://github.com/poissonconsulting/term/issues/57
  parameter %in% pars(paste(deparse(new_expr(x)), collapse = "\n"))
}

# should be more stable than log(colMeans(exp(x)))
logColMeansExp <- function(x) {
  matrixStats::colLogSumExps(x) - log(nrow(x))
}

#' Is Named List
#'
#' @param x The object to test.
#'
#' @return A flag.
#' @export
#' @examples
#' is_namedlist(1)
#' is_namedlist(list())
#' is_namedlist(list(1))
#' is_namedlist(list(x = 1))
#' is_namedlist(list(x = list(y = 2)))
is_namedlist <- function(x) {
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
  x <- sort_nlist(x)
  check_all_elements_class_character(x)
  x <- lapply(x, function(x) sort(x))
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
  stopifnot(is_namedlist(x))

  if (!length(x)) return(x)
  x[order(names(x))]
}

lmcmcarray <- function(x) {
  nrow <- nrow(x)

  if (identical(nrow, 1L)) {
    dims <- 1L
  } else {
    dims <- sub("^(\\w+)(.*)", "\\2", x$term[nrow])
    dims <- sub("^(\\[)(.*)(\\])$", "\\2", dims)
    dims <- strsplit(dims, ",")
    dims <- unlist(dims)
    dims <- as.integer(dims)
  }
  dims <- c(dims, 1L, 1L, .)

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
  stopifnot(is_namedlist(x))

  if (!length(x)) return(x)
  x[vapply(x, dims, 0L) == 1]
}

indexes <- function(x) {
  x <- sub("^(\\w+)(\\[[[:alnum:]]+([,][[:alnum:]]+)*\\])$", "\\2", x)
  x[!grepl("\\[", x)] <- ""
  x
}

remainder <- function(x, y) {
  dplyr::setdiff(y, x)
}

model_names <- function(x, drops) {
  drops <- full_drop(drops)
  stopifnot(all(unique(unlist((x))) %in% drops))
  x <- lapply(x, remainder, drops)
  x[vapply(x, length, 1L) == 0] <- "base"
  x <- lapply(x, p0, collapse = "+")
  x <- unlist(x)
  x <- vapply(x, function(x) p0("base+", x, collapse = ""), "")
  x[x == "base+base"] <- "base"
  x[x == p0("base+", p0(drops, collapse = "+"), collapse = "")] <- "full"
  names(x) <- NULL
  x
}

drop_indices <- function(x) {
  sub("^(\\w+)(\\[.*)", "\\1", x)
}

response_lm <- function(x) {
  if (!is.character(x)) x <- template(x)
  x <- sub("\\s+~.*", "", x)
  x <- gsub("\\s{1,}", "", x)
  x
}

all_first_level <- function(x) {
  stopifnot(is.factor(x))
  levels <- levels(x)
  if(is.ordered(x)) return(ordered(rep(levels[1], length(x)), levels = levels))
  factor(rep(levels[1], length(x)), levels = levels)
}

# from https://recology.info/2018/10/limiting-dependencies/
str_extract_all <- function(x, y) regmatches(x, gregexpr(y, x))

