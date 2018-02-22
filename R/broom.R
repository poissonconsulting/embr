#' @export
glance.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {

  glance <- tibble::tibble(
    n = sample_size(x),
    K = nterms(x, include_constant = FALSE))

  if (is_frequentist(x) || is_new_parameter(x, "log_lik")) {
    glance$logLik = logLik(x)
    glance$IC = IC(x)
  }

  if (is_bayesian(x)) {
    glance$nchains = nchains(x)
    glance$niters = niters(x)
    glance$nthin = nthin(x)
    glance$ess = ess(x)
    glance$rhat = rhat(x)
  }

  glance$converged = converged(x, rhat = rhat, esr = esr)
  glance
}

#' @export
glance.mb_analyses <- function(x, ...) {
  x %<>% purrr::map_dfr(glance, .id = "model")
  x
}

#' @export
tidy.mb_analysis <- function(x, conf_level = getOption("mb.conf_level", 0.95), ...) {
  coef <- coef(x, conf_level = conf_level, beep = FALSE)

  coef <- coef[c("term", "estimate", "lower", "upper")]

  if (!nrow(coef)) return(coef)

  if (is_bayesian(x)) {
    mcmcr <- as.mcmcr(x) %>%
      subset(parameters = parameters(x))

    rhat <- rhat(mcmcr, by = "term", as_df = TRUE)
    esr <- esr(mcmcr, by = "term", as_df = TRUE)

    coef %<>% merge(esr, by = "term")
    coef %<>% merge(rhat, by = "term")
  }
  coef
}

#' @export
augment.mb_analysis <- function(x, ...) {
  data <- data_set(x)

  if (is_new_parameter(x, "fit"))
    data$fit <- fitted(x)$estimate
  if (is_new_parameter(x, "residual"))
    data$residual <- residuals(x)$estimate
  if (is_new_parameter(x, "log_lik")) {
    if (is_bayesian(x)) {
      logLik <- logLik_matrix(x)
      if (ncol(logLik) == nrow(data)) {
        data$log_lik <- logColMeansExp(logLik)
        data$vlog_lik <- matrixStats::colVars(logLik)
      }
    } else
      data$log_lik <- predict(x, new_data = data_set(x), term = "log_lik")$estimate
  }
  data
}


