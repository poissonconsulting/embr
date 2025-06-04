analysis <- readRDS(
  file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
)

library(poispkgs)

stopifnot(packageVersion("poispkgs") >= "0.0.1.9017")

dtt_set_default_tz("Etc/GMT+8")

theme_set(theme_Poisson())

options(sbf.ask = FALSE)

# sbf_set_main("output")
# sbf_reset_sub()

if (getDoParWorkers() == 1) {
  message("registering 4 workers")
  registerDoParallel(4)
}
set_analysis_mode("report")

log_prior_draws(analysis)

test_that("lprior extracted from new expression in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_newexpr.RDS")
  )
  expect_snapshot(log_prior_draws(analysis))
})

test_that("lprior extracted from model in jags model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_mod.RDS")
  )
  expect_snapshot(log_prior_draws(analysis))
})

test_that("warning issued when trying to define lprior in both new expr and model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  expect_snapshot(log_prior_draws(analysis))
})

test_that("suggestion from warning when defining lprior in two places works", {
  set_analysis_mode("report")
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_jags_both.RDS")
  )
  analysis$model <- update_model(
    analysis$model,
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
        elprior[1] <- log_lik_norm(bSpecies, 0, 2)
        elprior[2] <- dexp(sMass, 1, log = TRUE)
      }
    ",
    new_expr_vec = TRUE
  )
  expect_snapshot(log_prior_draws(analysis, log_prior_name = 'elprior'))
})

test_that("lprior extracted from new expression in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_newexpr.RDS")
  )
  expect_snapshot(log_prior_draws(analysis))
})

test_that("lprior extracted from model in stan model", {
  analysis <- readRDS(
    file = system.file(package = "embr", "test-objects/analysis_stan_mod.RDS")
  )
  expect_snapshot(log_prior_draws(analysis))
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


# what does the joint argument do?
# is there an issue with the warnings
# In lprior[1] <- log_lik_norm(bSpecies, 0, 2) :
# number of items to replace is not a multiple of replacement length
