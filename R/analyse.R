#' Analyse Models
#'
#' @description
#' Generic function for performing Bayesian analysis on models using Stan or JAGS,
#' or maximum likelihood analysis using TMB.
#'
#' For more useful documentation, see the specific methods:
#' - [analyse.mb_model()] for single model analysis (Stan/JAGS). This is the most commonly used method.
#' - [analyse.mb_models()] for multiple model analysis (Stan/JAGS).
#' - [analyse.character()] for character model analysis (Stan/JAGS). This allows you to skip the model creation step.
#'
#' @param x The object to analyse.
#' @param ... Additional arguments passed to methods.
#'
#' @return An analysis object (type depends on input and engine used).
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

#' Analyse
#'
#' @param model The mb_model to analyse.
#' @param data The data.
#' @param loaded The loaded model.
#' @inheritParams params
#' @param ...  Additional arguments.
#' @export
analyse1 <- function(model, data, loaded, nchains, niters, nthin, quiet, glance, parallel, seed, niters_warmup, ...) {
  UseMethod("analyse1")
}

analyse_data <- function(data, name = NULL, x, loaded, nchains, niters, nthin,
                         parallel, quiet, glance, seed, niters_warmup, ...) {
  if (!is.null(name) & glance) cat("Data:", name, "\n")
  analyse1(x, data,
           loaded = loaded, nchains = nchains, niters = niters,
           nthin = nthin, parallel = parallel, quiet = quiet,
           glance = glance, seed = seed,
           niters_warmup = niters_warmup, ...
  )
}


analyse_model <- function(x, name = NULL, data, parallel, nchains, niters, nthin, quiet, glance, beep, stan_engine, ...) {
  if (!is.null(name) & glance) cat("Model:", name, "\n")
  analyse(x,
          data = data, parallel = parallel,
          nchains = nchains, niters = niters, nthin = nthin,
          quiet = quiet, glance = glance, beep = beep,
          stan_engine = stan_engine, ...
  )
}

