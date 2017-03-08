context("parameters")

test_that("parameters", {

  new_expr = " fit2 <- a + b * x
                    fit <- a + b * x + bYear[Year]
                     residual <- y - fit
                     prediction <- fit"

  expect_identical(parameters(new_expr), sort(c("a", "b", "bYear", "fit", "fit2", "prediction",
                         "residual", "x", "y", "Year")))

  expect_identical(nparams(new_expr), 10L)
  expect_identical(parameters(c("b", "a")), sort(c("a", "b")))
  expect_identical(parameters(""), character(0))
})
