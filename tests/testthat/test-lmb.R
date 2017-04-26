context("lmb")

test_that("lmb", {

  model <- model("weight ~ feed")
  expect_is(model, "lmb_model")
  analysis <- analyse(model, data = datasets::chickwts, glance = FALSE, beep = FALSE)

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
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  expect_identical(nrow(prediction), nrow(chickwts))

  expect_equal(prediction[,colnames(chickwts)], chickwts)

  expect_identical(prediction, fitted(analysis))

  prediction <- predict(analysis, new_data = "feed")
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
  expect_identical(nrow(prediction), nlevels(chickwts$feed))

  prediction <- predict(analysis, new_data = character(0))
  expect_identical(colnames(prediction), c("weight", "feed", "estimate", "sd", "zscore", "lower", "upper", "pvalue"))
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

test_that("analyse.character", {
  analysis <- analyse("weight ~ feed", data = datasets::chickwts,
                      glance = FALSE, beep = FALSE)
  expect_is(analysis, "lmb_analysis")
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

test_that("add_models", {
  model <- model("Count ~ 1")
  models <- add_models(model, model)
  expect_is(models, "mb_models")
  expect_identical(length(models), 2L)
  models <- add_models(models, models)
  expect_is(models, "mb_models")
  expect_identical(length(models), 4L)
})

test_that("add_analyses", {
  analysis <- analyse("weight ~ 1", data = datasets::chickwts, beep = FALSE, glance = FALSE)
  analyses <- add_analyses(analysis, analysis)
  expect_is(analyses, "mb_analyses")
  expect_identical(length(analyses), 2L)
  analyses <- add_analyses(analyses, analyses)
  expect_is(analyses, "mb_analyses")
  expect_identical(length(analyses), 4L)
})

test_that("models", {
  model <- model("weight ~ 1")
  model2 <- model("weight ~ feed")

  models <- models(full = model, base = model2)
  expect_is(models, "mb_models")
  expect_identical(length(models), 2L)
  expect_identical(names(models), c("full", "base"))

  analyses <- analyse(models, data = datasets::chickwts, beep = FALSE, glance = FALSE)
  expect_is(analyses, "mb_analyses")
  coef <- coef(analyses)
  expect_identical(coef$term, as.term(c("(Intercept)", "feedhorsebean", "feedlinseed",
                                        "feedmeatmeal", "feedsoybean", "feedsunflower")))
  expect_identical(coef$proportion, c(1.0, rep(0.5, 5)))

  aic <- AICc(analyses)
  expect_identical(colnames(aic), c("model", "K", "AICc", "DeltaAICc", "AICcWt"))
  expect_identical(aic$model, c("full", "base"))
  expect_equal(aic$AICc, c(821.3269, 777.1873), tolerance = 10^-6)
})

test_that("analyse models", {
  model <- model("weight ~ 1")
  models <- add_models(model, model)
  analyses <- analyse(models, data = datasets::chickwts, glance = FALSE, beep = FALSE)

  expect_is(analyses, "mb_analyses")
  expect_identical(length(analyses), 2L)
})


