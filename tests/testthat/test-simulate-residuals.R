test_that("simulate_residuals", {
  local_edition(3)

  expect_snapshot({
    edit_residuals_code("residual <- res_bern(x)")
  })
  expect_snapshot({
    edit_residuals_code("residual <- res_bern(x)", type = "dev")
  })
  expect_snapshot({
    edit_residuals_code("residual[i] <- res_bern(x)", simulate = TRUE)
  })
  expect_snapshot({
    edit_residuals_code("residual[i] <- res_bern(x)", type = "data", simulate = TRUE)
  })
})
