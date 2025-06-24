# JAGS ----
# new expression ----
test_that("log_lik extracted from new expression in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(lld <- log_lik_draws(analysis))
  expect_equal(dim(lld)[3], nrow(analysis$data))
})

test_that("joint log_lik extracted from new expression in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(lld_joint <- log_lik_draws(analysis, joint = TRUE))
  expect_equal(dim(lld_joint)[3], 1)
  lld <- log_lik_draws(analysis)
  expect_equal(sum(lld), sum(lld_joint))
})

test_that("errors if log_lik_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(
    log_lik_draws(analysis, log_lik_name = "elog_lik"),
    error = TRUE
  )
})

test_that("log_lik extracted if different name", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        elog_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_lik_draws(analysis, log_lik_name = "elog_lik"))
})

test_that("log_lik extracted from new expression in jags model when new_expr_vec = FALSE", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  lld_vec <- log_lik_draws(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = FALSE
  )
  expect_snapshot(lld_not_vec <- log_lik_draws(analysis))
  expect_identical(lld_vec, lld_not_vec)
})

# model ----
test_that("log_lik extracted from model in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(lld <- log_lik_draws(analysis))
  expect_equal(dim(lld)[3], 100)
})

test_that("joint log_lik extracted from model in jags model is identical", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(joint_lld <- log_lik_draws(analysis))
  lld <- log_lik_draws(analysis)
  expect_identical(joint_lld, lld)
})

test_that("errors if log_lik_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(
    log_lik_draws(analysis, log_lik_name = "elog_lik"),
    error = TRUE
  )
})

# both ----
test_that("errors and warning issued when trying to define lprior in both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  expect_snapshot(log_lik_draws(analysis), error = TRUE)
})

test_that("suggestion from warning when defining log_lik in two places works", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        elog_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_lik_draws(analysis, log_lik_name = "elog_lik"))
})

# Stan ----
# new expression ----
test_that("log_lik extracted from new expression in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(lld <- log_lik_draws(analysis))
  expect_equal(dim(lld)[3], nrow(analysis$data))
})

test_that("joint log_lik extracted from new expression in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(lld_joint <- log_lik_draws(analysis, joint = TRUE))
  expect_equal(dim(lld_joint)[3], 1)
  lld <- log_lik_draws(analysis)
  expect_equal(sum(lld), sum(lld_joint))
})

test_that("errors if log_lik_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(
    log_lik_draws(analysis, log_lik_name = "elog_lik"),
    error = TRUE
  )
})

test_that("log_lik extracted if different name", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        elog_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_lik_draws(analysis, log_lik_name = "elog_lik"))
})

test_that("log_lik extracted from new expression in stan model when new_expr_vec = FALSE", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  lld_vec <- log_lik_draws(analysis)
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = FALSE
  )
  expect_snapshot(lld_not_vec <- log_lik_draws(analysis))
  expect_identical(lld_vec, lld_not_vec)
})

# model ----
test_that("log_lik extracted from model in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(lld <- log_lik_draws(analysis))
  expect_equal(dim(lld)[3], nrow(analysis$data))
})

test_that("joint log_lik extracted from model in stan model is identical", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(joint_lld <- log_lik_draws(analysis))
  lld <- log_lik_draws(analysis)
  expect_identical(joint_lld, lld)
})

test_that("errors if log_lik_name doesn't match", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(
    log_lik_draws(analysis, log_lik_name = "elog_lik"),
    error = TRUE
  )
})

# both ----
test_that("errors and warning issued when trying to define log_lik in both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_both.RDS")
  )
  expect_snapshot(log_lik_draws(analysis), error = TRUE)
})

test_that("suggestion from warning when defining log_lik in two places works", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_both.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        elog_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        lprior[1:nspecies] <- log_lik_norm(bSpecies, 0, 2)
        lprior[nspecies + 1] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_lik_draws(analysis, log_lik_name = "elog_lik"))
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
