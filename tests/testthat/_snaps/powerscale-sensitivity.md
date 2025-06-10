# powerscale_sensitivity() works for jags model, values set in new expression

    Code
      powerscale_sensitivity(analysis)
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001      0.074         -
       bSpecies[2] 0.001      0.109         -
             sMass 0.000      0.134         -

# powerscale_sensitivity() works for jags model, values set in model

    Code
      powerscale_sensitivity(analysis)
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001      0.074         -
       bSpecies[2] 0.001      0.109         -
             sMass 0.000      0.134         -

# powerscale_sensitivity() errors for jags model, values set both new expr and model

    Code
      powerscale_sensitivity(analysis)
    Condition
      Warning in `log_prior_fn()`:
      `lprior` is defined both as a parameter within the model and in the new expression. Change `lprior` in the new expression to `elprior`, and supply `log_prior_name = 'elprior'` to the function.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'lprior' must match at least one of the following variables in expr: 'eMass'.

# powerscale_sensitivity() works for stan model, values set in new expression

    Code
      powerscale_sensitivity(analysis)
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001      0.094         -
       bSpecies[2] 0.001      0.101         -
             sMass 0.000      0.147         -

# powerscale_sensitivity() works for stan model, values set in model

    Code
      powerscale_sensitivity(analysis)
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001      0.094         -
       bSpecies[2] 0.001      0.101         -
             sMass 0.000      0.147         -

# powerscale_sensitivity() errors for stan model, values set both new expr and model

    Code
      powerscale_sensitivity(analysis)
    Condition
      Warning in `log_prior_fn()`:
      `lprior` is defined both as a parameter within the model and in the new expression. Change `lprior` in the new expression to `elprior`, and supply `log_prior_name = 'elprior'` to the function.
      Error in `mcmc_derive_fun()`:
      ! `monitor` 'lprior' must match at least one of the following variables in expr: 'eMass'.

# can subset variables to check

    Code
      powerscale_sensitivity(analysis, variable = "sMass")
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
       variable prior likelihood diagnosis
          sMass     0      0.134         -

---

    Code
      powerscale_sensitivity(analysis, variable = "bSpecies")
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001      0.074         -
       bSpecies[2] 0.001      0.109         -

# can change components to check

    Code
      powerscale_sensitivity(analysis, component = "prior")
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1] 0.001         NA         -
       bSpecies[2] 0.001         NA         -
             sMass 0.000         NA         -

---

    Code
      powerscale_sensitivity(analysis, component = "likelihood")
    Output
      Sensitivity based on cjs_dist
      Prior selection: all priors
      Likelihood selection: all data
      
          variable prior likelihood diagnosis
       bSpecies[1]    NA      0.074        NA
       bSpecies[2]    NA      0.109        NA
             sMass    NA      0.134        NA

# can change sensitivity threshold

    Code
      ps1 <- powerscale_sensitivity(analysis, sensitivity_threshold = 0.1)

---

    Code
      ps2 <- powerscale_sensitivity(analysis, sensitivity_threshold = 1e-04)

# errors if you try to change log_lik_fn

    Code
      powerscale_sensitivity(analysis, log_lik_fn = llf2)
    Condition
      Error in `create_priorsense_data.default()`:
      ! formal argument "log_lik_fn" matched by multiple actual arguments

# errors if you try to change log_prior_fn

    Code
      powerscale_sensitivity(analysis, log_lik_fn = lpf2)
    Condition
      Error in `create_priorsense_data.default()`:
      ! formal argument "log_lik_fn" matched by multiple actual arguments

