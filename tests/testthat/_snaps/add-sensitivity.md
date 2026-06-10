# add_sensitivity errors if x is not an mb_analysis object

    Code
      add_sensitivity(data.frame(x = 1:10))
    Condition
      Error in `UseMethod()`:
      ! no applicable method for 'add_sensitivity' applied to an object of class "data.frame"

# add_sensitivity errors if replace is not a flag

    Code
      add_sensitivity(analysis, replace = "yes")
    Condition
      Error in `add_sensitivity.mb_analysis()`:
      ! `replace` must be a flag (TRUE or FALSE).

