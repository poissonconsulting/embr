#' @export
rhat.mb_analysis <- function(x, by = "all", as_df = FALSE, ...) {
  rhat(as.mcmcr(x), by = by, as_df = as_df)
}

#' @export
rhat.mb_null_analysis <- function(x, ...) return(Inf)

#' @export
rhat.mb_analyses <- function(x, by = "all", as_df = FALSE, bound = FALSE, ...) {
  check_unused(...)
  rhat(as.mcmcrs(x), by = by, as_df = as_df, bound = bound)
}

#' @export
esr.mb_analysis <- function(x,  by = "all", as_df = FALSE,  ...) {
  esr(as.mcmcr(x), by = by, as_df = as_df)
}

#' @export
esr.mb_null_analysis <- function(x, ...) return(0)

#' @export
esr.mb_analyses <- function(x,  by = "all", as_df = FALSE, bound = FALSE, ...) {
  check_unused(...)
  esr(as.mcmcrs(x), by = by, as_df = as_df, bound = bound)
}

#' @export
converged.mb_analyses <- function(x,  by = "all", as_df = FALSE, bound = FALSE, ...) {
  check_unused(...)
  converged(as.mcmcrs(x), by = by, as_df = as_df, bound = bound)
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
