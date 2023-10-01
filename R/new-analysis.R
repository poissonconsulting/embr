#' MB Analysis
#'
#' Constucts a new analysis object
#'
#' @param x A list.
#' @param class The class of the new object.
#'
#' @export
new_analysis <- function(x, class) {
  chk_list(x)
  chk_named(x)
  chk_subset(c("model", "data"), names(x))

  class <- c(setdiff(class, "mb_analysis"), "mb_analysis")
  structure(x, class = class)
}

#' Retrieve model
#'
#' Constucts a new analysis object
#'
#' @param analysis An object of class `"mb_analysis"`.
#' @export
get_model <- function(analysis) {
  chk_s3_class(analysis, "mb_analysis")
  analysis$model
}
