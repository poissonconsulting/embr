test_that("sensitivity summarizes by 'all' for JAGS model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "all") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity summarizes by 'parameter' for JAGS model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "parameter") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity summarizes by 'term' for JAGS model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity summarizes by 'all' for Stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "all") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity summarizes by 'parameter' for Stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "parameter") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity summarizes by 'term' for Stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type filters parameters", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  all_rows <- sensitivity(analysis, by = "term", param_type = "all")
  fixed_rows <- sensitivity(analysis, by = "term", param_type = "fixed")
  expect_true(nrow(fixed_rows) <= nrow(all_rows))
  expect_true(all(fixed_rows$term %in% all_rows$term))
})

test_that("sensitivity errors if x is not an mb_analysis object", {
  analysis <- data.frame(x = 1:10)
  expect_snapshot(
    sensitivity(analysis),
    error = TRUE
  )
})

test_that("sensitivity errors if `by` is not a string", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = 10),
    error = TRUE
  )
})

test_that("sensitivity errors if `by` is NA", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = NA),
    error = TRUE
  )
})

test_that("sensitivity errors if `by` is character(0)", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = character(0)),
    error = TRUE
  )
})

test_that("sensitivity errors if other `by` argument provided", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "total"),
    error = TRUE
  )
})

test_that("sensitivity errors if `param_type` is not valid", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, param_type = "other"),
    error = TRUE
  )
})
