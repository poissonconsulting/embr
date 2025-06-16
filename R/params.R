#' Parameter Descriptions
#'
#' @param param_type A string indicating the type of terms to get the names for.
#' @param type A string of the residual type.
#' @param stan_engine A string specifying the Stan engine to use:
#' * `"rstan"` for MCMC sampling via [rstan::sampling()] (default).
#' * `"cmdstan-mcmc"` for MCMC sampling via [cmdstanr::sample()]
#' * `"cmdstan-pathfinder"` for pathfinder estimation via [cmdstanr::pathfinder()]
#' * `"cmdstan-optimize"` for optimization via [cmdstanr::optimize()]
#' * `"cmdstan-laplace"` for Laplace approximation via [cmdstanr::laplace()]
#' @param ... Unused.
#' @name params
NULL
