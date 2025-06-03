test_that("lprior extracted from new expression in jags model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(8, 2^-2)
    }
    sMass ~ dexp(1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]];
      mass[i] ~ dnorm(log(eMass[i]), sMass^-2)
    }
  }",
    new_expr = "{
    log(eMass) <- bSpecies[species]
    total_mass <- sum(eMass)
    log_lik <- log_lik_norm(mass, eMass, sMass)
    lprior[1] <- log_lik_norm(bSpecies, 8, 2)
    lprior[2] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    )
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  lpd <- log_prior_draws(analysis)
  expect_equal(class(lpd), c("draws_array", "draws", "array"))
  expect_equal(dim(lpd), c(10L, 2L, 2L))
  expect_true(all(!is.na(lpd)))
  expect_true(is.numeric(lpd))
})

test_that("lprior extracted from model in jags model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(8, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- logdensity.norm(bSpecies, 8, 0.01^-2) + logdensity.exp(sMass, 1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      mass[i] ~ dnorm(log(eMass[i]), sMass^-2)
      log_lik[i] <- logdensity.norm(mass[i], eMass[i], sMass^-2)
    }
  }",
    new_expr = "{
    log(eMass) <- bSpecies[species]
    total_mass <- sum(eMass)
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    )
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  lpd <- log_prior_draws(analysis)
  expect_equal(class(lpd), c("draws_array", "draws", "array"))
  expect_equal(dim(lpd), c(10L, 2L, 2L))
  expect_true(all(!is.na(lpd)))
  expect_true(is.numeric(lpd))
})

test_that("lprior extracted from model in jags model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(8, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- logdensity.norm(bSpecies, 8, 0.01^-2) + logdensity.exp(sMass, 1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      mass[i] ~ dnorm(log(eMass[i]), sMass^-2)
      log_lik[i] <- logdensity.norm(mass[i], eMass[i], sMass^-2)
    }
  }",
    new_expr = "
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      lprior[1] <- log_lik_norm(bSpecies, 8, 2)
      lprior[2] <- dexp(sMass, 1, log = TRUE)
    }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    )
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  expect_warning(log_prior_draws(analysis)) # FIXME: warning not thrown yet - issue with pars causing it not to be detected in the new expression..
})

test_that("lprior extracted from new expression in stan model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(8, 2^-2)
    }
    sMass ~ dexp(1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]];
      mass[i] ~ dnorm(log(eMass[i]), sMass^-2)
    }
  }",
    new_expr = "{
    log(eMass) <- bSpecies[species]
    total_mass <- sum(eMass)
    log_lik <- log_lik_norm(mass, eMass, sMass)
    lprior[1] <- log_lik_norm(bSpecies, 8, 2)
    lprior[2] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    )
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  lpd <- log_prior_draws(analysis)
  expect_equal(class(lpd), c("draws_array", "draws", "array"))
  expect_equal(dim(lpd), c(10L, 2L, 2L))
  expect_true(all(!is.na(lpd)))
  expect_true(is.numeric(lpd))
})

test_that("lprior extracted from model in stan model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(8, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- logdensity.norm(bSpecies, 8, 0.01^-2) + logdensity.exp(sMass, 1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      mass[i] ~ dnorm(log(eMass[i]), sMass^-2)
      log_lik[i] <- logdensity.norm(mass[i], eMass[i], sMass^-2)
    }
  }",
    new_expr = "{
    log(eMass) <- bSpecies[species]
    total_mass <- sum(eMass)
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    )
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  lpd <- log_prior_draws(analysis)
  expect_equal(class(lpd), c("draws_array", "draws", "array"))
  expect_equal(dim(lpd), c(10L, 2L, 2L))
  expect_true(all(!is.na(lpd)))
  expect_true(is.numeric(lpd))
})

test_that("lprior extracted from model in stan model", {
  data <- data.frame(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), length.out = 100))
  )

  model <- model(
    code = "
    data {
      int<lower=2> nObs;
      int<lower=1> nspecies;
      int<lower=1> species[nObs];
      real<lower=0> mass[nObs];
    }

    parameters {
      real bSpecies[nspecies];
      real<lower=0> sMass;
    }

    transformed parameters {
      real log_lik[nObs];
      real eMass[nObs];
      real lprior;

      for (i in 1:nObs) {
        eMass[i] = exp(bSpecies[species[i]]);
        log_lik[i] = lognormal_lpdf(mass[i] | eMass[i], sMass);
      }
      lprior = normal_lpdf(bSpecies | 8, 0.01) + exponential_lpdf(sMass | 1);
    }

    model {
      bSpecies ~ normal(8, 0.01);
      sMass ~ exponential(1);

      mass ~ lognormal(log(eMass), sMass);
    }
  ",
    new_expr = "
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      lprior[1] <- log_lik_norm(bSpecies, 8, 2)
      lprior[2] <- dexp(sMass, 1, log = TRUE)
    }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 1200)
    ),
    derived = c("log_lik", "lprior")
  )
  set_analysis_mode("quick")
  analysis <- analyse(model, data, nthin = 1L)

  expect_warning(log_prior_draws(analysis)) # FIXME: warning not thrown yet - issue with pars causing it not to be detected in the new expression..
})
