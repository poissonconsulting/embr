test_that("dims", {
  expect_identical(dims(integer()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(1:2), 2L)
  expect_identical(dims(matrix(1:2)), c(2L:1L))
})
