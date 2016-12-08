context("arrayize")

test_that("arrayize", {
  list <- list(a = 1:6, fac6 = factor(1:6), fac3 = factor(1:3), fac32 = rep(factor(1:3), 2),
               fac23 = rep(factor(1:2),3), fac16 = rep(factor(10),6))

  expect_identical(arrayize(list$a, list["fac6"]), c("1" = 1L, "2" = 2L, "3" = 3L, "4" = 4L, "5" = 5L, "6" = 6L))
  expect_error(arrayize(list$a, list["fac3"]), c("vector and factors must be the same lengths"))
  expect_error(arrayize(list$a, list[c("fac6","fac3")]), "factors must be the same length")
  expect_identical(arrayize(list$a, list[c("fac6","fac16")]), matrix(1:6, nrow = 6, dimnames = list(fac6 = 1:6, fac16 = 10)))
  expect_identical(arrayize(list$a, list[c("fac32","fac16", "fac23")]), array(as.integer(c(1,5,3,4,2,6)), dim = c(3,1,2), dimnames = list(fac32 = 1:3, fac16 = 10, fac23 = 1:2)))

  expect_identical(vectorize(arrayize(list$a, list[c("fac6")]), list[c("fac6")]),list$a)

  expect_identical(vectorize(arrayize(list$a, list[c("fac32","fac16", "fac23")]), list[c("fac32","fac16", "fac23")]),list$a)

  list <- as.data.frame(list)
  list <- list[order(list$fac23),,drop = FALSE]
  list <- as.list(list)
  expect_identical(arrayize(list$a, list[c("fac32","fac16", "fac23")]), array(as.integer(c(1,5,3,4,2,6)), dim = c(3,1,2), dimnames = list(fac32 = 1:3, fac16 = 10, fac23 = 1:2)))
  expect_identical(vectorize(arrayize(list$a, list[c("fac32","fac16", "fac23")]), list[c("fac32","fac16", "fac23")]),list$a)
  expect_identical(vectorize(arrayize(list$a, list[c("fac6")]), list[c("fac6")]),list$a)
})
