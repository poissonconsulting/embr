test_that("mb_null_analysis", {
  analysis <- list(data = datasets::mtcars)
  class(analysis) <- c("mb_null_analysis", "mb_analysis")

  coef <- coef(analysis)
  expect_s3_class(coef, "tbl")
  expect_identical(colnames(coef), c("term", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  expect_identical(nrow(coef), 0L)

  glance <- glance(analysis)
  expect_s3_class(glance, "tbl")
  expect_identical(colnames(glance), c("n", "K", "converged"))
  expect_identical(nrow(glance), 1L)

  tidy <- tidy(analysis)
  expect_s3_class(tidy, "tbl")
  expect_identical(colnames(tidy), c("term", "estimate", "lower", "upper"))
  expect_identical(nrow(tidy), 0L)

  expect_identical(logLik(analysis), -Inf)
  expect_identical(IC(analysis), Inf)
})
