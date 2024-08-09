#' @export
stats::logLik

mcmc_derive_logLik <- function(x) {
  logLik <- mcmc_derive(x, term = "log_lik")

  dim <- dim(logLik[["log_lik"]])

  if (!identical(length(dim), 3L)) {
    err("logLik term 'log_lik' must be a vector", tidy = FALSE)
  }

  n <- dim[3]

  if (!identical(n, sample_size(x))) {
    warning("number of 'log_lik' terms does not equal number of rows of data")
  }

  logLik
}

logLik_matrix <- function(x) {
  matrix <- mcmc_derive_logLik(x)
  matrix <- mcmcr::collapse_chains(matrix)
  matrix <- matrix$log_lik
  matrix <- matrix(matrix, ncol = sample_size(x))
  matrix
}

#' Log-Likelihood
#'
#' Log-Likelihood for a MB analysis.
#'
#' @param object The mb_analysis object.
#' @param ... unused.
#' @export
logLik.mb_analysis <- function(object, ...) {
  if (!is_bayesian(object)) {
    if (is.null(object$logLik)) {
      return(NA_real_)
    }
    return(object$logLik)
  }
  if (!is_new_parameter(object, "log_lik")) {
    warning("log_lik is not in new_expr", call. = FALSE)
    return(NA_real_)
  }

  logLik <- logLik_matrix(object)
  logLik <- logColMeansExp(logLik)
  logLik <- sum(logLik)

  logLik
}

#' Log-Likelihood
#'
#' Log-Likelihood for a MB NULL analysis.
#'
#' @param object The mb_analysis object.
#' @param ... unused.
#' @export
logLik.mb_null_analysis <- function(object, ...) {
  -Inf
}
