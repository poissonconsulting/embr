check_drops <- function(drops) {
  if (!is.list(drops)) err("drops must be a list")
  if (!length(drops)) return(drops)
  if (!all(vapply(drops, is.character, TRUE)))
    err("drops must be a list of character vectors")
  if (!all(vapply(drops, length, 1L) > 0))
    err("drops must be a list of non-zero length character vectors")
  if (anyDuplicated(drops))
    err("drops must be a list of unique character vectors")

  if (any(impossible_drop(drops) %in% possible_drop(drops)))
    err("drops is inconsistent")
  drops
}

#' Check MB Code
#'
#' @param object The object to check.
#' @param object_name A string of the object name.
#' @return The object or throws an informative error.
#' @export
check_mb_code <- function(object, object_name = substitute(object)) {
  if (!is.character(object_name)) object_name <- deparse(object_name)

  if (!is.mb_code(object)) err(object_name, " must inherit from class mb_code")
  object
}

#' Check MB Analysis
#'
#' @param object The object to check.
#' @param object_name A string of the object name.
#' @return The object or throws an informative error.
#' @export
check_mb_analysis <- function(object, object_name = substitute(object)) {
  if (!is.character(object_name)) object_name <- deparse(object_name)

  if (!is.mb_analysis(object)) err(object_name, " must inherit from class mb_analysis")
  object
}

#' Check MB Model
#'
#' @param object The object to check.
#' @param object_name A string of the object name.
#' @return The object or throws an informative error.
#' @export
check_mb_model <- function(object, object_name = substitute(object)) {
  if (!is.character(object_name)) object_name <- deparse(object_name)

  if (!is.mb_model(object)) err(object_name, " must inherit from class mb_model")
  object
}

check_x_in_y <- function(x, y, x_name = substitute(x), y_name = substitute(y), type_x = "values", type_y = "values") {
  if (is.name(x_name)) x_name <- deparse(x_name)
  if (is.name(y_name)) y_name <- deparse(y_name)

  if (is.null(y)) return(x)
  if (!length(x)) return(x)

  if (!all(x %in% y))
    err(type_x, " in ", x_name, " must also be in ", type_y, " of ", y_name)
  x
}

check_x_not_in_y <- function(x, y, x_name = substitute(x), y_name = substitute(y), type_x = "values", type_y = "values") {
  if (is.name(x_name)) x_name <- deparse(x_name)
  if (is.name(y_name)) y_name <- deparse(y_name)

  if (is.null(y)) return(x)
  if (!length(x)) return(x)

  if (any(x %in% y))
    err(type_x, " in ", x_name, " must not be in ", type_y, " of ", y_name)
  x
}

check_single_arg_fun <- function(fun) {
  fun_name <- deparse(substitute(fun))

  if (!is.function(fun)) err(fun_name, " must be a function")
  if (length(formals(args(fun))) != 1)  err(fun_name, " must take a single argument")
  fun
}

check_unique_character_vector <- function(x, x_name = substitute(x)) {
  chk_s3_class(x, "character", x_name = x_name)
  chk_not_any_na(x, x_name = x_name)
  chk_unique(x, x_name = x_name)
  x
}

check_uniquely_named_character_vector <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name <- deparse(x_name)

  if (!is.character(x)) err(x_name, " must be a character vector")

  if (!length(x))
    return(x)

  if (is.null(names(x))) err(x_name, "must be named")
  chk_unique(names(x), x_name = x_name)
  x
}

#' Check Uniquely Named List
#'
#' @param x The object to check.
#' @param x_name A string of the objects name.
#' @return The original object or throws an informative error.
#' @export
check_uniquely_named_list <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name <- deparse(x_name)

  if (!is.list(x)) err(x_name, " must be a list")
  if (!length(x)) return(x)
  if (is.null(names(x))) err(x_name, " must be a named list")
  if (anyDuplicated(names(x))) err(x_name, " must be a uniquely named list")
  x
}

check_all_elements_class_character <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name <- deparse(x_name)

  if (!length(x)) return(x)

  if (!all(unlist(llply(x, class)) == "character"))
    err("elements of ", x_name, "must be character vectors")
  x
}

check_all_elements_unique <- function(x, x_name = substitute(x)) {
  if (is.name(x)) x_name <- deparse(x_name)

  if (!length(x)) return(x)

  if (any(vapply(x, anyDuplicated, TRUE)))
    err("elements of ", x_name, "must be unique")
  x
}
