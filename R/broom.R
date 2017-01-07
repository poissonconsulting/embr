#' @export
glance.mb_analysis <- function(x, ...) {

  logLik <- log

  dplyr::data_frame(
    rhat = rhat(x),
    IC = IC(x),
    logLik = logLik(x)
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
