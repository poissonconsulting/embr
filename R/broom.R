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
    glance$nthin = nthin(x)
    glance$niters = niters(x)
    glance$ess = ess(x)
    glance$rhat = rhat(x)
  }

  glance$converged = converged(x, rhat = rhat, esr = esr)
  glance
}

#' @export
glance.mb_analyses <- function(x, ...) {
  x %<>% purrr::map_dfr(x, glance, .id = "Analysis")
}

#' @export
tidy.mb_analysis <- function(x, conf_level = getOption("mb.conf_level", 0.95), ...) {
  coef <- coef(x, conf_level = conf_level)

  coef <- coef[c("term", "estimate", "lower", "upper")]

  if (!nrow(coef)) return(coef)

  if (is_bayesian(x)) {
    mcmcr <- as.mcmcr(x) %>%
      subset(parameters = parameters(x))
    rhat <- estimates(mcmcr, fun = rhat, as_list = FALSE)
    esr <- estimates(mcmcr, fun = esr, as_list = FALSE)

    rhat$rhat <- round(rhat$estimate, 2)
    esr$esr <- round(esr$estimate, 2)
    rhat$estimate <- NULL
    esr$estimate <- NULL

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


