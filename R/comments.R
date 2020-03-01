#' Comment String
#'
#' Returns the regular expression used to identify the start of a comment in an mb_code object.
#'
#' @param object The mb code object.
#' @param ... Unused.
#' @return A string of the regular expression.
#' @export
comment_string <- function(object, ...) {
  UseMethod("comment_string")
}

#' @export
comment_string.mb_code <- function(object, ...) {
  "#"
}

#' Removes comments from the template strings(s) of an mb object or a character vector.
#'
#' @param object The mb object or character vector.
#' @param ... Unused.
#' @return The mb object or character vector without comments in its template string(s).
#' @export
rm_comments <- function(object, ...) {
  UseMethod("rm_comments")
}

#' @export
rm_comments.character <- function(object, comment_string = "#", ...) {
  chk_string(comment_string)
  pattern <- paste0("\\s*", comment_string, "[^\n]*(?=($|[\n]))")
  gsub(pattern, "", object, perl = TRUE)
}

#' @export
rm_comments.mb_code <- function(object, ...) {
  object$template %<>% rm_comments(comment_string = comment_string(object))
  object
}

#' @export
rm_comments.mb_model <- function(object, ...) {
  object$code %<>% rm_comments()
  object
}

#' @export
rm_comments.mb_analysis <- function(object, ...) {
  object$model %<>% rm_comments()
  object
}

#' @export
rm_comments.mb_models <- function(object, ...) {
  object %<>% lapply(rm_comments)
  class(object) <- "mb_models"
  object
}

#' @export
rm_comments.mb_analyses <- function(object, ...) {
  object %<>% lapply(rm_comments)
  class(object) <- "mb_analyses"
  object
}
