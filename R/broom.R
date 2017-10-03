#' @export
glance.mb_analysis <- function(x, n = NULL, rhat = getOption("mb.rhat", 1.1), ...) {
  checkor(check_null(n), check_count(n))
  check_number(rhat, c(1.0, 1.5))

  if (is.null(n)) n <- sample_size(x)
  K <- nterms(x, include_constant = FALSE)

  if (is_bayesian(x)) {
    rhat_analysis <- rhat(x)
    rhat_arg <- rhat

    tibble <- tibble::tibble(
      n = n,
      K = K,
      nchains = nchains(x),
      nsims = nsims(x),
      nsamples = nsamples(x),
      ess = ess(x),
      rhat = rhat_analysis,
      converged = rhat_analysis < rhat_arg
    )
    return(tibble)
  }

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
