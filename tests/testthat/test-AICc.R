context("maicc")

test_that("maicc", {
  expect_identical(AICc(-3.54, K = 6), 19.08)
})
