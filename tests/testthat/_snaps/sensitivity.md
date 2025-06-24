# sensitivity summarizes by 'all' for JAGS model

    Code
      sensitivity(analysis, by = "all")
    Output
        all        prior likelihood
      1 all 0.0005150492 0.09216081

# sensitivity summarizes by 'parameter' for JAGS model

    Code
      sensitivity(analysis, by = "parameter")
    Output
        parameter        prior likelihood
      1  bSpecies 0.0005150492 0.09216081
      2     sMass 0.0002524377 0.13445658

# sensitivity summarizes by 'term' for JAGS model

    Code
      sensitivity(analysis, by = "term")
    Output
               term        prior likelihood diagnosis
      1 bSpecies[1] 0.0005150492 0.11300225         -
      2 bSpecies[2] 0.0004971709 0.09216081         -
      3       sMass 0.0002524377 0.13445658         -

# sensitivity summarizes by 'all' for Stan model

    Code
      sensitivity(analysis, by = "all")
    Output
        all       prior likelihood
      1 all 0.000557118 0.09484428

# sensitivity summarizes by 'parameter' for Stan model

    Code
      sensitivity(analysis, by = "parameter")
    Output
        parameter        prior likelihood
      1  bSpecies 0.0005571180 0.09484428
      2     sMass 0.0001445927 0.11332948

# sensitivity summarizes by 'term' for Stan model

    Code
      sensitivity(analysis, by = "term")
    Output
               term        prior likelihood diagnosis
      1 bSpecies[1] 0.0005571180 0.09878804         -
      2 bSpecies[2] 0.0004980258 0.09484428         -
      3       sMass 0.0001445927 0.11332948         -

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

