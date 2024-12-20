test_that("lmb", {
  # data <- datasets::chickwts
  # data$char <- ""
  # data$constant <- 1
  #
  # analysis <- analyse("weight ~ feed", data = data, glance = FALSE, beep = FALSE)
  # residuals <- residuals(analysis)
  # expect_equal(mean(residuals$estimate), 0, tolerance = 10^-14)
  # expect_equal(sd(residuals$estimate/residuals$sd), 1, tolerance = 10^-1)
  # expect_identical(nrow(residuals), nrow(datasets::chickwts))
  # expect_identical(colnames(residuals), c("weight", "feed", "char", "constant", "estimate", "sd",
  #                                         "zscore", "lower", "upper", "pvalue" ))
  # analyses <- analyse_residuals(analysis)
  # expect_identical(analyses$model, c("weight", "null", "feed"))
  # expect_identical(names(analyses), c("model", "K", "IC", "DeltaIC"))
  # expect_equal(analyses$IC, c(724.5233, 765.9327, 777.1873), tolerance = 10^-5)
  #
  # plots <- plot_residuals(analysis)
  # expect_identical(names(plots), c("feed", "fit", "weight"))
  # expect_s3_class(plots[[1]], "ggplot")
})
