context("utils")

test_that("all_first_level", {
  expect_error(all_first_level(1))
  expect_identical(all_first_level(factor(character(0), levels = c("A", "B"))),
                   factor(character(0), levels = c("A", "B")))
  expect_identical(all_first_level(factor("A", levels = c("A", "B"))),
                   factor("A", levels = c("A", "B")))
  expect_identical(all_first_level(factor("B", levels = c("A", "B"))),
                   factor("A", levels = c("A", "B")))
  expect_identical(all_first_level(factor(c("B", "A", "B"), levels = c("A", "B"))),
                   factor(c("A", "A", "A"), levels = c("A", "B")))
})

test_that("dims", {
  expect_identical(dims(integer()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(1:2), 2L)
  expect_identical(dims(matrix(1:2)), c(2L:1L))
  expect_identical(dims(factor()), 0L)
  expect_identical(dims(factor(c(0,NA))), 2L)
})

test_that("dims", {
  expect_identical(dims(integer()), 0L)
  expect_identical(dims(1), 1L)
  expect_identical(dims(1:2), 2L)
  expect_identical(dims(matrix(1:2)), c(2L:1L))
  expect_identical(dims(factor()), 0L)
  expect_identical(dims(factor(c(0,NA))), 2L)
})

test_that("response_lm", {
  expect_identical(response_lm(" x ~ y "), "x")
  expect_identical(response_lm(" x / y ~ y "), "x/y")
  expect_identical(response_lm("log( c ) ~ y "), "log(c)")
})

test_that("indexes", {
  expect_identical(indexes(c("a", "b", "bYear[1,1]", "bYear[1,2,4,1]")), c("", "", "[1,1]", "[1,2,4,1]"))
  expect_identical(indexes(c("bIntercept[i]")), "[i]")
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

test_that("syntactic", {
  expect_identical(is.syntactic(c("0", "x", "1x","x y", "x1")), c(FALSE, TRUE, FALSE, FALSE, TRUE))
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

test_that("model_names", {
  expect_identical(model_names(list(character(0)), list("1")), "full")
  expect_identical(model_names(list(character(0), "a"), list("a")), c("full", "base"))
  expect_identical(model_names(list(character(0), "a"), list(c("a", "b"))), c("full", "base+b"))
  expect_identical(model_names(list(character(0), "a"), list(c("b", "a"))), c("full", "base+b"))
  expect_identical(model_names(list("b", "a"), list(c("b", "a"))), c("base+a", "base+b"))
  expect_identical(model_names(list("a", "b"), list(c("b", "a"))), c("base+b", "base+a"))
  expect_identical(model_names(list("a", character(0), c("b","a")), list("a", "b")), c("base+b", "full", "base"))
  expect_error(model_names(list(character(0), "a"), list()))
})
