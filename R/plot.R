#' @export
plot.mb_analysis <- function(x, ...) {
  check_unused(...)

  if (is.null(x$mcmcr)) error("plot is undefined for x")

  plot(x$mcmcr)
}
