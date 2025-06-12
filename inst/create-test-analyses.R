# NOTE: IF YOU RE-RUN THIS SCRIPT YOU WILL NEED TO UPDATE SNAPSHOTS
# This script generates test analysis objects for the sensitivity functions.

if (FALSE) {
  library(jmbr)
  library(smbr)

  data <- tibble(
    mass = as.numeric(1000:1099),
    species = factor(rep(c("a", "b"), each = 50))
  )

  # JAGS with new expr ----
  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(0, 2^-2)
    }
    sMass ~ dexp(1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]];
      mass[i] ~ dlnorm(log(eMass[i]), sMass^-2)
    }
  }",
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
    }
    log_lik <- log_lik_lnorm(mass, log(eMass), sMass)
    lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
    lprior[2] <- dexp(sMass, 1, log = TRUE)
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    )
  )

  analysis_jags_newexpr <- analyse(model, data)
  saveRDS(analysis_jags_newexpr, "inst/test-objects/analysis_jags_newexpr.RDS")

  # JAGS in model ----
  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(0, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- sum(logdensity.norm(bSpecies, 0, 2)) + logdensity.exp(sMass, 1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      mass[i] ~ dlnorm(log(eMass[i]), sMass^-2)
      log_lik[i] <- logdensity.lnorm(mass[i], log(eMass[i]), sMass^-2)
    }
  }",
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
    }
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    )
  )

  analysis_jags_mod <- analyse(model, data)
  saveRDS(analysis_jags_mod, "inst/test-objects/analysis_jags_mod.RDS")

  # JAGS in both new_expr and model ----
  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(0, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- sum(logdensity.norm(bSpecies, 0, 2)) + logdensity.exp(sMass, 1)

    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      mass[i] ~ dlnorm(log(eMass[i]), sMass^-2)
      log_lik[i] <- logdensity.lnorm(mass[i], log(eMass[i]), sMass^-2)
    }
  }",
    new_expr = "{
    for (i in 1:nObs) {
      log(eMass[i]) <- bSpecies[species[i]]
      log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
      lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
      lprior[2] <- dexp(sMass, 1, log = TRUE)
    }
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    )
  )

  analysis_jags_both <- analyse(model, data)
  saveRDS(analysis_jags_both, "inst/test-objects/analysis_jags_both.RDS")

  # Stan with new expr ----
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
        real eMass[nObs];

        for (i in 1:nObs) {
          eMass[i] = exp(bSpecies[species[i]]);
        }
      }

      model {
        bSpecies ~ normal(0, 2);
        sMass ~ exponential(1);

        mass ~ lognormal(log(eMass), sMass);
      }
    ",
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
        lprior[2] <- dexp(sMass, 1, log = TRUE)
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
      }
    ",
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    )
  )

  analysis_stan_newexpr <- analyse(model, data)
  saveRDS(analysis_stan_newexpr, "inst/test-objects/analysis_stan_newexpr.RDS")

  # Stan in model ----
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
        lprior = normal_lpdf(bSpecies[1] | 0, 2) + normal_lpdf(bSpecies[2] | 0, 2) + exponential_lpdf(sMass | 1);
      }

      model {
        bSpecies ~ normal(0, 2);
        sMass ~ exponential(1);

        mass ~ lognormal(log(eMass), sMass);
      }
    ",
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
      }
    ",
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    ),
    derived = c("log_lik", "lprior")
  )

  analysis_stan_mod <- analyse(model, data)
  saveRDS(analysis_stan_mod, "inst/test-objects/analysis_stan_mod.RDS")

  # Stan in both new_expr and model ----
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
        lprior = normal_lpdf(bSpecies[1] | 0, 2) + normal_lpdf(bSpecies[2] | 0, 2) + exponential_lpdf(sMass | 1);
      }

      model {
        bSpecies ~ normal(0, 2);
        sMass ~ exponential(1);
        mass ~ lognormal(log(eMass), sMass);
      }
    ",
    new_expr = "
      for (i in 1:nObs) {
        log(eMass[i]) <- bSpecies[species[i]]
        lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
        lprior[2] <- dexp(sMass, 1, log = TRUE)
        log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
      }
    ",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    ),
    derived = c("log_lik", "lprior")
  )

  analysis_stan_both <- analyse(model, data)
  saveRDS(analysis_stan_both, "inst/test-objects/analysis_stan_both.RDS")
}
