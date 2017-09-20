#' @export
glance.mb_analysis <- function(x, n = NULL, ...) {
  checkor(check_null(n), check_count(n))

  if (is.null(n)) n <- sample_size(x)

  dplyr::data_frame(
    n = n,
    K = nterms(x, include_constant = FALSE),
    logLik = logLik(x),
    IC = IC(x, n = n),
    converged = converged(x)
  )
}

#' @export
glance.mb_analyses <- function(x, ...) {
  lapply(x, glance)
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
