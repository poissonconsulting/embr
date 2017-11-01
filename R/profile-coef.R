#' Profile Coef
#'
#' @param object The object.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param ... Unused.
#' @export
profile_coef <- function(object, conf_level = getOption("mb.conf_level", 0.95), ...) {
  UseMethod("profile_coef")
}
