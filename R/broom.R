#' @export
glance.mb_analysis <- function(x, n = NULL, ...) {
  dplyr::data_frame(
    n = sample_size(x),
    K = nterms(x, include_constant = FALSE),
    minutes = elapsed(x),
    converged = converged(x)
  )
}

#' @export
tidy.mb_analysis <- function(x, conf.int = FALSE, conf.level = 0.95, ...) {
  coef <- coef(x, conf_level = conf.level)

  coef %<>% dplyr::select_(term = ~term, ~estimate, std.error = ~sd,
                          statistic = ~zscore, p.value = ~pvalue,
                          conf.low = ~lower, conf.high = ~upper)

  if (!conf.int) {
    coef$conf.low <- NULL
    coef$conf.high <- NULL
  }
  coef
}
