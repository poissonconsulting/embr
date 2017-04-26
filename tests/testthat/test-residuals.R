context("residuals")

test_that("lmb", {
  data <- datasets::chickwts
  data$char <- ""
  data$constant <- 1

  analysis <- analyse("weight ~ 1", data = data, glance = FALSE, beep = FALSE)
  residuals <- residuals(analysis)
  expect_equal(mean(residuals$estimate), 0, tolerance = 10^-14)
  expect_equal(sd(residuals$estimate/residuals$sd), 1, tolerance = 10^-10)
  expect_identical(nrow(residuals), nrow(datasets::chickwts))
  expect_identical(colnames(residuals), c("weight", "feed", "char", "constant", "estimate", "sd",
                                          "zscore", "lower", "upper", "pvalue" ))

  plots <- plot_residuals(analysis)
  expect_identical(names(plots), c("feed", "weight"))
  expect_is(plots[[1]], "ggplot")

  analyses <- analyse_residuals(analysis)
  expect_identical(analyses$model, c("weight", "feed", "null"))
  expect_identical(names(analyses), c("model", "K", "AICc", "DeltaAICc"))
  expect_equal(analyses$AICc, c(-4322.5945, 777.1873, 821.3269))
})
