#' Duration
#'
#' @inheritParams lubridate::duration
#' @seealso \code{\link[lubridate]{duration}}.
#' @export
duration <- function(num = NULL, units = "seconds", ...) {
  lubridate::duration(num = num, units = units, ...)
}
