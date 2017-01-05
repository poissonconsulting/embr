#' @export
as.mcmcr.mb_analysis <- function(x, ...) {
  if (is.null(x$mcmcr)) error("as.mcmcr is undefined for x")
  x$mcmcr
}
