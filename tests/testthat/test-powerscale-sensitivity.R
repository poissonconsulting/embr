test_that("powerscale_sensitivity.mb_analysis works with valid inputs", {
  # Create mock mb_analysis object
  mcmcr <- structure(list(a = array(1:10, dim = c(5, 2, 1)),
                          b = array(11:20, dim = c(5, 2, 1))),
                     class = "mcmcr")
  
  model <- list(new_expr = quote({
    log_lik <- a + b
    lprior <- a * b
  }))
  
  analysis <- list(
    model = model,
    mcmcr = mcmcr
  )
  class(analysis) <- "mb_analysis"
  
  # Mock priorsense::powerscale_sensitivity to verify correct parameters are passed
  with_mock(
    "priorsense::powerscale_sensitivity" = function(x, fit, log_lik_fn, log_prior_fn, ...) {
      # Verify input parameters
      expect_true(inherits(x, "mcmc.list"))
      expect_identical(fit, analysis)
      expect_identical(log_lik_fn, log_lik_draws.mb_analysis)
      expect_identical(log_prior_fn, log_prior_draws.mb_analysis)
      
      # Return a mock result
      data.frame(
        variable = c("a", "b"),
        sensitivity = c(0.1, 0.2),
        likelihood_sens = c(0.05, 0.15),
        prior_sens = c(0.05, 0.05)
      )
    },
    {
      # Run the function
      result <- powerscale_sensitivity(analysis)
      
      # Check the result structure
      expect_s3_class(result, "data.frame")
    }
  )
})