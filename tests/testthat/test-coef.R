test_that("coef directional_information for Bayesian analysis", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  coef_svalue <- coef(
    analysis,
    simplify = TRUE,
    directional_information = FALSE
  )
  expect_identical(
    colnames(coef_svalue),
    c("term", "estimate", "sd", "lower", "upper", "svalue")
  )

  coef_di <- coef(analysis, simplify = TRUE, directional_information = TRUE)
  expect_identical(
    colnames(coef_di),
    c("term", "estimate", "sd", "lower", "upper", "svalue")
  )

  expect_identical(
    coef_di[c("term", "estimate", "lower", "upper")],
    coef_svalue[c("term", "estimate", "lower", "upper")]
  )
  expect_false(identical(coef_di$svalue, coef_svalue$svalue))

  mcmcr <- subset(as.mcmcr(analysis), pars = pars(analysis, "fixed"))
  expect_identical(
    coef_di$svalue,
    coef(mcmcr, directional_information = TRUE)$svalue
  )
})

test_that("coef simplifies by default", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  coef <- coef(analysis, directional_information = FALSE)
  expect_identical(
    colnames(coef),
    c("term", "estimate", "sd", "lower", "upper", "svalue")
  )
})

test_that("coef errors if simplify = FALSE", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  expect_error(
    coef(analysis, simplify = FALSE),
    "must be TRUE",
    class = "defunctError"
  )

  null_analysis <- list(data = datasets::mtcars)
  class(null_analysis) <- c("mb_null_analysis", "mb_analysis")

  expect_error(
    coef(null_analysis, simplify = FALSE),
    "must be TRUE",
    class = "defunctError"
  )
})

test_that("coef simplifies null analysis by default", {
  analysis <- list(data = datasets::mtcars)
  class(analysis) <- c("mb_null_analysis", "mb_analysis")

  coef <- coef(analysis)
  expect_identical(
    colnames(coef),
    c("term", "estimate", "sd", "lower", "upper", "svalue")
  )
  expect_identical(nrow(coef), 0L)
})

test_that("coef soft-deprecates unset directional_information for Bayesian analysis", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  lifecycle::expect_deprecated(coef(analysis, simplify = TRUE))
  expect_no_warning(coef(
    analysis,
    simplify = TRUE,
    directional_information = FALSE
  ))
  expect_no_warning(coef(
    analysis,
    simplify = TRUE,
    directional_information = TRUE
  ))

  chk::expect_chk_error(coef(analysis, directional_information = NA))
})

test_that("coef directional_information for null analysis", {
  analysis <- list(data = datasets::mtcars)
  class(analysis) <- c("mb_null_analysis", "mb_analysis")

  coef <- coef(analysis, simplify = TRUE, directional_information = TRUE)
  expect_identical(
    colnames(coef),
    c("term", "estimate", "sd", "lower", "upper", "svalue")
  )
  expect_identical(nrow(coef), 0L)
})

test_that("coef respects conf_level for Bayesian analysis", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  coef95 <- coef(analysis, conf_level = 0.95, directional_information = FALSE)
  coef50 <- coef(analysis, conf_level = 0.5, directional_information = FALSE)

  expect_identical(coef50$estimate, coef95$estimate)
  expect_true(all(coef50$upper - coef50$lower < coef95$upper - coef95$lower))

  mcmcr <- subset(as.mcmcr(analysis), pars = pars(analysis, "fixed"))
  expect_identical(
    coef50$lower,
    coef(mcmcr, conf_level = 0.5, directional_information = FALSE)$lower
  )
})

test_that("coef returns the posterior standard deviation for Bayesian analysis", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  coef <- coef(analysis, simplify = TRUE, directional_information = FALSE)
  expected <- coef(
    subset(as.mcmcr(analysis), pars = pars(analysis, "fixed")),
    directional_information = FALSE
  )
  expect_identical(coef$sd, expected$sd)
  expect_true(all(coef$sd > 0))
})
