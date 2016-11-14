context("sample-size")

test_that("sample_size", {
  expect_identical(sample_size(data.frame(x = 2:4)), 3L)
})
