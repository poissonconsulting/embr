context("maicc")

test_that("maicc", {
  expect_identical(mAICc(-3.54, nterms = 6), 19.08)
})
