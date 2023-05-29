edit_residuals_code <- function(x, type = NULL, simulate = NULL) {
  pattern <- "(residual\\s*(\\[[^\\]\\}\n;]+\\]){0,1}\\s*<-\\s*res_[[:alnum:]_]+\\s*\\()"
  replacement <- "\\1"
  if(!is.null(type)) {
    replacement <- paste0(replacement, "type = '", type, "', ")
  }
  if(!is.null(simulate)) {
    replacement <- paste0(replacement, "simulate = ", simulate, ", ")
  }
  stringr::str_replace_all(x, pattern, replacement)
}

#' Simulate Residuals
#'
#' Requires that new_expr includes `residual <- res_bern(`
#' or `residual[i] <- res_norm(`.
#'
#' @param x The MB analysis object.
#' @inheritParams params
#' @return An mcmc_data of the simulated residuals.
#' @seealso extras::res_binom
#' @export
simulate_residuals <- function(x, type = NULL) {
  chk_s3_class(x, "mb_analysis")
  chk_null_or(type, vld = vld_string)

  new_expr <- new_expr(x)
  # FIXME
  chk_string(new_expr, "new_expr(x)")

  pattern <- "(residual\\s*(\\[[^\\]\\}\n;]+\\]){0,1}\\s*<-\\s*res_[[:alnum:]_]+\\s*\\()"
  if(!stringr::str_detect(new_expr, pattern)) {
    err("`new_expr` must include `residual <- res_xxx(` or `residual[i] <- res_xxx(`.")
  }

  new_expr <- edit_residuals_code(new_expr, type = type, simulate = TRUE)

  mcmc_derive_data(x, new_expr = new_expr, term = "^residual$")
}
