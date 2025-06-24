# sensitivity summarizes by 'all' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "all"), across(c(prior, likelihood), function(
        x) signif(x, digits = 6)))
    Output
        all       prior likelihood
      1 all 0.000515049  0.0921608

# sensitivity summarizes by 'parameter' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "parameter"), across(c(prior, likelihood),
      function(x) signif(x, digits = 6)))
    Output
        parameter       prior likelihood
      1  bSpecies 0.000515049  0.0921608
      2     sMass 0.000252438  0.1344570

# sensitivity summarizes by 'term' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "term"), across(c(prior, likelihood),
      function(x) signif(x, digits = 6)))
    Output
               term       prior likelihood diagnosis
      1 bSpecies[1] 0.000515049  0.1130020         -
      2 bSpecies[2] 0.000497171  0.0921608         -
      3       sMass 0.000252438  0.1344570         -

# sensitivity summarizes by 'all' for Stan model

    Code
      mutate(sensitivity(analysis, by = "all"), across(c(prior, likelihood), function(
        x) signif(x, digits = 6)))
    Output
        all       prior likelihood
      1 all 0.000557118  0.0948443

# sensitivity summarizes by 'parameter' for Stan model

    Code
      mutate(sensitivity(analysis, by = "parameter"), across(c(prior, likelihood),
      function(x) signif(x, digits = 6)))
    Output
        parameter       prior likelihood
      1  bSpecies 0.000557118  0.0948443
      2     sMass 0.000144593  0.1133290

# sensitivity summarizes by 'term' for Stan model

    Code
      mutate(sensitivity(analysis, by = "term"), across(c(prior, likelihood),
      function(x) signif(x, digits = 6)))
    Output
               term       prior likelihood diagnosis
      1 bSpecies[1] 0.000557118  0.0987880         -
      2 bSpecies[2] 0.000498026  0.0948443         -
      3       sMass 0.000144593  0.1133290         -

# sensitivity errors if x is not an mb_analysis object

    Code
      sensitivity(analysis)
    Condition
      Error in `UseMethod()`:
      ! no applicable method for 'sensitivity' applied to an object of class "data.frame"

# sensitivity errors if `by` is not a string

    Code
      sensitivity(analysis, by = 10)
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `by` must be a string (non-missing character scalar).

# sensitivity errors if `by` is NA

    Code
      sensitivity(analysis, by = NA)
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `by` must be a string (non-missing character scalar).

# sensitivity errors if `by` is character(0)

    Code
      sensitivity(analysis, by = character(0))
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `by` must be a string (non-missing character scalar).

# sensitivity errors if other `by` argument provided

    Code
      sensitivity(analysis, by = "total")
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `by` must match 'all', 'parameter' or 'term', not 'total'.

# sensitivity errors if ... not empty

    Code
      sensitivity(analysis, by = "all", complete = FALSE)
    Condition
      Error in `log_prior_fn()`:
      ! `...` must be unused.

