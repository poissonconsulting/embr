#' @export
analyse.pmb_model <- function(
    x,
    data,
    ...,
    engine = NULL) {

  # FIXME: Generic translation
  if (identical(engine, "jags")) {
    x$code <- translate_jmbr(x$code)
    x <- new_mb_model(x, class(x$code))
  } else {
    err('Must specify `engine = "jags"` for analysing engine-agnostic code')
  }

  analyse(x, data, ...)
}
