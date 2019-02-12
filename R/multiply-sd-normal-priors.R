#' Multiply Standard Deviation of Normal Priors
#'
#' @param x The object.
#' @param multiplier A double vector of the values to multiply by.
#' @param ... Not used.
#' @return The updated object.
#' @export
multiply_sd_normal_priors <- function(x, multiplier = 2, ...) {
  UseMethod("multiply_sd_normal_priors")
}

#' @export
multiply_sd_normal_priors.mb_model <- function(x, multiplier = 2, ...) {
  check_scalar(multiplier, c(0.1, 10))

  x$code <- multiply_sd_normal_priors(x$code, multiplier = multiplier)
  x
}

#' @export
multiply_sd_normal_priors.mb_analysis <- function(x, multiplier = 2,
                                                  parallel = getOption("mb.parallel", FALSE),
                                                  quiet = getOption("mb.quiet", TRUE),
                                                  glance = getOption("mb.glance", TRUE),
                                                  beep = getOption("mb.beep", TRUE),
                                                  ...) {
  check_scalar(multiplier, c(0.1, 10))
  check_unused(...)

  model <- model(x)

  model <- multiply_sd_normal_priors(model, multiplier = multiplier)

  x2 <- analyse(model, data = data_set(x),
                      nchains = nchains(x),
                      niters = niters(x),
                      nthin = nthin(x),
                      parallel = parallel,
                      quiet = quiet, glance = glance, beep = beep)

  analyses <- analyses(x, x2)
  names(analyses) <- c("original", paste0("sdnpsx", multiplier))
  analyses
}
