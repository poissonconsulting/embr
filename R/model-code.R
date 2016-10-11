#' Model Code
#'
#' Gets the model_code for an object.
#'
#' @param object The object.
#' @param ... Unused.
#' @return The model code as a character vector for an object
#' @export
model_code <- function(object, ...) {UseMethod("model_code")}

#' @export
model_code.mb_model <- function(object, ...) object$model_code

#' @export
model_code.mb_analysis <- function(object, ...) model_code(model(object))
