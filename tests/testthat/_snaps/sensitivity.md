# sensitivity summarizes by 'all' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "all"), across(c(prior, likelihood), function(
        x) signif(x, digits = 4)))
    Output
      # A tibble: 2 x 5
        nterms prior likelihood weak_prior strong_data
         <int> <dbl>      <dbl> <lgl>      <lgl>      
      1      1 0          0.092 TRUE       FALSE      
      2      2 0.001      0.113 TRUE       TRUE       

# sensitivity summarizes by 'parameter' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "parameter"), across(c(prior, likelihood),
      function(x) signif(x, digits = 4)))
    Output
      # A tibble: 3 x 6
        parameter nterms prior likelihood weak_prior strong_data
        <chr>      <int> <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies       1 0          0.092 TRUE       FALSE      
      2 bSpecies       1 0.001      0.113 TRUE       TRUE       
      3 sMass          1 0          0.134 TRUE       TRUE       

# sensitivity summarizes by 'term' for JAGS model

    Code
      mutate(sensitivity(analysis, by = "term"), across(c(prior, likelihood),
      function(x) signif(x, digits = 4)))
    Output
      # A tibble: 3 x 6
        parameter term        prior likelihood weak_prior strong_data
        <chr>     <term>      <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies  bSpecies[1] 0.001      0.113 TRUE       TRUE       
      2 bSpecies  bSpecies[2] 0          0.092 TRUE       FALSE      
      3 sMass     sMass       0          0.134 TRUE       TRUE       

# sensitivity summarizes by 'all' for Stan model

    Code
      mutate(sensitivity(analysis, by = "all"), across(c(prior, likelihood), function(
        x) signif(x, digits = 4)))
    Output
      # A tibble: 2 x 5
        nterms prior likelihood weak_prior strong_data
         <int> <dbl>      <dbl> <lgl>      <lgl>      
      1      2 0.001      0.095 TRUE       FALSE      
      2      1 0          0.113 TRUE       TRUE       

# sensitivity summarizes by 'parameter' for Stan model

    Code
      mutate(sensitivity(analysis, by = "parameter"), across(c(prior, likelihood),
      function(x) signif(x, digits = 4)))
    Output
      # A tibble: 2 x 6
        parameter nterms prior likelihood weak_prior strong_data
        <chr>      <int> <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies       2 0.001      0.095 TRUE       FALSE      
      2 sMass          1 0          0.113 TRUE       TRUE       

# sensitivity summarizes by 'term' for Stan model

    Code
      mutate(sensitivity(analysis, by = "term"), across(c(prior, likelihood),
      function(x) signif(x, digits = 4)))
    Output
      # A tibble: 3 x 6
        parameter term        prior likelihood weak_prior strong_data
        <chr>     <term>      <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies  bSpecies[1] 0.001      0.099 TRUE       FALSE      
      2 bSpecies  bSpecies[2] 0          0.095 TRUE       FALSE      
      3 sMass     sMass       0          0.113 TRUE       TRUE       

