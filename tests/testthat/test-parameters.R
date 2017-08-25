context("parameters")

test_that("parameters", {

  new_expr = " fit2 <- a + b * x # c
                    fit <- a + b * x + bYear[Year]
                     residual <- y - fit
                     prediction <- fit"

  expect_identical(parameters(rm_comments(new_expr)), sort(c("a", "b", "bYear", "fit", "fit2", "prediction",
                         "residual", "x", "y", "Year")))

  expect_identical(nparams(new_expr), 11L)
  expect_identical(parameters(c("b", "a")), sort(c("a", "b")))
  expect_identical(parameters(""), character(0))
})
