#' Multiply Standard Deviation of Priors By
#'
#' @param x The object.
#' @param by A double scalar of the multiplier.
#' @param distributions A character vector of the distributions to adjust.
#' Possible values are "laplace" (double exponential), "logistic", "lognormal", "normal", "t" and "nt" (non-central Student t).
#' @inheritParams analyse.mb_model
#' @param ... Not used.
#' @return The updated object.
#' @export
sd_priors_by <- function(x, by = 10, distributions = c("normal", "lognormal", "t"), ...) {
  UseMethod("sd_priors_by")
}

#' @describeIn sd_priors_by Multiply Standard Deviation of Priors for an MB model
#' @export
sd_priors_by.mb_model <- function(x, by = 10, distributions = c("normal", "lognormal", "t"), ...) {
  chk_number(by)
  chk_range(by, c(0.001, 1000))
  chk_unused(...)

  x$code <- sd_priors_by(x$code, by = by, distributions = distributions)
  x
}

#' @describeIn sd_priors_by Multiply Standard Deviation of Priors for an MB analysis
#' @export
sd_priors_by.mb_analysis <- function(x, by = 10, distributions = c("normal", "lognormal", "t"),
                                     parallel = getOption("mb.parallel", FALSE),
                                     quiet = getOption("mb.quiet", TRUE),
                                     glance = getOption("mb.glance", TRUE),
                                     beep = getOption("mb.beep", TRUE),
                                     ...) {
  chk_unused(...)

  analyse(sd_priors_by(model(x), by = by, distributions = distributions),
    data = data_set(x),
    nchains = nchains(x),
    niters = niters(x),
    nthin = nthin(x),
    parallel = parallel,
    quiet = quiet, glance = glance, beep = beep
  )
}
