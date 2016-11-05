context("utils")

test_that("dims", {
  expect_identical(dims(integer()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(1:2), 2L)
  expect_identical(dims(matrix(1:2)), c(2L:1L))
})

test_that("indexes", {
  expect_identical(indexes(c("a", "b", "bYear[1,1]", "bYear[1,2,4,1]")), c("", "", "[1,1]", "[1,2,4,1]"))
})

test_that("replace latex", {
  term <- c("a", "b", paste0("c", c("[1,1]", "[2,1,44]")))
  expect_identical(replace_latex(term, c(a = "\\alpha", b = "\\beta_{\\lambda}", c = "\\beta Y")),
                   c("\\alpha", "\\beta_{\\lambda}", "\\beta Y_{1,1}", "\\beta Y_{2,1,44}"))
})

test_that("is_nlist", {
  expect_false(is_nlist(1))
  expect_true(is_nlist(list()))
  expect_false(is_nlist(c(x = 1)))
  expect_true(is_nlist(list(x = 1)))
  expect_false(is_nlist(list(1)))
  expect_true(is_nlist(list(x = c(1,2))))
  expect_false(is_nlist(list(x = list(1,2))))
  expect_false(is_nlist(list(x = list(y = 2))))
})

test_that("sort_nlist", {
  expect_identical(sort_nlist(list()), list())
  expect_identical(sort_nlist(list(y = 2, x = 1, a = 10)), list(a = 10, x = 1, y = 2))
})

test_that("scalar_nlist", {
  expect_identical(scalar_nlist(list()), list())
  expect_identical(scalar_nlist(list(y = 2, x = 1, a = 10)), list(y = 2, x = 1, a = 10))
  expect_identical(scalar_nlist(list(y = 1:2, x = 1, a = c(3,10))), list(x = 1))
})
