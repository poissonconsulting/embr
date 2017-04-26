context("residuals")

test_that("lmb", {
  analysis <- analyse("weight ~ 1", data = datasets::chickwts, glance = FALSE, beep = FALSE)
  residuals <- residuals(analysis)
  expect_equal(mean(residuals$estimate), 0, tolerance = 10^-14)
  expect_equal(sd(residuals$estimate/residuals$sd), 1, tolerance = 10^-10)
  expect_identical(nrow(residuals), nrow(datasets::chickwts))
  expect_identical(colnames(residuals), c("weight", "feed", "estimate", "sd",
                                          "zscore", "lower", "upper", "pvalue" ))

  plots <- plot_residuals(analysis)
  expect_identical(names(plots), c("feed", "weight"))
  expect_is(plots[[1]], "ggplot")
})
