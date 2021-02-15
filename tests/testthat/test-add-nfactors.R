test_that("add_nfactors", {
  expect_identical(names(add_nfactors(list(x = factor(1)))), c("x", "nx"))
  expect_identical(names(add_nfactors(list(x = factor(1), y = 1))), c("x", "y", "nx"))
  expect_identical(names(add_nfactors(list(x = factor(1), y = factor(1:2)))), c("x", "y", "nx", "ny"))
  expect_identical(add_nfactors(list(x = factor(1), y = factor(1:2)))$nx, 1L)
  expect_identical(add_nfactors(list(x = factor(1), Y = factor(1:2)))$nY, 2L)
  expect_error(add_nfactors(list(x = factor(1), nx = factor(1:2))), "nFactor names are reserved")
})
