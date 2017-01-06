#' Plot Analysis
#'
#' @param fixed A flag specifying whether fixed or random terms.
#' @export
plot.mb_analysis <- function(x, fixed = TRUE, ...) {
  parameters <- parameters(x, fixed)

  x %<>% as.mcmcr()

  x %<>% subset(parameters = parameters)

  plot(x)
}
