context("predict")

test_that("lmb", {
  # data <- datasets::chickwts
  # data$char <- ""
  # data$constant <- 1
  #
  #
  # analysis <- analyse("weight ~ feed", data = data, glance = FALSE, beep = FALSE)
  # feed <- predict(analysis, new_data = "feed")
  # expect_identical(as.character(feed$feed), levels(datasets::chickwts$feed))
  # expect_identical(colnames(feed), c("weight", "feed", "char", "constant", "estimate", "sd",
  #                                         "zscore", "lower", "upper", "pvalue" ))
  #
  # models <- list(model("weight ~ feed"), model("weight ~ 1"))
  # models <- as.models(models)
  #
  # analyses <- analyse(models, data = data, glance = FALSE, beep = FALSE)
  # expect_is(analyses, "mb_analyses")
  #
  # feed <- predict(analyses, new_data = "feed")
  # expect_identical(as.character(feed$feed), levels(datasets::chickwts$feed))
  # expect_identical(colnames(feed), c("weight", "feed", "char", "constant", "estimate", "sd",
  #                                         "zscore", "lower", "upper", "pvalue" ))
})
