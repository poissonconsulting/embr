#' Plot Analysis
#'
#' @param x The analysis object to plot
#' @param param_type A string indicating the type of terms to get the names for.
#' @param ... Unused.
#' @export
plot.mb_analysis <- function(x, param_type = "fixed", ...) {
  parameters <- parameters(x, param_type)

  x %<>% as.mcmcr()

  x %<>% subset(parameters = parameters)

  plot(x)
}
