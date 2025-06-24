# JAGS ----
# new expression ----
test_that("lprior extracted from new expression in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(lpd <- log_prior_draws(analysis))
  expect_equal(dim(lpd)[3], 2)
})

test_that("joint lprior extracted from new expression in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(lpd_joint <- log_prior_draws(analysis, joint = TRUE))
  expect_equal(dim(lpd_joint)[3], 1)
  lpd <- log_prior_draws(analysis)
  expect_equal(sum(lpd), sum(lpd_joint))
})

test_that("errors if log_prior_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    log_prior_draws(analysis, log_prior_name = "elprior"),
    error = TRUE
  )
})

test_that("lprior extracted if different name", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        elprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        elprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_prior_draws(analysis, log_prior_name = "elprior"))
})

test_that("lprior extracted from new expression in jags model when new_expr_vec = FALSE", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  lpd_vec <- log_prior_draws(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
        lprior[2] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = FALSE
  )
  expect_snapshot(lpd_not_vec <- log_prior_draws(analysis))
  expect_identical(lpd_vec, lpd_not_vec)
})

# model ----
test_that("lprior extracted from model in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(lpd <- log_prior_draws(analysis))
  expect_equal(dim(lpd)[3], 1)
})

test_that("joint lprior extracted from model in jags model is identical", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(joint_lpd <- log_prior_draws(analysis))
  lpd <- log_prior_draws(analysis)
  expect_identical(joint_lpd, lpd)
})

test_that("errors if log_prior_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(
    log_prior_draws(analysis, log_prior_name = "elprior"),
    error = TRUE
  )
})

# both ----
test_that("errors and warning issued when trying to define lprior in both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  expect_snapshot(log_prior_draws(analysis), error = TRUE)
})

test_that("suggestion from warning when defining lprior in two places works", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        elprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        elprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_prior_draws(analysis, log_prior_name = "elprior"))
})

# Stan ----
# new expression ----
test_that("lprior extracted from new expression in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(lpd <- log_prior_draws(analysis))
  expect_equal(dim(lpd)[3], 2)
})

test_that("joint lprior extracted from new expression in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(lpd_joint <- log_prior_draws(analysis, joint = TRUE))
  expect_equal(dim(lpd_joint)[3], 1)
  lpd <- log_prior_draws(analysis)
  expect_equal(sum(lpd), sum(lpd_joint))
})

test_that("errors if log_prior_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(
    log_prior_draws(analysis, log_prior_name = "elprior"),
    error = TRUE
  )
})

test_that("lprior extracted if different name", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        elprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        elprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_prior_draws(analysis, log_prior_name = "elprior"))
})

test_that("lprior extracted from new expression in stan model when new_expr_vec = FALSE", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  lpd_vec <- log_prior_draws(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
        lprior[2] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = FALSE
  )
  expect_snapshot(lpd_not_vec <- log_prior_draws(analysis))
  expect_identical(lpd_vec, lpd_not_vec)
})

# model ----
test_that("lprior extracted from model in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(lpd <- log_prior_draws(analysis))
  expect_equal(dim(lpd)[3], 1)
})

test_that("joint lprior extracted from model in stan model is identical", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(joint_lpd <- log_prior_draws(analysis))
  lpd <- log_prior_draws(analysis)
  expect_identical(joint_lpd, lpd)
})

test_that("errors if log_prior_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(
    log_prior_draws(analysis, log_prior_name = "elprior"),
    error = TRUE
  )
})

# both ----
test_that("errors and warning issued when trying to define lprior in both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_both.RDS")
  )
  expect_snapshot(log_prior_draws(analysis), error = TRUE)
})

test_that("suggestion from warning when defining lprior in two places works", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_both.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        elprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        elprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_prior_draws(analysis, log_prior_name = "elprior"))
})

# General ----
test_that("warnings piped through when lprior and param lengths don't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
    }
    log_lik <- log_lik_lnorm(mass, log(eMass), sMass)
    lprior[1] <- log_lik_norm(bSpecies, 0, 2)
    lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
  )
  expect_snapshot(lld <- log_lik_draws(analysis))
})
