context("residuals")

test_that("lmb", {
  analysis <- analyse("weight ~ 1", data = datasets::chickwts, glance = FALSE, beep = FALSE)
  residuals <- residuals(analysis)
  expect_equal(mean(residuals$estimate), 0, tolerance = 10^-16)
  expect_equal(sd(residuals$estimate), 1, tolerance = 10^-2)
  expect_identical(length(analyses), 2L)
})


