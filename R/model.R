#' Model
#'
#' Gets the model for an object.
#'
#' @param object The object.
#' @return An object inheriting from class mb_model.
#' @export
model <- function(object) {UseMethod("model")}

#' @export
model.mb_analysis <- function(object) object$model
