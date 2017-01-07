#' Plot Analysis
#'
#' @param x The analysis object to plot
#' @param fixed A flag specifying whether fixed or random terms.
#' @param ... Unused.
#' @export
plot.mb_analysis <- function(x, fixed = TRUE, ...) {
  parameters <- parameters(x, fixed)

  x %<>% as.mcmcr()

  x %<>% subset(parameters = parameters)

  plot(x)
}
