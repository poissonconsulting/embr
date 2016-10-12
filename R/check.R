#' Check MB Analysis
#'
#' @param object The object to check.
#' @param object_name A string of the object name.
#' @return The object or throws an informative error.
#' @export
check_mb_analysis <- function(object, object_name = substitute(object)) {
  if (!is.character(object_name)) object_name %<>% deparse()

  if (!is.mb_analysis(object)) error(object_name, " must inherit from class mb_analysis")
  object
}

#' Check MB Model
#'
#' @param object The object to check.
#' @param object_name A string of the object name.
#' @return The object or throws an informative error.
#' @export
check_mb_model <- function(object, object_name = substitute(object)) {
  if (!is.character(object_name)) object_name %<>% deparse()

  if (!is.mb_model(object)) error(object_name, " must inherit from class mb_model")
  object
}

