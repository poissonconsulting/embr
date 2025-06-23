#' @export
priorsense::log_prior_draws

#' Extract log prior draws
#'
#' Extract log likelihood from fitted model and return as a draws
#' object. Adapted from the `priorsense` package.
#'
#' @param x The mb_analysis object.
#' @param joint A flag indicating whether to return the joint log
#'   likelihood or array, default is FALSE.
#' @param log_lik_prior A string of the name of the parameter corresponding to
#'   the log prior, default is "lprior".
#' @param ... Unused.
#'
#' @return A draws_array object containing log_prior values.
#' @export
#'
log_prior_draws.mb_analysis <- function(x, joint = FALSE, log_prior_name = "lprior", ...) {
  if (!is.mb_analysis(x)) {
    stop("Not an mb_analysis object.", call. = FALSE)
  }

  chk::chk_flag(joint)
  chk::chk_character(log_prior_name)
  chk::chk_unused(...)

  def_new_expr <- any(stringr::str_detect(as.character(x$model$new_expr), log_prior_name))
  def_model <- any(stringr::str_detect(pars(x), log_prior_name))

  if (def_new_expr & def_model) {
    warning("`lprior` is defined both as a parameter within the model and in the new expression. Change `lprior` in the new expression to `elprior`, and supply `log_prior_name = 'elprior'` to the function.")
  }

  if (def_new_expr) {
    log_prior <- posterior::as_draws_array(as.mcmc.list(mcmc_derive(x, term = log_prior_name, parallel = FALSE)))
  } else if (def_model) {
    log_prior <- posterior::subset_draws(
      posterior::as_draws_array(as.mcmc.list(x$mcmcr)),
      variable = paste0("^", log_prior_name),
      regex = TRUE
    )
  } else {
    err(
      "There is no log prior parameter monitored by the model or present in the new expression.",
      tidy = FALSE
    )
  }

  if (joint) {
    log_prior <- rowsums_draws(log_prior)
    posterior::variables(log_prior) <- log_prior_name
  }

  return(log_prior)
}
