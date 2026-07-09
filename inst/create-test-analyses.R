# NOTE: IF YOU RE-RUN THIS SCRIPT YOU WILL NEED TO UPDATE SNAPSHOTS
# This script generates test analysis objects for the sensitivity functions.

if (FALSE) {
  withr::with_package(
    package = c("jmbr"),
    {
      data <- tibble(
        mass = as.numeric(1000:1099),
        species = factor(rep(c("a", "b"), each = 50))
      )

      niters <- 250L

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
          lprior[2] <- log_lik_exp(sMass, 1)
        }",
        new_expr_vec = TRUE,
        select_data = list(
          species = factor(),
          mass = c(900, 2000)
        )
      )

      analysis_jags_newexpr <- analyse(model, data, niters = niters)
      analysis_jags_newexpr$jags_chains <- NULL
      saveRDS(
        analysis_jags_newexpr,
        "inst/test-objects/analysis_jags_newexpr.RDS"
      )

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

      analysis_jags_mod <- analyse(model, data, niters = niters)
      analysis_jags_mod$jags_chains <- NULL
      saveRDS(
        analysis_jags_mod,
        "inst/test-objects/analysis_jags_mod.RDS"
      )

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
            lprior[2] <- log_lik_exp(sMass, 1)
          }
        }",
        new_expr_vec = TRUE,
        select_data = list(
          species = factor(),
          mass = c(900, 2000)
        )
      )

      analysis_jags_both <- analyse(model, data, niters = niters)
      analysis_jags_both$jags_chains <- NULL
      saveRDS(
        analysis_jags_both,
        "inst/test-objects/analysis_jags_both.RDS"
      )

      # JAGS with random effects ----
      data_re <- withr::with_seed(42, {
        species <- factor(rep(c("a", "b"), each = 250))
        year <- factor(rep(1:10, times = 50))
        b_species <- c(log(1050), log(1100))
        b_year <- rnorm(10, 0, 0.1)
        log_emass <- b_species[as.integer(species)] + b_year[as.integer(year)]
        tibble(
          mass = rlnorm(500, log_emass, 0.05),
          species = species,
          year = year
        )
      })

      model <- model(
        code = "model{
          for (i in 1:nspecies) {
            bSpecies[i] ~ dnorm(0, 2^-2)
          }
          sYear ~ dexp(1)
          for (i in 1:nyear) {
            bYear[i] ~ dnorm(0, sYear^-2)
          }
          sMass ~ dexp(1)

          for (i in 1:nObs) {
            log(eMass[i]) <- bSpecies[species[i]] + bYear[year[i]]
            mass[i] ~ dlnorm(log(eMass[i]), sMass^-2)
          }
        }",
        new_expr = "{
          for (i in 1:nObs) {
            log(eMass[i]) <- bSpecies[species[i]] + bYear[year[i]]
          }
          log_lik <- log_lik_lnorm(mass, log(eMass), sMass)
          lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
          lprior[2] <- log_lik_exp(sYear, 1)
          lprior[3] <- log_lik_exp(sMass, 1)
        }",
        new_expr_vec = TRUE,
        random_effects = list(bYear = "year"),
        select_data = list(
          species = factor(),
          year = factor(),
          mass = c(0.5, 3)
        )
      )

      analysis_jags_re <- analyse(model, data_re, niters = 500, nthin = 100L)
      analysis_jags_re$jags_chains <- NULL
      saveRDS(
        analysis_jags_re,
        "inst/test-objects/analysis_jags_re.RDS"
      )
    }
  )

  withr::with_package(package = "smbr", {
    data <- tibble(
      mass = as.numeric(1000:1099),
      species = factor(rep(c("a", "b"), each = 50))
    )

    niters <- 250L

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
            log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
          }
          lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
          lprior[2] <- log_lik_exp(sMass, 1)
        ",
      select_data = list(
        species = factor(),
        mass = c(900, 2000)
      )
    )

    analysis_stan_newexpr <- analyse(model, data, niters = niters)
    analysis_stan_newexpr$stanfit <- NULL
    saveRDS(
      analysis_stan_newexpr,
      "inst/test-objects/analysis_stan_newexpr.RDS"
    )

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
              log_lik[i] = lognormal_lpdf(
                mass[i] | log(eMass[i]), sMass
              );
            }
            lprior =
              normal_lpdf(bSpecies[1] | 0, 2) +
              normal_lpdf(bSpecies[2] | 0, 2) +
              exponential_lpdf(sMass | 1);
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

    analysis_stan_mod <- analyse(model, data, niters = niters)
    analysis_stan_mod$stanfit <- NULL
    saveRDS(
      analysis_stan_mod,
      "inst/test-objects/analysis_stan_mod.RDS"
    )

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
              log_lik[i] = lognormal_lpdf(
                mass[i] | log(eMass[i]), sMass
              );
            }
            lprior =
              normal_lpdf(bSpecies[1] | 0, 2) +
              normal_lpdf(bSpecies[2] | 0, 2) +
              exponential_lpdf(sMass | 1);
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
            log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
          }
          lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
          lprior[2] <- log_lik_exp(sMass, 1)
        ",
      new_expr_vec = TRUE,
      select_data = list(
        species = factor(),
        mass = c(900, 2000)
      ),
      derived = c("log_lik", "lprior")
    )

    analysis_stan_both <- analyse(model, data, niters = niters)
    analysis_stan_both$stanfit <- NULL
    saveRDS(
      analysis_stan_both,
      "inst/test-objects/analysis_stan_both.RDS"
    )

    # Stan with random effects ----
    data_re <- withr::with_seed(42, {
      species <- factor(rep(c("a", "b"), each = 250))
      year <- factor(rep(1:10, times = 50))
      b_species <- c(0, 0.05)
      b_year <- rnorm(10, 0, 0.2)
      log_emass <- b_species[as.integer(species)] + b_year[as.integer(year)]
      tibble(
        mass = rlnorm(500, log_emass, 0.1),
        species = species,
        year = year
      )
    })

    model <- model(
      code = "
          data {
            int<lower=2> nObs;
            int<lower=1> nspecies;
            int<lower=1> nyear;
            int<lower=1> species[nObs];
            int<lower=1> year[nObs];
            real<lower=0> mass[nObs];
          }

          parameters {
            real bSpecies[nspecies];
            real bYear[nyear];
            real<lower=0> sYear;
            real<lower=0> sMass;
          }

          transformed parameters {
            real eMass[nObs];
            real ratio;

            for (i in 1:nObs) {
              eMass[i] = exp(
                bSpecies[species[i]] + bYear[year[i]]
              );
            }
            ratio = exp(bSpecies[2] - bSpecies[1]);
          }

          model {
            bSpecies ~ normal(0, 2);
            bYear ~ normal(0, sYear);
            sYear ~ exponential(1);
            sMass ~ exponential(1);

            mass ~ lognormal(log(eMass), sMass);
          }
        ",
      new_expr = "
          for (i in 1:nObs) {
            log(eMass[i]) <- bSpecies[species[i]] + bYear[year[i]]
            log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
          }
          lprior[1] <- sum(log_lik_norm(bSpecies, 0, 2))
          lprior[2] <- log_lik_exp(sYear, 1)
          lprior[3] <- log_lik_exp(sMass, 1)
        ",
      random_effects = list(bYear = "year"),
      select_data = list(
        species = factor(),
        year = factor(),
        mass = c(0.5, 3)
      ),
      derived = "ratio"
    )

    analysis_stan_re <- analyse(model, data_re, niters = 500L)
    analysis_stan_re$stanfit <- NULL
    saveRDS(
      analysis_stan_re,
      "inst/test-objects/analysis_stan_re.RDS"
    )
  })
}
