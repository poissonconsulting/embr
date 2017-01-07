context("ic")

test_that("aicc", {
  expect_identical(aicc(6, -3.54), 19.08)
})
