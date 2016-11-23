context("numericize")

test_that("days_since_2000", {
  expect_identical(days_since_2000(as.Date("2000-01-01")), 1L)
  expect_identical(days_since_2000(as.Date(c("1999-12-30", "2000-01-01"))), c(-1L, 1L))
  expect_identical(days_since_2000(as.Date("2000-02-01")), 32L)
})

test_that("numericize_dates", {
  expect_identical(numericize_dates(list(Dayte = as.Date("2000-01-01"))), list(Dayte = 1L))
  expect_identical(numericize_dates(list(Dayte = as.Date(c("1999-12-30", "2000-01-01")))), list(Dayte = c(-1L,1L)))
})

test_that("numericize_logicals", {
  expect_identical(numericize_logicals(list(Dayte = TRUE)), list(Dayte = 1L))
  expect_identical(numericize_logicals(list(Dayte = c(TRUE, FALSE, NA))), list(Dayte = c(1L,0L,NA)))
})

