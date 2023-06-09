test_that("edit_residuals_code", {
  local_edition(3)

  expect_snapshot({
    edit_residuals_code(rlang::expr(residual <- res_bern(x)))
  })
  expect_snapshot({
    edit_residuals_code(rlang::expr(residual <- res_bern(x)), type = "dev")
  })
  expect_snapshot({
    edit_residuals_code(rlang::expr(residual[i] <- res_bern(x)), simulate = TRUE)
  })
  expect_snapshot({
    edit_residuals_code(rlang::expr(residual[i] <- res_bern(x)), type = "data", simulate = TRUE)
  })
  expect_snapshot({
    edit_residuals_code(
      rlang::expr({
        foo <- bar
        residual <- res_bern(x)
      }),
      type = "data",
      simulate = TRUE
    )
  })
  expect_snapshot(error = TRUE, {
    edit_residuals_code("boo[i] <- res_bern(x)")
  })
})
