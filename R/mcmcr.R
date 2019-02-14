#' @export
rhat.mb_analysis <- function(x, by = "all", param_type = "all", as_df = FALSE,
                             folded = NA, normalized = TRUE, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)
  parameters <- parameters(x, param_type)

  x <- as.mcmcr(x)
  x <- subset(x, parameters = parameters)

  rhat(x, by = by, as_df = as_df, folded = folded, normalized = normalized)
}

#' @export
rhat.mb_null_analysis <- function(x, ...) Inf

#' @export
rhat.mb_analyses <- function(x, by = "all", param_type = "all", as_df = FALSE,
                             folded = NA, normalized = TRUE,
                             bound = FALSE,  ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)

  parameters <- parameters(x[[1]], param_type)

  x <- as.mcmcrs(x)
  x <- subset(x, parameters = parameters)

  rhat(x, by = by, as_df = as_df, bound = bound, folded = folded, normalized = normalized)
}

#' @export
esr.mb_analysis <- function(x,  by = "all", as_df = FALSE, param_type = "all", ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)
  parameters <- parameters(x, param_type)

  x <- as.mcmcr(x)
  x <- subset(x, parameters = parameters)

  esr(x, by = by, as_df = as_df)
}

#' @export
esr.mb_null_analysis <- function(x, ...) 0

#' @export
esr.mb_analyses <- function(x,  by = "all", as_df = FALSE, param_type = "all", ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)

  parameters <- parameters(x[[1]], param_type)

  x <- as.mcmcrs(x)
  x <- subset(x, parameters = parameters)

  esr(x, by = by, as_df = as_df)
}

#' @export
converged.mb_analysis <- function(x, rhat = 1.1, esr = 0.33, by = "all",
                                  param_type = "all", as_df = FALSE,
                                  folded = NA, normalized = TRUE, ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)

  parameters <- parameters(x, param_type)

  x <- as.mcmcr(x)
  x <- subset(x, parameters = parameters)

  converged(x, rhat = rhat, esr = esr, by = by, as_df = as_df,
            folded = folded, normalized = normalized)
}

#' @export
converged.mb_null_analysis <- function(x, ...) FALSE

#' @export
converged.mb_analyses <- function(x, rhat = 1.1, esr = 0.33, by = "all",
                                  param_type = "all", as_df = FALSE,
                                  bound = FALSE, folded = NA, normalized = TRUE,
                                  ...) {
  check_scalar(param_type, c("fixed", "random", "derived", "primary", "all"))
  check_unused(...)

  parameters <- parameters(x[[1]], param_type)

  x <- as.mcmcrs(x)
  x <- subset(x, parameters = parameters)

  converged(x, rhat = rhat, esr = esr, by = by, as_df = as_df, bound = bound,
            folded = folded, normalized = normalized)
}

#' @export
nchains.mb_analysis <- function(x, ...) {
  check_unused(...)
  if (is.mb_null_analysis(x)) return(0L)
  nchains(as.mcmcr(x))
}

#' @export
niters.mb_analysis <- function(x, ...) {
  check_unused(...)
  niters(as.mcmcr(x))
}
