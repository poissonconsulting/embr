#' @export
priorsense::powerscale_sensitivity

#' Run Power-Scaling Sensitivity Analysis
#'
#' Calculates the prior/likelihood sensitivity based on power-scaling
#' perturbations. This is done using importance sampling (and
#' optionally moment matching).
#'
#' @param x The mb_analysis object.
#' @param ... Arguments passed to methods to
#' [priorsense::powerscale_sensitivity()]. Alternative functions for
#' `log_lik_fn` and `log_prior_fn` cannot be used.
#'
#' @returns Table of sensitivity values for each specified variable.
#' @export
#'
powerscale_sensitivity.mb_analysis <- function(x, ...) {
  priorsense::powerscale_sensitivity(
    x = as.mcmc.list(x$mcmcr),
    fit = x,
    log_lik_fn = log_lik_draws.mb_analysis,
    log_prior_fn = log_prior_draws.mb_analysis,
    ...
  )
}
