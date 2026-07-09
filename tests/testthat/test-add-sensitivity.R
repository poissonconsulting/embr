test_that("add_sensitivity adds sensitivity field to JAGS analysis", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )
  result <- add_sensitivity(analysis)
  expect_true(is.data.frame(result$sensitivity))
  expect_named(
    result$sensitivity,
    c("term", "prior", "likelihood", "diagnosis")
  )
})

test_that("add_sensitivity uses cache on second call", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )
  a1 <- add_sensitivity(analysis)
  a2 <- add_sensitivity(a1)
  expect_identical(a1$sensitivity, a2$sensitivity)
})

test_that("add_sensitivity replaces cache when replace = TRUE", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )
  a1 <- add_sensitivity(analysis)
  a2 <- add_sensitivity(a1, replace = TRUE)
  expect_true(is.data.frame(a2$sensitivity))
})

test_that("add_sensitivity retains original new_expr on returned object", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )
  original_expr <- new_expr(analysis)
  result <- add_sensitivity(analysis)
  expect_identical(new_expr(result), original_expr)
})

test_that("add_sensitivity errors if x is not an mb_analysis object", {
  expect_snapshot(
    add_sensitivity(data.frame(x = 1:10)),
    error = TRUE
  )
})

test_that("add_sensitivity errors if replace is not a flag", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )
  expect_snapshot(
    add_sensitivity(analysis, replace = "yes"),
    error = TRUE
  )
})
