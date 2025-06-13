#' Analyse Models
#'
#' Generic function for performing Bayesian analysis on models using Stan or JAGS,
#' or maximum likelihood analysis using TMB.
#'
#' @param x The object to analyse.
#' @param ... Additional arguments passed to methods.
#'
#' @return An analysis object (type depends on input and engine used).
#'
#' @seealso
#' \itemize{
#'   \item \code{\link{analyse.mb_model}} for single model analysis (Stan/JAGS)
#'   \item \code{\link{analyse.mb_models}} for multiple model analysis (Stan/JAGS)
#'   \item \code{\link{analyse.character}} for character model analysis (Stan/JAGS)
#' }
#'
#' @export
analyse <- function(x, ...) {
  UseMethod("analyse")
}

#' Analyse
#'
#' @param model The mb_model to analyse.
#' @param data The data.
#' @param loaded The loaded model.
#' @param nchains chains.
#' @param niters iters
#' @param nthin thin
#' @param quiet quiet
#' @param glance glance
#' @param parallel parallel
#' @param ...  Additional arguments.
#' @export
analyse1 <- function(model, data, loaded, nchains, niters, nthin, quiet, glance, parallel, ...) {
  UseMethod("analyse1")
}

analyse_data <- function(data, name = NULL, x, loaded, nchains, niters, nthin,
                         parallel, quiet, glance, ...) {
  if (!is.null(name) & glance) cat("Data:", name, "\n")
  analyse1(x, data,
           loaded = loaded, nchains = nchains, niters = niters,
           nthin = nthin, parallel = parallel, quiet = quiet, glance = glance, ...
  )
}


analyse_model <- function(x, name = NULL, data, parallel, nchains, niters, nthin, quiet, glance, beep, stan_engine, ...) {
  if (!is.null(name) & glance) cat("Model:", name, "\n")
  analyse(x,
          data = data, parallel = parallel,
          nchains = nchains, niters = niters, nthin = nthin,
          quiet = quiet, glance = glance, beep = beep, stan_engine, ...
  )
}

#' Analyse Character Model
#'
#' Analyses a model defined as a character string containing Stan or JAGS code.
#' The character string is first converted to an mb_model object, then passed on to \code{\link{analyse.mb_model}}
#'
#' @param x A character string containing Stan or JAGS model code.
#' @param data The data frame to analyse.
#' @param select_data A named list specifying the columns to select and their
#'   associated classes and values as well as transformations and scaling options.
#' @param nchains A count of the number of chains (default: 3).
#' @param niters A count of the number of simulations to save per chain (default: 1000).
#' @param nthin A count of the thinning interval (default: 1).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @inheritParams params
#' @param ...  Additional arguments passed to the underlying sampling function.
#'   See \code{\link{analyse.mb_model}} for details.
#'
#' @return An mb_analysis object containing the fitted model results.
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
                              stan_engine = getOption("mb.stan_engine", character(0)),
                              ...) {
  x <- model(x, select_data = select_data)
  analyse(x,
          data = data,
          parallel = parallel, nchains = nchains, niters = niters, nthin = nthin, quiet = quiet,
          glance = glance, beep = beep, stan_engine = stan_engine, ...
  )
}

#' Analyse Single Model
#'
#' Performs Bayesian analysis on a single mb_model object using Stan or JAGS.
#'
#' @param x An mb_model object to analyse.
#' @param data The data frame to analyse, or a list of data frames for multiple datasets.
#' @param nchains A count of the number of chains (default: 3).
#' @param niters A count of the number of simulations to save per chain (default: 1000).
#' @param nthin A count of the thinning interval.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Additional arguments passed to the underlying sampling function:
#'   \itemize{
#'     \item \strong{For Stan models with cmdstanr} (\code{stan_engine = "cmdstan-mcmc"}):
#'           Arguments passed to \code{\link[cmdstanr]{sample}}
#'     \item \strong{For Stan models with rstan} (default):
#'           Arguments passed to \code{\link[rstan]{sampling}}
#'   }
#' @inheritParams params
#' @return
#' \itemize{
#'   \item If \code{data} is a data.frame: An mb_analysis object
#'   \item If \code{data} is a list of data.frames: An mb_meta_analysis object
#' }
#'
#' @examples
#' \dontrun{
#' # Stan model with RStan (default)
#' analysis <- analyse(stan_model, data, nchains = 4, niters = 2000)
#'
#' # Stan model with CmdStanR MCMC
#' analysis <- analyse(stan_model, data,
#'                     stan_engine = "cmdstan-mcmc",
#'                     nchains = 4, niters = 2000)
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
#' \itemize{
#'   \item \code{\link[cmdstanr]{sample}} for CmdStanR sampling options
#'   \item \code{\link[rstan]{sampling}} for RStan sampling options
#'   \item \code{\link{analyse.mb_models}} for analysing multiple models
#' }
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
                             stan_engine = getOption("mb.stan_engine", character(0)),
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
  }

  loaded <- load_model(x, quiet)

  if (is.data.frame(data)) {
    return(analyse_data(
      data = data, x = x, loaded = loaded,
      nchains = nchains, niters = niters, nthin = nthin,
      parallel = parallel, quiet = quiet, glance = glance, ...
    ))
  }

  names <- names(data)
  if (is.null(names)) {
    names(data) <- 1:length(x)
  }

  analyses <- purrr::imap(data, analyse_data,
                          x = x, loaded = loaded,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance
  )

  names(data) <- names

  class(analyses) <- "mb_meta_analysis"
  analyses
}

#' Analyse
#'
#' @param x An object inheriting from class mb_model or a list of such objects.
#' @param data The data frame to analyse.
#' @param nchains A count of the number of chains.
#' @param niters A count of the number of simulations to save per chain.
#' @param nthin A count of the thining interval or NULL (in which case taken from model).
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param glance A flag indicating whether to print a model summary.
#' @param beep A flag indicating whether to beep on completion of the analysis.
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
                              stan_engine = getOption("mb.stan_engine", character(0)),
                              ...) {
  chk_flag(beep)
  if (beep) on.exit(beepr::beep())

  names <- names(x)
  if (is.null(names)) names(x) <- 1:length(x)

  analyses <- purrr::imap(x, analyse_model,
                          data = data,
                          nchains = nchains, niters = niters, nthin = nthin,
                          parallel = parallel, quiet = quiet, glance = glance, beep = FALSE,
                          stan_engine = stan_engine, ...
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
