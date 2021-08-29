#' Simulate Residuals
#'
#' Requires that new_expr includes code like `residual <- res_bern(`
#' or `residual[i] <- res_norm(` without the `simulate` argument.
#'
#' @param x The MB analysis object.
#' @return An mcmc_data of the simulated residuals.
#' @export
simulate_residuals <- function(x) {
  chk_s3_class(x, "mb_analysis")
  chk_string(new_expr(x))
  new_expr <- new_expr(x)

  res_reg <- "(residual\\s*(\\[[^\\]\\}\n;]+\\]){0,1}\\s*<-\\s*res_[[:alnum:]_]+\\s*\\()(?![^;\n\\}]*simulate)"
  if(!stringr::str_detect(new_expr, res_reg)) {
    err("`new_expr` must include `residual <- res_xxx(` without reference to simulate argument.", tidy = FALSE)
  }

  new_expr <- stringr::str_replace_all(new_expr, res_reg, "\\1simulate = TRUE, ")
  mcmc_derive_data(x, new_expr = new_expr, term = "^residual$")
}
