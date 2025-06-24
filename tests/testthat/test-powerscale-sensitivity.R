test_that("powerscale_sensitivity() works for jags model, values set in new expression", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis))
})

test_that("powerscale_sensitivity() works for jags model, values set in model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis))
})

test_that("powerscale_sensitivity() errors for jags model, values set both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis), error = TRUE)
})

test_that("powerscale_sensitivity() works for stan model, values set in new expression", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis))
})

test_that("powerscale_sensitivity() works for stan model, values set in model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis))
})

test_that("powerscale_sensitivity() errors for stan model, values set both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_both.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis), error = TRUE)
})

test_that("powerscale_sensitivity same for joint = TRUE as joint = FALSE, jags", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_identical(powerscale_sensitivity(analysis), powerscale_sensitivity(analysis, joint = TRUE))
})

test_that("powerscale_sensitivity same for joint = TRUE as joint = FALSE, stan", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_identical(powerscale_sensitivity(analysis), powerscale_sensitivity(analysis, joint = TRUE))
})

test_that("powerscale_sensitivity different if lprior and param lengths don't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  ps1 <- powerscale_sensitivity(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
    }
    log_lik <- log_lik_lnorm(mass, log(eMass), sMass)
    lprior[1] <- log_lik_norm(bSpecies, 0, 2)
    lprior[2] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
  )
  ps2 <- suppressWarnings(powerscale_sensitivity(analysis))
  expect_false(all(ps1 == ps2))
})

test_that("powerscale_sensitivity same if we sum the lprior for vector of params", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  ps1 <- powerscale_sensitivity(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
    }
    log_lik <- log_lik_lnorm(mass, log(eMass), sMass)
    lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
    lprior[2] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
  )
  ps2 <- powerscale_sensitivity(analysis)
  expect_identical(ps1, ps2)
})

test_that("can subset variables to check", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis, variable = "sMass"))
  expect_snapshot(powerscale_sensitivity(analysis, variable = "bSpecies"))
})

test_that("can change components to check", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(powerscale_sensitivity(analysis, component = "prior"))
  expect_snapshot(powerscale_sensitivity(analysis, component = "likelihood"))
})

test_that("can change sensitivity threshold", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(ps1 <- powerscale_sensitivity(analysis, sensitivity_threshold = 0.1))
  expect_snapshot(ps2 <- powerscale_sensitivity(analysis, sensitivity_threshold = 0.0001))
  expect_false(all(ps1 == ps2))
})

test_that("errors if you try to change log_lik_fn", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  llf2 <- function(x) {
    print(x)
  }
  expect_snapshot(powerscale_sensitivity(analysis, log_lik_fn = llf2), error = TRUE)
})

test_that("errors if you try to change log_prior_fn", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  lpf2 <- function(x) {
    print(x)
  }
  expect_snapshot(powerscale_sensitivity(analysis, log_lik_fn = lpf2), error = TRUE)
})
