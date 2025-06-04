# NOTE: IF YOU RE-RUN THIS SCRIPT YOU WILL NEED TO UPDATE SNAPSHOTS

if (FALSE) {
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
      log_lik[i] <- log_lik_lnorm(mass[i], log(eMass[i]), sMass)
      lprior[1] <- log_lik_norm(bSpecies, 0, 2)
      lprior[2] <- dexp(sMass, 1, log = TRUE)
    }
  }",
    new_expr_vec = TRUE,
    select_data = list(
      species = factor(),
      mass = c(900, 2000)
    )
  )

  analysis_jags_newexpr <- analyse(model, data)
  saveRDS(analysis_jags_newexpr, "inst/analysis_jags_newexpr.RDS")

  # JAGS in model ----
  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(0, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- logdensity.norm(bSpecies, 0, 2) + logdensity.exp(sMass, 1)

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
  saveRDS(analysis_jags_mod, "inst/analysis_jags_mod.RDS")

  # JAGS in both new_expr and model ----
  model <- model(
    code = "model{
    for (i in 1:nspecies) {
      bSpecies[i] ~ dnorm(0, 2^-2)
    }
    sMass ~ dexp(1)

    lprior <- logdensity.norm(bSpecies, 0, 2) + logdensity.exp(sMass, 1)

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
      lprior[1] <- log_lik_norm(bSpecies, 0, 2)
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
  saveRDS(analysis_jags_both, "inst/analysis_jags_both.RDS")
}


