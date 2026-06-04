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

test_that("sensitivity param_type = 'fixed' by term for JAGS RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term", param_type = "fixed") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'random' by term for JAGS RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term", param_type = "random") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'fixed' by parameter for JAGS RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "parameter", param_type = "fixed") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'fixed' by term for Stan RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term", param_type = "fixed") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'random' by term for Stan RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term", param_type = "random") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'fixed' by parameter for Stan RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "parameter", param_type = "fixed") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'derived' by term for Stan RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "term", param_type = "derived") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})

test_that("sensitivity param_type = 'primary' by parameter for Stan RE model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_re.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "parameter", param_type = "primary") |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
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

test_that("sensitivity errors if `param_type` is not a string", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, param_type = 10),
    error = TRUE
  )
})

test_that("sensitivity errors if `param_type` is NA", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, param_type = NA),
    error = TRUE
  )
})

test_that("sensitivity errors if `param_type` is character(0)", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, param_type = character(0)),
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

test_that("sensitivity errors if `mb.dcjs` is not a number", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, mb.dcjs = "high"),
    error = TRUE
  )
})

test_that("sensitivity errors if `mb.dcjs` is NA", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, mb.dcjs = NA),
    error = TRUE
  )
})

test_that("sensitivity errors if `mb.dcjs` is numeric(0)", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, mb.dcjs = numeric(0)),
    error = TRUE
  )
})

test_that("sensitivity mb.dcjs changes weak_prior and strong_data classification", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    sensitivity(analysis, by = "all", mb.dcjs = 0.12) |>
      mutate(across(c(prior, likelihood), function(x) signif(x, digits = 4)))
  )
})
