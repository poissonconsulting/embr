#' @export
rhat.mb_analysis <- function(x, by = "all", as_df = FALSE, ...) {
  rhat(as.mcmcr(x), by = by, as_df = as_df)
}

#' @export
rhat.mb_null_analysis <- function(x, ...) return(Inf)

#' @export
rhat.mb_analyses <- function(x, by = "all", as_df = FALSE, ...) {
  rhat(as.mcmcrs(x), by = by, as_df = as_df)
}

#' @export
esr.mb_analysis <- function(x,  by = "all", as_df = FALSE,  ...) {
  esr(as.mcmcr(x), by = by, as_df = as_df)
}

#' @export
esr.mb_null_analysis <- function(x, ...) return(0)

#' @export
esr.mb_analyses <- function(x,  by = "all", as_df = FALSE,  ...) {
  esr(as.mcmcrs(x), by = by, as_df = as_df)
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
