# log_lik extracted from new expression in jags model

    Code
      lld <- log_lik_draws(analysis)

# joint log_lik extracted from new expression in jags model

    Code
      lld_joint <- log_lik_draws(analysis, joint = TRUE)

# errors if log_lik_name doesn't match

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Condition
      Error:
      ! There is no log likelihood parameter monitored by the model or present in the new expression.

---

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Condition
      Error:
      ! There is no log likelihood parameter monitored by the model or present in the new expression.

---

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Condition
      Error:
      ! There is no log likelihood parameter monitored by the model or present in the new expression.

---

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Condition
      Error:
      ! There is no log likelihood parameter monitored by the model or present in the new expression.

# log_lik extracted if different name

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 100 variables
      , , variable = elog_lik[1]
      
               chain
      iteration    1    2    3
              1 -4.7 -4.6 -4.7
              2 -4.9 -5.2 -4.9
              3 -5.0 -5.1 -4.7
              4 -4.9 -4.8 -4.7
              5 -5.1 -4.8 -5.0
      
      , , variable = elog_lik[2]
      
               chain
      iteration    1    2    3
              1 -4.6 -4.5 -4.7
              2 -4.8 -5.1 -4.8
              3 -4.9 -4.9 -4.6
              4 -4.8 -4.7 -4.6
              5 -5.0 -4.7 -4.9
      
      , , variable = elog_lik[3]
      
               chain
      iteration    1    2    3
              1 -4.5 -4.4 -4.6
              2 -4.7 -5.0 -4.7
              3 -4.8 -4.8 -4.5
              4 -4.7 -4.6 -4.5
              5 -4.9 -4.6 -4.8
      
      , , variable = elog_lik[4]
      
               chain
      iteration    1    2    3
              1 -4.4 -4.4 -4.5
              2 -4.6 -4.9 -4.6
              3 -4.7 -4.7 -4.4
              4 -4.6 -4.5 -4.5
              5 -4.8 -4.5 -4.7
      
      # ... with 995 more iterations, and 96 more variables

---

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 100 variables
      , , variable = elog_lik[1]
      
               chain
      iteration    1    2    3
              1 -5.2 -5.3 -5.3
              2 -5.0 -5.6 -4.9
              3 -5.0 -5.4 -5.0
              4 -5.1 -5.6 -5.1
              5 -4.8 -4.9 -4.9
      
      , , variable = elog_lik[2]
      
               chain
      iteration    1    2    3
              1 -5.1 -5.2 -5.2
              2 -4.9 -5.4 -4.8
              3 -4.9 -5.3 -4.9
              4 -5.0 -5.5 -4.9
              5 -4.7 -4.8 -4.8
      
      , , variable = elog_lik[3]
      
               chain
      iteration    1    2    3
              1 -5.0 -5.0 -5.0
              2 -4.8 -5.3 -4.7
              3 -4.8 -5.1 -4.8
              4 -4.9 -5.3 -4.8
              5 -4.6 -4.6 -4.6
      
      , , variable = elog_lik[4]
      
               chain
      iteration    1    2    3
              1 -4.9 -4.9 -4.9
              2 -4.7 -5.1 -4.6
              3 -4.7 -5.0 -4.7
              4 -4.7 -5.2 -4.7
              5 -4.5 -4.5 -4.6
      
      # ... with 995 more iterations, and 96 more variables

# log_lik extracted from new expression in jags model when new_expr_vec = FALSE

    Code
      lld_not_vec <- log_lik_draws(analysis)

# log_lik extracted from model in jags model

    Code
      lld <- log_lik_draws(analysis)

# joint log_lik extracted from model in jags model is identical

    Code
      joint_lld <- log_lik_draws(analysis)

# errors and warning issued when trying to define lprior in both new expr and model

    Code
      log_lik_draws(analysis)
    Condition
      Warning in `log_lik_draws.mb_analysis()`:
      `log_lik` is defined as a parameter within the model and in the new expression; the definition in the new expression will take precedence.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'log_lik' must match at least one of the following variables in expr: 'i' or 'eMass'.

