#' @export
glance.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), ...) {
  dplyr::data_frame(
    n = sample_size(x),
    k = nterms(x, include_constant = FALSE),
    IC = IC(x),
    converged = converged(x, rhat = rhat)
  )
}

#' @export
tidy.mb_analysis <- function(x, conf.int = FALSE, conf.level = 0.95, ...) {
  coef <- coef(x, conf_level = conf.level)

  coef %<>% dplyr::select_(term = ~term, ~estimate, std.error = ~sd,
                          statistic = ~zscore, p.value = ~significance,
                          conf.low = ~lower, conf.high = ~upper)

  if (!conf.int) {
    coef$conf.low <- NULL
    coef$conf.high <- NULL
  }
  coef
}
