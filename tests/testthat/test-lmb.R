context("lmb")

test_that("lmb", {

  model <- model("weight ~ feed")
  expect_is(model, "lmb_model")
  analysis <- analyse(model, data = datasets::chickwts, beep = FALSE)
  expect_is(analysis, "lmb_analysis")
  glance <- glance(analysis)

  expect_is(glance, "tbl")
  expect_identical(colnames(glance), c("n", "K", "logLik", "AICc", "duration"))
  expect_equal(glance$logLik, -381.9374, tolerance = 0.0000001)
  expect_identical(glance$n, 71L)
  expect_identical(glance$K, 6L)
  expect_is(glance$duration, "Duration")

  coef <- coef(analysis)
  expect_is(coef, "tbl")
  expect_identical(colnames(coef), c("term", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))

  expect_identical(coef$term, as.term(c("(Intercept)", "feedhorsebean", "feedlinseed",
                                        "feedmeatmeal", "feedsoybean", "feedsunflower")))

  prediction <- predict(analysis)
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper"))
  expect_identical(nrow(prediction), nrow(chickwts))

  expect_identical(prediction, fitted(analysis))

  prediction <- predict(analysis, new_data = "feed")
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper"))
  expect_identical(nrow(prediction), nlevels(chickwts$feed))

  prediction <- predict(analysis, new_data = character(0))
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper"))
  expect_identical(nrow(prediction), 1L)
})

test_that("model", {
  template <- "Count ~ 1"
  code <- mb_code(template)
  model <- model(code)

  expect_s3_class(model, "lmb_model")
  expect_identical(template(model), template)

  expect_equal(model, model(template))

  expect_error(model(code, select_data = 1))
  expect_s3_class(model(code, select_data = list(Count = 1L)), "lmb_model")
  expect_s3_class(model(code, select_data = list("Count*" = 1L)), "lmb_model")
})

test_that("update_model", {
  template <- "Count ~ 1"
  code <- mb_code(template)
  model <- model(code)

  model2 <- update_model(model, select_data = list("Count" = 1))
  expect_false(identical(model, model2))
  model2 <- update_model(model2, select_data = list())
  expect_equal(model, model2)
})
