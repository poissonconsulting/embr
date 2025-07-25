#' Parameter Descriptions
#'
#' @param param_type A string indicating the type of terms to get the names for.
#' @param type A string of the residual type.
#' @param nchains A count of the number of chains (default: 3).
#' @param niters A count of the number of iterations to save per chain (default: 1000).
#' @param nthin A count of the thinning interval.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable messages and warnings, including sampling progress.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param seed A positive whole number specifying the seed to use. The default is random. This is currently only implemented for Stan models.
#' @param niters_warmup A count of the number of warmup iterations. The default is to use the same number of iterations as `niters`. This is currently only implemented for Stan models.
#' @param stan_engine A string specifying the Stan engine to use:
#' * `"rstan"` for MCMC sampling via [rstan::sampling()] (default).
#' * `"cmdstan-mcmc"` for MCMC sampling via [cmdstanr::sample()]
#' * `"cmdstan-pathfinder"` for pathfinder estimation via [cmdstanr::pathfinder()]
#' * `"cmdstan-optimize"` for optimization via [cmdstanr::optimize()]
#' * `"cmdstan-laplace"` for Laplace approximation via [cmdstanr::laplace()]
#' @param ... Unused.
#' @name params
NULL