# sensitivity param_type = 'fixed' by term for JAGS RE model

    Code
      mutate(sensitivity(analysis, by = "term", param_type = "fixed"), across(c(prior,
        likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 4 x 6
        parameter term        prior likelihood weak_prior strong_data
        <chr>     <term>      <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies  bSpecies[1] 0.004      0.027 TRUE       FALSE      
      2 bSpecies  bSpecies[2] 0.004      0.028 TRUE       FALSE      
      3 sMass     sMass       0.001      0.14  TRUE       TRUE       
      4 sYear     sYear       0.017      0.023 TRUE       FALSE      

# sensitivity param_type = 'random' by term for JAGS RE model

    Code
      mutate(sensitivity(analysis, by = "term", param_type = "random"), across(c(
        prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 10 x 6
         parameter term      prior likelihood weak_prior strong_data
         <chr>     <term>    <dbl>      <dbl> <lgl>      <lgl>      
       1 bYear     bYear[1]  0.004      0.018 TRUE       FALSE      
       2 bYear     bYear[2]  0.004      0.028 TRUE       FALSE      
       3 bYear     bYear[3]  0.004      0.027 TRUE       FALSE      
       4 bYear     bYear[4]  0.004      0.026 TRUE       FALSE      
       5 bYear     bYear[5]  0.004      0.024 TRUE       FALSE      
       6 bYear     bYear[6]  0.004      0.026 TRUE       FALSE      
       7 bYear     bYear[7]  0.004      0.021 TRUE       FALSE      
       8 bYear     bYear[8]  0.003      0.028 TRUE       FALSE      
       9 bYear     bYear[9]  0.004      0.021 TRUE       FALSE      
      10 bYear     bYear[10] 0.003      0.026 TRUE       FALSE      

# sensitivity param_type = 'fixed' by parameter for JAGS RE model

    Code
      mutate(sensitivity(analysis, by = "parameter", param_type = "fixed"), across(c(
        prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 3 x 6
        parameter nterms prior likelihood weak_prior strong_data
        <chr>      <int> <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies       2 0.004      0.027 TRUE       FALSE      
      2 sMass          1 0.001      0.14  TRUE       TRUE       
      3 sYear          1 0.017      0.023 TRUE       FALSE      

# sensitivity param_type = 'fixed' by term for Stan RE model

    Code
      mutate(sensitivity(analysis, by = "term", param_type = "fixed"), across(c(prior,
        likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 4 x 6
        parameter term        prior likelihood weak_prior strong_data
        <chr>     <term>      <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies  bSpecies[1] 0.003      0.046 TRUE       FALSE      
      2 bSpecies  bSpecies[2] 0.003      0.045 TRUE       FALSE      
      3 sMass     sMass       0.001      0.118 TRUE       TRUE       
      4 sYear     sYear       0.014      0.039 TRUE       FALSE      

# sensitivity param_type = 'random' by term for Stan RE model

    Code
      mutate(sensitivity(analysis, by = "term", param_type = "random"), across(c(
        prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 10 x 6
         parameter term      prior likelihood weak_prior strong_data
         <chr>     <term>    <dbl>      <dbl> <lgl>      <lgl>      
       1 bYear     bYear[1]  0.003      0.05  TRUE       FALSE      
       2 bYear     bYear[2]  0.002      0.037 TRUE       FALSE      
       3 bYear     bYear[3]  0.003      0.046 TRUE       FALSE      
       4 bYear     bYear[4]  0.002      0.044 TRUE       FALSE      
       5 bYear     bYear[5]  0.003      0.045 TRUE       FALSE      
       6 bYear     bYear[6]  0.003      0.054 TRUE       FALSE      
       7 bYear     bYear[7]  0.003      0.051 TRUE       FALSE      
       8 bYear     bYear[8]  0.003      0.049 TRUE       FALSE      
       9 bYear     bYear[9]  0.002      0.052 TRUE       FALSE      
      10 bYear     bYear[10] 0.003      0.045 TRUE       FALSE      

# sensitivity param_type = 'fixed' by parameter for Stan RE model

    Code
      mutate(sensitivity(analysis, by = "parameter", param_type = "fixed"), across(c(
        prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 3 x 6
        parameter nterms prior likelihood weak_prior strong_data
        <chr>      <int> <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies       2 0.003      0.045 TRUE       FALSE      
      2 sMass          1 0.001      0.118 TRUE       TRUE       
      3 sYear          1 0.014      0.039 TRUE       FALSE      

# sensitivity param_type = 'derived' by term for Stan RE model

    Code
      mutate(sensitivity(analysis, by = "term", param_type = "derived"), across(c(
        prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 1 x 6
        parameter term   prior likelihood weak_prior strong_data
        <chr>     <term> <dbl>      <dbl> <lgl>      <lgl>      
      1 ratio     ratio      0      0.074 TRUE       FALSE      

# sensitivity param_type = 'primary' by parameter for Stan RE model

    Code
      mutate(sensitivity(analysis, by = "parameter", param_type = "primary"), across(
        c(prior, likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 4 x 6
        parameter nterms prior likelihood weak_prior strong_data
        <chr>      <int> <dbl>      <dbl> <lgl>      <lgl>      
      1 bSpecies       2 0.003      0.045 TRUE       FALSE      
      2 bYear         10 0.003      0.037 TRUE       FALSE      
      3 sMass          1 0.001      0.118 TRUE       TRUE       
      4 sYear          1 0.014      0.039 TRUE       FALSE      

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

# sensitivity errors if `param_type` is not a string

    Code
      sensitivity(analysis, param_type = 10)
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `param_type` must be a string (non-missing character scalar).

# sensitivity errors if `param_type` is NA

    Code
      sensitivity(analysis, param_type = NA)
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `param_type` must be a string (non-missing character scalar).

# sensitivity errors if `param_type` is character(0)

    Code
      sensitivity(analysis, param_type = character(0))
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `param_type` must be a string (non-missing character scalar).

# sensitivity errors if `param_type` is not valid

    Code
      sensitivity(analysis, param_type = "other")
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `param_type` must match 'all', 'derived', 'fixed', 'primary' or 'random', not 'other'.

# sensitivity errors if `mb.dcjs` is not a number

    Code
      sensitivity(analysis, mb.dcjs = "high")
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `mb.dcjs` must be a number (non-missing numeric scalar).

# sensitivity errors if `mb.dcjs` is NA

    Code
      sensitivity(analysis, mb.dcjs = NA)
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `mb.dcjs` must be a number (non-missing numeric scalar).

# sensitivity errors if `mb.dcjs` is numeric(0)

    Code
      sensitivity(analysis, mb.dcjs = numeric(0))
    Condition
      Error in `sensitivity.mb_analysis()`:
      ! `mb.dcjs` must be a number (non-missing numeric scalar).

# sensitivity mb.dcjs changes weak_prior and strong_data classification

    Code
      mutate(sensitivity(analysis, by = "all", mb.dcjs = 0.12), across(c(prior,
        likelihood), function(x) signif(x, digits = 4)))
    Output
      # A tibble: 2 x 5
        nterms prior likelihood weak_prior strong_data
         <int> <dbl>      <dbl> <lgl>      <lgl>      
      1      2 0.001      0.092 TRUE       FALSE      
      2      1 0          0.134 TRUE       TRUE       