#' Analyse Character Model
#'
#' Analyses a model defined as a character string containing Stan or JAGS code.
#' The character string is first converted to an mb_model object, then passed on to [analyse.mb_model()]
#'
#' @param x A character string containing Stan or JAGS model code.
#' @param data The data frame to analyse.
#' @param select_data A named list specifying the columns to select and their
#'   associated classes and values as well as transformations and scaling options.
#' @inheritParams params
#' @param ...  Additional arguments passed to the underlying estimation function.
#'   See [analyse.mb_model()] for details.
#'
#' @return An mb_analysis object containing the fitted model results.
#' @seealso
#' - [analyse.mb_model()] for analysing a single model
#' - [analyse.mb_models()] for analysing multiple models
#'
#' @export
analyse.character <- function(x, data,
                              select_data = list(),
                              nchains = getOption("mb.nchains", 3L),
                              niters = getOption("mb.niters", 1000L),
                              nthin = getOption("mb.nthin", 1L),
                              parallel = getOption("mb.parallel", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              seed = sample.int(.Machine$integer.max, 1),
                              stan_engine = getOption("mb.stan_engine", character(0)),
                              niters_warmup = niters,
                              ...) {
  x <- model(x, select_data = select_data)
  analyse(x,
          data = data,
          parallel = parallel, nchains = nchains, niters = niters, nthin = nthin, quiet = quiet,
          glance = glance, beep = beep, seed = seed, stan_engine = stan_engine,
          niters_warmup = niters_warmup, ...
  )
}

#' Analyse Single Model
#'
#' @description
#' Performs parameter estimation on a single mb_model object using Stan or JAGS.
#'
#' The model fitting method dispatched depends on the class of the mb_model object and the `stan_engine` argument.
#'
#' If the model is a JAGS model, [rjags](https://github.com/cran/rjags) is used for MCMC sampling.
#' If the model is a Stan model, [rstan](https://github.com/stan-dev/rstan) or [cmdstanr](https://mc-stan.org/cmdstanr/) is used, depending on the value provided to `stan_engine`:
#' * `"cmdstan-mcmc"` for [MCMC sampling](https://mc-stan.org/docs/cmdstan-guide/mcmc_config.html) via [cmdstanr::sample()]
#' * `"cmdstan-optimize"` for [optimization](https://mc-stan.org/docs/cmdstan-guide/optimize_config.html) via [cmdstanr::optimize()]
#' * `"cmdstan-pathfinder"` for [pathfinder](https://mc-stan.org/docs/cmdstan-guide/pathfinder_config.html) estimation via [cmdstanr::pathfinder()]
#' * `"cmdstan-variational"` for [variational ADVI](https://mc-stan.org/docs/cmdstan-guide/variational_config.html) estimation via [cmdstanr::variational()]
#' * `"cmdstan-laplace"` for [Laplace approximation](https://mc-stan.org/docs/cmdstan-guide/laplace_sample_config.html) via [cmdstanr::laplace()]
#' * Any other character value will default to MCMC sampling via [rstan::sampling()]
#'
#' @details
#' For CmdStan models, additional arguments can be passed to the engine-specific estimation functions via the `...` argument.
#'
#' For example, additional options in [cmdstanr::sample()] include:
#' * `adapt_delta` - Target acceptance rate (0 < adapt_delta < 1)
#' * `max_treedepth` - Maximum tree depth for NUTS sampler
#' * `step_size` - Initial step size for sampler
#' * `refresh` - How often to print sampling progress
#'
#' Some additional options in [cmdstanr::pathfinder()] include:
#' * `num_paths` - Number of single-path Pathfinders to run (default: 4)
#' * `history_size` - L-BFGS history size for approximating Hessian (default: 5)
#' * `max_lbfgs_iters` - Maximum L-BFGS iterations per path (default: 1000)
#' * `psis_resample` - Whether to use Pareto-smoothed importance sampling (default: TRUE)
#'
#' Some additional options in [cmdstanr::variational()] include:
#' * `algorithm` - Variational algorithm: "meanfield" (default) or "fullrank"
#'
#' Some aditional options in [cmdstanr::optimize()] include:
#' * `algorithm` - Optimization algorithm: "lbfgs" (default), "bfgs", or "newton"
#'
#' Some additional options in [cmdstanr::laplace()] include:
#' * `mode` - CmdStanMLE object from previous optimization (if NULL, runs optimize)
#' * `jacobian` - Whether mode used Jacobian adjustment (default: TRUE)
#'
#' Each `analyse1` method checks for the presence of conflicting arguments and will ignore these (e.g., `iter_sampling` with `stan_engine = 'cmdstan-mcmc'` will be ignored in favour of iterations set via `niters`)
#'
#' One exception is for `init`, which can be passed via '...' to override defaults or inits generated via `gen_inits()` in `model()`. Non-MCMC model fitting methods cannot use `gen_inits()`.
#' Some arguments in `analyse.mb_model()` are unused in non-MCMC methods (e.g., `nthin`, `niters_warmup`).
#'
#' For pathfinder, variational, and laplace methods, `niters` samples are drawn from the approximated posterior distributions.
#'
#' @param x An mb_model object to analyse.
#' @param data The data frame to analyse, or a list of data frames for multiple datasets.
#' @param ... Additional arguments passed to the underlying estimation function (see above for details).
#' @inheritParams params
#' @return
#' - If `data` is a data.frame: An mb_analysis object
#' - If `data` is a list of data.frames: An mb_meta_analysis object
#'
#' @examples
#' \dontrun{
#' # Stan model with RStan (default)
#' analysis <- analyse(stan_model, data, nchains = 4, niters = 1000)
#'
#' # Stan model with CmdStanR MCMC
#' analysis <- analyse(stan_model, data,
#'                     stan_engine = "cmdstan-mcmc",
#'                     nchains = 4, niters = 1000)
#'
#' # Stan model with CmdStanR Pathfinder
#' analysis <- analyse(stan_model, data,
#'                     stan_engine = "cmdstan-pathfinder",
#'                     niters = 500)
#'
#' # JAGS model
#' analysis <- analyse(jags_model, data, nchains = 4, niters = 2000)
#'
#' # Passing engine-specific arguments
#' analysis <- analyse(stan_model, data,
#'                     stan_engine = "cmdstan-mcmc",
#'                     nchains = 4, niters = 2000,
#'                     adapt_delta = 0.99, # cmdstanr::sample argument
#'                     iter_warmup = 500L) # cmdstanr::sample argument
#'
#' analysis <- analyse(stan_model, data,
#'                     nchains = 4, niters = 2000,
#'                     control = list(adapt_delta = 0.95))  # rstan::sampling argument
#'
#' # Multiple datasets
#' data_list <- list(dataset1 = data1, dataset2 = data2)
#' analyses <- analyse(model, data_list, nchains = 3)
#' }
#'
#' @seealso
#' - [analyse.character()] for analysing a character model template
#' - [analyse.mb_models()] for analysing multiple models
#'
#' @export
analyse.mb_model <- function(x, data,
                             nchains = getOption("mb.nchains", 3L),
                             niters = getOption("mb.niters", 1000L),
                             nthin = getOption("mb.thin", NULL),
                             parallel = getOption("mb.parallel", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             glance = getOption("mb.glance", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             seed = sample.int(.Machine$integer.max, 1),
                             stan_engine = getOption("mb.stan_engine", character(0)),
                             niters_warmup = niters,
                             ...) {
  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  if (is.data.frame(data)) {
    chk_data(data)
  } else if (is.list(data)) {
    lapply(data, chk_data)
  } else {
    err("data must be a data.frame or a list of data.frames", tidy = FALSE)
  }

  chk_whole_number(nchains)
  chk_range(nchains, c(2L, 10L))
  chk_whole_number(niters)
  chk_range(niters, c(10L, 100000L))
  if (!is.null(nthin)) {
    chk_whole_number(nthin)
    chk_range(nthin, c(1L, 10000L))
  }

  chk_flag(parallel)
  chk_flag(quiet)
  chk_flag(glance)

  if (is.null(nthin)) nthin <- nthin(x)

  if(identical(stan_engine, "cmdstan-mcmc")) {
    class(x) <- c("cmdstan_model", "cmdstan_mcmc_model", class(x))
  } else if(identical(stan_engine, "cmdstan-pathfinder")) {
    class(x) <- c("cmdstan_model", "cmdstan_pathfinder_model", class(x))
  } else if(identical(stan_engine, "cmdstan-optimize")) {
    class(x) <- c("cmdstan_model", "cmdstan_optimize_model", class(x))
  } else if(identical(stan_engine, "cmdstan-laplace")) {
    class(x) <- c("cmdstan_model", "cmdstan_laplace_model", class(x))
  } else if(identical(stan_engine, "cmdstan-variational")) {
    class(x) <- c("cmdstan_model", "cmdstan_variational_model", class(x))
  }

  loaded <- load_model(x, quiet)

  if (is.data.frame(data)) {
    return(analyse_data(
      data = data, x = x, loaded = loaded,
      nchains = nchains, niters = niters, nthin = nthin,
      parallel = parallel, quiet = quiet, glance = glance,
      seed = seed,
      niters_warmup = niters_warmup, ...
    ))
  }

  names <- names(data)
  if (is.null(names)) {
    names(data) <- 1:length(x)
  }

  analyses <- purrr::imap(data, analyse_data,
                          x = x, loaded = loaded,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance,
                          seed = seed, stan_engine = stan_engine,
                          niters_warmup = niters_warmup, ...
  )

  names(data) <- names

  class(analyses) <- "mb_meta_analysis"
  analyses
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @inheritParams params
#' @param ...  Additional arguments.
#' @export
analyse.mb_models <- function(x, data,
                              nchains = getOption("mb.nchains", 3L),
                              niters = getOption("mb.niters", 1000L),
                              nthin = getOption("mb.thin", NULL),
                              parallel = getOption("mb.parallel", FALSE),
                              quiet = getOption("mb.quiet", TRUE),
                              glance = getOption("mb.glance", TRUE),
                              beep = getOption("mb.beep", TRUE),
                              seed = sample.int(.Machine$integer.max, 1),
                              stan_engine = getOption("mb.stan_engine", character(0)),
                              niters_warmup = niters,
                              ...) {
  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::imap(x, analyse_model,
                          data = data,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance, beep = FALSE,
                          seed = seed, stan_engine = stan_engine,
                          niters_warmup = niters_warmup, ...
  )

  if (is.data.frame(data)) {
    analyses <- as_mb_analyses(analyses, names)
    return(analyses)
  }
  analyses <- purrr::transpose(analyses)
  analyses <- purrr::map(analyses, as_mb_analyses, names)
  class(analyses) <- "mb_meta_analyses"
  analyses
}
