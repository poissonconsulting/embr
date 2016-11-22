context("drops")

test_that("eliminate", {
  expect_equal(eliminate(1:3, 2), c(1,3))
  expect_equal(eliminate(c(2,1:3,2,2), 2), c(1,3))
  expect_equal(eliminate(c(2,1:3,2,2), c(1,3)), rep(2L,4))
})

test_that("not_last", {
  expect_identical(not_last(1:3), 1:2)
  expect_identical(not_last(1), numeric(0))
  expect_identical(not_last(numeric(0)), numeric(0))
})

test_that("possible_drop", {
  expect_identical(possible_drop(list()), character(0))
  expect_identical(possible_drop(list("1")), "1")
  expect_identical(possible_drop(list("2", "1")), sort(c("1", "2")))
  expect_identical(possible_drop(list("2", c("1","3"))), sort(c("2", "3")))
})

test_that("impossible_drop", {
  expect_identical(impossible_drop(list()), character(0))
  expect_identical(impossible_drop(list("1")), character(0))
  expect_identical(impossible_drop(list("2", "1")), character(0))
  expect_identical(impossible_drop(list("2", c("1","3"))), "1")
  expect_identical(impossible_drop(list(c("1","2"), c("1","3"))), "1")
})

test_that("eliminate_drop", {
  expect_identical(eliminate_drop(list("1"), "1"), list())
  expect_identical(eliminate_drop(list("1"), character(0)), list("1"))
  expect_identical(eliminate_drop(list("1", c("2", "3")), "1") ,list(c("2", "3")))
  expect_identical(eliminate_drop(list("1", c("2", "3")), c("1", "2")) ,list("3"))
  expect_identical(eliminate_drop(list(c("1","2"), c("1","3")), "1"),list("2", "3"))
})

test_that("make_all_drops", {
  expect_identical(make_all_drops(list()), list("-" = character(0)))
  expect_identical(make_all_drops(list("1")), list("-" = character(0), "-1" = "1"))
  expect_identical(make_all_drops(list("1", "2")), list("-" = character(0), "-1" = "1", "-2" = "2", "-1-2" = c("1", "2")))
  expect_identical(make_all_drops(list("2", "1")), list("-" = character(0), "-1" = "1", "-2" = "2", "-1-2" = c("1", "2")))
  expect_identical(length(make_all_drops(list("1", "2", "3"))), 8L)
  expect_identical(make_all_drops(list(c("2", "1", "3"))), list("-" = character(0), "-3" = "3", "-1-3" = c("1", "3"), "-1-2-3" = c("1", "2", "3")))
  expect_identical(make_all_drops(list("1", c("2", "3"))), list("-" = character(0), "-1" = "1", "-3" = "3", "-1-3" = c("1", "3"), "-2-3" = c("2", "3"), "-1-2-3" = c("1", "2", "3")))
})
