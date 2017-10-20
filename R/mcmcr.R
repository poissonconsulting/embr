#' @export
rhat.mb_analysis <- function(x, by = "all", ...) {
  rhat(as.mcmcr(x), by = by)
}

#' @export
rhat.mb_analyses <- function(x, by = "all", ...) {
  rhat(as.mcmcrs(x), by = by)
}

#' @export
esr.mb_analysis <- function(x, ...) {
  esr(as.mcmcr(x))
}

#' @export
esr.mb_analyses <- function(x, ...) {
  esr(as.mcmcrs(x))
}

#' @export
ess.mb_analysis <- function(x, ...) {
  ess(as.mcmcr(x))
}

#' @export
ess.mb_analyses <- function(x, ...) {
  ess(as.mcmcrs(x))
}

#' @export
nchains.mb_analysis <- function(x, ...) {
  if (is.mb_null_analysis(x)) return(0L)
  nchains(as.mcmcr(x))
}

#' @export
niters.mb_analysis <- function(x, ...) {
  niters(as.mcmcr(x))
}

#' @export
converged.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  x %<>% as.mcmcr(x)
  if (nchains(x) < 2L) return(NA)
  converged(x, rhat = rhat, esr = esr)
}

#' @export
converged.mb_analyses <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  all(vapply(x, converged, TRUE, rhat = rhat, esr = esr))
}

#' @export
converged.mb_null_analysis <- function(x, ...) FALSE
