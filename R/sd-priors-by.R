#' Multiply Standard Deviation of Priors By
#'
#' @param x The object.
#' @param by A double scalar of the multiplier.
#' @inheritParams analyse.mb_model
#' @param ... Not used.
#' @return The updated object.
#' @export
sd_priors_by <- function(x, by = 10, ...) {
  UseMethod("sd_priors_by")
}

#' @describeIn sd_priors_by Multiply Standard Deviation of Priors for an MB model
#' @export
sd_priors_by.mb_model <- function(x, by = 10, ...) {
  check_scalar(by, c(0.001, 1000))
  check_unused(...)

  x$code <- sd_priors_by(x$code, by = by)
  x
}

#' @describeIn sd_priors_by Multiply Standard Deviation of Priors for an MB analysis
#' @export
sd_priors_by.mb_analysis <- function(x, by = 10,
                                  parallel = getOption("mb.parallel", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  glance = getOption("mb.glance", TRUE),
                                  beep = getOption("mb.beep", TRUE),
                                  ...) {
  check_unused(...)

  analyse(sd_priors_by(model(x), by = by),
          data = data_set(x),
          nchains = nchains(x),
          niters = niters(x),
          nthin = nthin(x),
          parallel = parallel,
          quiet = quiet, glance = glance, beep = beep)
}
