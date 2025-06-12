#' @export
priorsense::log_lik_draws

#' Extract log likelihood draws
#'
#' Extract log likelihood from fitted model and return as a draws
#' object. Adapted from the `priorsense` package.
#'
#' @param x The MB analysis object
#' @param joint Logical indicating whether to return the joint log
#'   likelihood or array. Default is FALSE.
#' @param log_lik_name Name of parameter corresponding to log likelihood,
#'   default is "log_lik".
#' @param ... Arguments passed to individual methods.
#'
#' @returns A draws_array object containing log_lik values.
#' @export
#'
log_lik_draws.mb_analysis <- function(x, joint = FALSE, log_lik_name = "log_lik", ...) {
  if (!is.mb_analysis(x))
    stop("Not an mb_analysis object.", call. = FALSE)

  chk::chk_flag(joint)
  chk::chk_character(log_lik_name)

  def_new_expr <- any(stringr::str_detect(as.character(x$model$new_expr), log_lik_name))
  def_model <- any(stringr::str_detect(pars(x), log_lik_name))

  if (def_new_expr & def_model) {
    warning("`log_lik` is defined as a parameter within the model and in the new expression; the definition in the new expression will take precedence.")
  }

  if (def_new_expr) {
    log_lik <- posterior::as_draws_array(as.mcmc.list(mcmc_derive(x, term = log_lik_name, parallel = FALSE)))
  } else if (def_model) {
    log_lik <- posterior::subset_draws(
      posterior::as_draws_array(as.mcmc.list(x$mcmcr)),
      variable = paste0("^", log_lik_name),
      regex = TRUE
    )
  } else {
    stop("There is no log likelihood parameter monitored by the model or present in the new expression.")
  }

  if (joint) {
    log_lik <- rowsums_draws(log_lik)
    posterior::variables(log_lik) <- log_lik_name
  }

  return(log_lik)
}
