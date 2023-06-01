test_that("simulate_residuals", {
  expect_identical(
    edit_residuals_code("residual <- res_bern(x)"),
    parse_expr("residual <- res_bern(x)")
  )
  expect_identical(
    edit_residuals_code("residual <- res_bern(x)", type = "dev"),
    parse_expr("residual <- res_bern(type = 'dev', x)")
  )
  expect_identical(
    edit_residuals_code("residual[i] <- res_bern(x)", simulate = TRUE),
    parse_expr("residual[i] <- res_bern(simulate = TRUE, x)")
  )
  expect_identical(
    edit_residuals_code("residual[i] <- res_bern(x)", type = "data", simulate = TRUE),
    parse_expr("residual[i] <- res_bern(type = 'data', simulate = TRUE, x)")
  )
})
