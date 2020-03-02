#' @export
generics::augment

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
        data$vlog_lik <- apply(logLik, 2, var)
      }
    } else
      data$log_lik <- predict(x, new_data = data_set(x), term = "log_lik")$estimate
  }
  data
}


