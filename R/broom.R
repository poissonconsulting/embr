#' @export
glance.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), ...) {
  check_number(rhat, c(1.0, 1.5))

  n <- sample_size(x)
  K <- nterms(x, include_constant = FALSE)

  if (is_bayesian(x)) {
    rhat_analysis <- rhat(x)
    rhat_arg <- rhat

    tibble <- tibble::tibble(
      n = n,
      K = K,
      nchains = nchains(x),
      nthin = nthin(x),
      niters = niters(x),
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
tidy.mb_analysis <- function(x, conf_level = getOption("mb.conf_level", 0.95), ...) {
  coef <- coef(x, param_type = "all", conf_level = conf_level)

  coef <- coef[c("term", "estimate", "lower", "upper")]

  coef
}

#' @export
augment.mb_analysis <- function(x, ...) {
  data <- data_set(x)

  if (is_new_parameter(x, "fitted"))
    data$fitted <- fitted(x)$estimate
  if (is_new_parameter(x, "residual"))
    data$residual <- residuals(x)$estimate
  if (is_new_parameter(x, "log_lik")) {
    logLik <- logLik_matrix(x)
    if (ncol(logLik) == nrow(data)) {
      data$log_lik <- logColMeansExp(logLik)
      data$vlog_lik <- matrixStats::colVars(logLik)
    }
  }
  data
}


