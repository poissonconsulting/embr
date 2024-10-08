test_that("pars", {
  expect_warning(new_expr <- mb_code(" fit2 <- a + b * x # c
                    fit <- a + b * x + bYear[Year]
                     residual <- y - fit
                    for(i in 1:2) {
                     prediction[i] <- fit[i]
                    }"), "^template type is unrecognised")

  expect_identical(pars(new_expr), sort(c(
    "a", "b", "bYear", "fit", "fit2", "i", "prediction",
    "residual", "x", "y", "Year"
  )))

  expect_identical(npars(new_expr), 11L)
})
