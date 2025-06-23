# lprior extracted from new expression in jags model

    Code
      lpd <- log_prior_draws(analysis)

# joint lprior extracted from new expression in jags model

    Code
      lpd_joint <- log_prior_draws(analysis, joint = TRUE)

# errors if log_prior_name doesn't match

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Condition
      Error:
      ! There is no log prior parameter monitored by the model or present in the new expression.

---

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Condition
      Error:
      ! There is no log prior parameter monitored by the model or present in the new expression.

---

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Condition
      Error:
      ! There is no log prior parameter monitored by the model or present in the new expression.

---

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Condition
      Error:
      ! There is no log prior parameter monitored by the model or present in the new expression.

# lprior extracted if different name

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 3 variables
      , , variable = elprior[1]
      
               chain
      iteration    1    2    3
              1 -7.6 -7.6 -7.6
              2 -7.6 -7.6 -7.6
              3 -7.6 -7.6 -7.6
              4 -7.6 -7.6 -7.6
              5 -7.6 -7.6 -7.6
      
      , , variable = elprior[2]
      
               chain
      iteration    1    2    3
              1 -7.7 -7.7 -7.7
              2 -7.7 -7.7 -7.7
              3 -7.7 -7.7 -7.7
              4 -7.7 -7.7 -7.7
              5 -7.7 -7.7 -7.7
      
      , , variable = elprior[3]
      
               chain
      iteration      1      2      3
              1 -0.015 -0.015 -0.018
              2 -0.015 -0.015 -0.014
              3 -0.015 -0.013 -0.013
              4 -0.014 -0.013 -0.015
              5 -0.015 -0.014 -0.015
      
      # ... with 995 more iterations

---

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 3 variables
      , , variable = elprior[1]
      
               chain
      iteration    1    2    3
              1 -7.6 -7.6 -7.6
              2 -7.6 -7.6 -7.6
              3 -7.6 -7.6 -7.6
              4 -7.6 -7.6 -7.6
              5 -7.6 -7.6 -7.6
      
      , , variable = elprior[2]
      
               chain
      iteration    1    2    3
              1 -7.7 -7.7 -7.7
              2 -7.7 -7.7 -7.7
              3 -7.7 -7.7 -7.7
              4 -7.7 -7.7 -7.7
              5 -7.7 -7.7 -7.7
      
      , , variable = elprior[3]
      
               chain
      iteration      1      2      3
              1 -0.014 -0.013 -0.013
              2 -0.013 -0.013 -0.015
              3 -0.013 -0.013 -0.015
              4 -0.014 -0.013 -0.015
              5 -0.014 -0.013 -0.014
      
      # ... with 995 more iterations

# lprior extracted from new expression in jags model when new_expr_vec = FALSE

    Code
      lpd_not_vec <- log_prior_draws(analysis)

# lprior extracted from model in jags model

    Code
      lpd <- log_prior_draws(analysis)

# joint lprior extracted from model in jags model is identical

    Code
      joint_lpd <- log_prior_draws(analysis)

# errors and warning issued when trying to define lprior in both new expr and model

    Code
      log_prior_draws(analysis)
    Condition
      Warning in `log_prior_draws.mb_analysis()`:
      `lprior` is defined both as a parameter within the model and in the new expression. Change `lprior` in the new expression to `elprior`, and supply `log_prior_name = 'elprior'` to the function.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'lprior' must match at least one of the following variables in expr: 'i' or 'eMass'.

---

    Code
      log_prior_draws(analysis)
    Condition
      Warning in `log_prior_draws.mb_analysis()`:
      `lprior` is defined both as a parameter within the model and in the new expression. Change `lprior` in the new expression to `elprior`, and supply `log_prior_name = 'elprior'` to the function.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'lprior' must match at least one of the following variables in expr: 'i' or 'eMass'.

# suggestion from warning when defining lprior in two places works

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 3 variables
      , , variable = elprior[1]
      
               chain
      iteration    1    2    3
              1 -7.6 -7.6 -7.6
              2 -7.6 -7.6 -7.6
              3 -7.6 -7.6 -7.6
              4 -7.6 -7.6 -7.6
              5 -7.6 -7.6 -7.6
      
      , , variable = elprior[2]
      
               chain
      iteration    1    2    3
              1 -7.7 -7.7 -7.7
              2 -7.7 -7.7 -7.7
              3 -7.7 -7.7 -7.7
              4 -7.7 -7.7 -7.7
              5 -7.7 -7.7 -7.7
      
      , , variable = elprior[3]
      
               chain
      iteration      1      2      3
              1 -0.013 -0.015 -0.015
              2 -0.017 -0.014 -0.015
              3 -0.013 -0.014 -0.015
              4 -0.016 -0.013 -0.014
              5 -0.014 -0.014 -0.014
      
      # ... with 995 more iterations

---

    Code
      log_prior_draws(analysis, log_prior_name = "elprior")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 3 variables
      , , variable = elprior[1]
      
               chain
      iteration    1    2    3
              1 -7.6 -7.6 -7.6
              2 -7.6 -7.6 -7.6
              3 -7.6 -7.6 -7.6
              4 -7.6 -7.6 -7.6
              5 -7.6 -7.6 -7.6
      
      , , variable = elprior[2]
      
               chain
      iteration    1    2    3
              1 -7.7 -7.7 -7.7
              2 -7.7 -7.7 -7.7
              3 -7.7 -7.7 -7.7
              4 -7.7 -7.7 -7.7
              5 -7.7 -7.7 -7.7
      
      , , variable = elprior[3]
      
               chain
      iteration      1      2      3
              1 -0.013 -0.016 -0.014
              2 -0.014 -0.015 -0.014
              3 -0.014 -0.017 -0.014
              4 -0.016 -0.017 -0.015
              5 -0.015 -0.017 -0.013
      
      # ... with 995 more iterations

# lprior extracted from new expression in stan model

    Code
      lpd <- log_prior_draws(analysis)

# joint lprior extracted from new expression in stan model

    Code
      lpd_joint <- log_prior_draws(analysis, joint = TRUE)

# lprior extracted from new expression in stan model when new_expr_vec = FALSE

    Code
      lpd_not_vec <- log_prior_draws(analysis)

# lprior extracted from model in stan model

    Code
      lpd <- log_prior_draws(analysis)

# joint lprior extracted from model in stan model is identical

    Code
      joint_lpd <- log_prior_draws(analysis)

# warnings piped through when lprior and param lengths don't match

    Code
      lld <- log_lik_draws(analysis)
    Condition
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length
      Warning in `lprior[1] <- log_lik_norm(bSpecies, 0, 2)`:
      number of items to replace is not a multiple of replacement length