# suggestion from warning when defining log_lik in two places works

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 100 variables
      , , variable = elog_lik[1]
      
               chain
      iteration    1    2    3
              1 -5.2 -5.2 -5.1
              2 -5.0 -4.7 -4.9
              3 -4.9 -5.1 -5.2
              4 -5.0 -5.4 -5.1
              5 -4.9 -5.2 -5.0
      
      , , variable = elog_lik[2]
      
               chain
      iteration    1    2    3
              1 -5.1 -5.1 -5.0
              2 -4.9 -4.6 -4.8
              3 -4.7 -5.0 -5.1
              4 -4.9 -5.3 -5.0
              5 -4.8 -5.1 -4.8
      
      , , variable = elog_lik[3]
      
               chain
      iteration    1    2    3
              1 -4.9 -4.9 -4.9
              2 -4.8 -4.5 -4.7
              3 -4.6 -4.9 -5.0
              4 -4.8 -5.1 -4.9
              5 -4.6 -4.9 -4.7
      
      , , variable = elog_lik[4]
      
               chain
      iteration    1    2    3
              1 -4.8 -4.8 -4.8
              2 -4.7 -4.4 -4.6
              3 -4.5 -4.7 -4.9
              4 -4.7 -5.0 -4.7
              5 -4.5 -4.8 -4.6
      
      # ... with 995 more iterations, and 96 more variables

---

    Code
      log_lik_draws(analysis, log_lik_name = "elog_lik")
    Output
      # A draws_array: 1000 iterations, 3 chains, and 100 variables
      , , variable = elog_lik[1]
      
               chain
      iteration    1    2    3
              1 -5.2 -5.2 -4.9
              2 -4.9 -5.3 -5.2
              3 -4.9 -4.5 -5.2
              4 -4.9 -4.7 -4.9
              5 -4.8 -4.6 -5.1
      
      , , variable = elog_lik[2]
      
               chain
      iteration    1    2    3
              1 -5.0 -5.1 -4.8
              2 -4.7 -5.2 -5.1
              3 -4.8 -4.5 -5.1
              4 -4.8 -4.6 -4.8
              5 -4.7 -4.6 -5.0
      
      , , variable = elog_lik[3]
      
               chain
      iteration    1    2    3
              1 -4.9 -5.0 -4.7
              2 -4.6 -5.1 -4.9
              3 -4.7 -4.4 -4.9
              4 -4.7 -4.6 -4.7
              5 -4.6 -4.5 -4.9
      
      , , variable = elog_lik[4]
      
               chain
      iteration    1    2    3
              1 -4.8 -4.9 -4.6
              2 -4.5 -5.0 -4.8
              3 -4.6 -4.3 -4.8
              4 -4.6 -4.5 -4.6
              5 -4.5 -4.4 -4.7
      
      # ... with 995 more iterations, and 96 more variables

# log_lik extracted from new expression in stan model

    Code
      lld <- log_lik_draws(analysis)

# joint log_lik extracted from new expression in stan model

    Code
      lld_joint <- log_lik_draws(analysis, joint = TRUE)

# log_lik extracted from new expression in stan model when new_expr_vec = FALSE

    Code
      lld_not_vec <- log_lik_draws(analysis)

# log_lik extracted from model in stan model

    Code
      lld <- log_lik_draws(analysis)

# joint log_lik extracted from model in stan model is identical

    Code
      joint_lld <- log_lik_draws(analysis)

# errors and warning issued when trying to define log_lik in both new expr and model

    Code
      log_lik_draws(analysis)
    Condition
      Warning in `log_lik_draws.mb_analysis()`:
      `log_lik` is defined as a parameter within the model and in the new expression; the definition in the new expression will take precedence.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'log_lik' must match at least one of the following variables in expr: 'i' or 'eMass'.

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

