#' Analyse Models
#'
#' @description
#' Fit a Bayesian hierarchical model to data using Stan (via rstan or cmdstanr)
#' or JAGS (via rjags).
#'
#' Three methods are dispatched on the class of `x`:
#'
#' * `analyse(x = <mb_model>)` is the main path — fit a single compiled model.
#' * `analyse(x = <mb_models>)` fits each model in the list against the same
#'   `data` and returns an `mb_analyses` (or `mb_meta_analyses` if `data` is a
#'   list of data frames). Used to compare model structures.
#' * `analyse(x = <character>)` takes raw Stan or JAGS code as a string,
#'   builds an `mb_model` via [model()] using `select_data`, then dispatches
#'   to the `mb_model` method. Convenience shortcut when you don't need to
#'   inspect or reuse the `mb_model` object.
#'
#' The estimation backend depends on the model's class (JAGS or Stan) and, for
#' Stan models, the `stan_engine` argument — see the Arguments section.
#'
#' @details
#' Engine-specific arguments (e.g. `adapt_delta`, `max_treedepth`, `num_paths`,
#' `algorithm`, `jacobian`) can be passed through `...` to the underlying
#' cmdstanr function. See [cmdstanr::sample()], [cmdstanr::pathfinder()],
#' [cmdstanr::variational()], [cmdstanr::optimize()], and [cmdstanr::laplace()]
#' for the full lists.
#'
#' Conflicting arguments are silently ignored — for example, `iter_sampling`
#' passed alongside `stan_engine = "cmdstan-mcmc"` is dropped in favour of
#' `niters`. The exception is `init`, which can be passed through `...` to
#' override inits supplied via `gen_inits()` in [model()]. Non-MCMC fitting
#' methods cannot use `gen_inits()`.
#'
#' Some arguments are unused by non-MCMC engines (e.g. `nthin`,
#' `niters_warmup`). For pathfinder, variational, and laplace, `niters` is the
#' number of samples drawn from the approximated posterior.
#'
#' @param x The object to analyse. An `mb_model`, an `mb_models` list, or a
#'   character string of Stan/JAGS code.
#' @param data A data frame, or a named list of data frames for meta-analysis
#'   across datasets.
#' @param select_data For the `character` method only: a named list specifying
#'   the columns to select and their associated classes, values, transforms,
#'   and scaling options. Passed to [model()]; see there for details.
#' @inheritParams params
#' @param ... Additional arguments passed to the underlying estimation
#'   function.
#' @return
#' * Single model + single data frame → an `mb_analysis`.
#' * Single model + list of data frames → an `mb_meta_analysis`.
#' * `mb_models` + single data frame → an `mb_analyses`.
#' * `mb_models` + list of data frames → an `mb_meta_analyses`.
#'
#' @seealso [model()] to build a model; [predict.mb_analysis()] and
#'   [coef.mb_analysis()] to summarise an analysis; [reanalyse()] to refit with
#'   different sampling settings.
#'
#' @examples
#' \dontrun{
#' # Stan model with rstan (default)
#' analysis <- analyse(stan_model, data, nchains = 4, niters = 1000)
#'
#' # Stan model with cmdstanr MCMC
#' analysis <- analyse(stan_model, data,
#'   stan_engine = "cmdstan-mcmc",
#'   nchains = 4, niters = 1000
#' )
#'
#' # Stan model with cmdstanr pathfinder
#' analysis <- analyse(stan_model, data,
#'   stan_engine = "cmdstan-pathfinder",
#'   niters = 500
#' )
#'
#' # JAGS model
#' analysis <- analyse(jags_model, data, nchains = 4, niters = 2000)
#'
#' # Passing engine-specific arguments through ...
#' analysis <- analyse(stan_model, data,
#'   stan_engine = "cmdstan-mcmc",
#'   adapt_delta = 0.99,
#'   iter_warmup = 500L
#' )
#' analysis <- analyse(stan_model, data,
#'   control = list(adapt_delta = 0.95) # rstan::sampling argument
#' )
#'
#' # Multiple datasets
#' analyses <- analyse(model, list(dataset1 = data1, dataset2 = data2))
#' }
#'
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

#' Internal dispatch for fitting a single model + dataset
#'
#' @description
#' Called by [analyse.mb_model()] once the data have been validated and the
#' model has been compiled. Backend packages register methods on `analyse1`
#' for each supported engine — for example, `analyse1.cmdstan_mcmc_model` and
#' the other `cmdstan_*` variants in `smbr2`, and `analyse1.jmb_model` in
#' `jmbr`.
#'
#' End users should call [analyse()], not `analyse1()` directly.
#'
#' @param model The mb_model to analyse.
#' @param data A validated data frame.
#' @param loaded The compiled / loaded model, as returned by [load_model()].
#' @inheritParams params
#' @param ... Additional arguments passed to the engine-specific estimation
#'   function.
#' @return An `mb_analysis` object.
#' @export
analyse1 <- function(model, data, loaded, nchains, niters, nthin, quiet, glance, parallel, seed, niters_warmup, ...) {
  UseMethod("analyse1")
}

analyse_data <- function(data, name = NULL, x, loaded, nchains, niters, nthin,
                         parallel, quiet, glance, seed, niters_warmup, ...) {
  check_no_sf(data)
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

#' @rdname analyse
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

#' @rdname analyse
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
  chk_whole_number(seed)
  chk_gt(seed, 0L)
  chk_character(stan_engine)
  chk_whole_number(niters_warmup)
  chk_range(niters_warmup, c(10L, 100000L))

  if (is.null(nthin)) nthin <- nthin(x)

  if (identical(stan_engine, "cmdstan-mcmc")) {
    class(x) <- c("cmdstan_model", "cmdstan_mcmc_model", class(x))
  } else if (identical(stan_engine, "cmdstan-pathfinder")) {
    class(x) <- c("cmdstan_model", "cmdstan_pathfinder_model", class(x))
  } else if (identical(stan_engine, "cmdstan-optimize")) {
    class(x) <- c("cmdstan_model", "cmdstan_optimize_model", class(x))
  } else if (identical(stan_engine, "cmdstan-laplace")) {
    class(x) <- c("cmdstan_model", "cmdstan_laplace_model", class(x))
  } else if (identical(stan_engine, "cmdstan-variational")) {
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

#' @rdname analyse
#' @usage NULL
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
