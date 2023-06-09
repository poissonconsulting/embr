test_that("edit_residuals_code", {
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
  expect_snapshot(error = TRUE, {
    edit_residuals_code("boo[i] <- res_bern(x)")
  })
})
