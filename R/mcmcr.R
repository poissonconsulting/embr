#' @export
rhat.mb_analysis <- function(x, by = "all", ...) {
  rhat(as.mcmcr(x), by = by)
}

#' @export
rhat.mb_analyses <- function(x, by = "all", ...) {
  rhat(as.mcmcrs(x), by = by)
}

#' @export
esr.mb_analysis <- function(x,  by = "all",  ...) {
  esr(as.mcmcr(x), by = by)
}

#' @export
esr.mb_analyses <- function(x,  by = "all",  ...) {
  esr(as.mcmcrs(x), by = by)
}

#' @export
ess.mb_analysis <- function(x,  by = "all", ...) {
  ess(as.mcmcr(x), by = by)
}

#' @export
ess.mb_analyses <- function(x,  by = "all", ...) {
  ess(as.mcmcrs(x), by = by)
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
converged.mb_analysis <- function(x, by = "all", rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  converged(as.mcmcr(x), by = by, rhat = rhat, esr = esr)
}

#' @export
converged.mb_analyses <- function(x, by = "all", rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  converged(as.mcmcrs(x), by = by, rhat = rhat, esr = esr)
}

#' @export
converged.mb_null_analysis <- function(x, ...) FALSE
