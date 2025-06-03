# Copied from priorsense package on June 2, 2025
# https://github.com/n-kall/priorsense/blob/c482f522d399dcc23cdee541c2e96098f044aef9/R/helpers.R#L14
#' row sums for draws objects
#' @param x draws object
#' @return draws object with rows summed
#' @keywords internal
#' @noRd
rowsums_draws <- function(x) {
  posterior::draws_array(
    sum = rowSums(
      posterior::as_draws_array(x),
      dims = 2
    ),
    .nchains = posterior::nchains(x)
  )
}
