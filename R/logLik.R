#' Log-Likelihood
#'
#' Log-Likelihood for a MB analysis.
#'
#' @param object The mb_analysis object.
#' @param ... unused.
#' @export
logLik.mb_analysis <- function(object, ...) {
  if (!is.null(object$logLik)) return(object$logLik)
  NA_real_
}

#' Log-Likelihood
#'
#' Log-Likelihood for a MB NULL analysis.
#'
#' @param object The mb_analysis object.
#' @param ... unused.
#' @export
logLik.mb_null_analysis <- function(object, ...) {
  -Inf
}

#' Log-Likelihood
#'
#' Log-Likelihood for a LM analysis.
#'
#' @param object The lm_analysis object.
#' @param ... unused.
#' @export
logLik.lmb_analysis <- function(object, ...) {
  logLik <- logLik(object$lm)
  as.numeric(logLik)
}
