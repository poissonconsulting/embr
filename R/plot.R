#' Plot Analysis
#'
#' @param x The analysis object to plot
#' @param param_type A flag specifying whether 'fixed', 'random' or 'derived' terms.
#' @param ... Unused.
#' @export
plot.mb_analysis <- function(x, param_type = "fixed", ...) {
  parameters <- parameters(x, param_type)

  x %<>% as.mcmcr()

  x %<>% subset(parameters = parameters)

  plot(x)
}
