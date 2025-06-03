test_that("log_prior_draws.mb_analysis with lprior in new_expr", {
  # Create mock mb_analysis object with lprior in new_expr
  mcmcr <- structure(list(a = array(1:10, dim = c(5, 2, 1)),
                         b = array(11:20, dim = c(5, 2, 1))),
                     class = "mcmcr")
  
  new_expr <- quote({
    lprior <- a + b
  })
  
  model <- list(new_expr = new_expr)
  
  analysis <- list(
    model = model,
    mcmcr = mcmcr
  )
  class(analysis) <- "mb_analysis"
  
  # Mock mcmc_derive to return expected result for lprior
  with_mock(
    "embr::mcmc_derive" = function(x, term) {
      expect_equal(term, "lprior")
      structure(list(
        chain1 = array(1:5, dim = c(5, 1)),
        chain2 = array(6:10, dim = c(5, 1))
      ), class = "mcmc.list")
    },
    {
      # Test non-joint output
      draws <- log_prior_draws(analysis, joint = FALSE)
      expect_s3_class(draws, "draws_array")
      
      # Test joint output
      draws_joint <- log_prior_draws(analysis, joint = TRUE)
      expect_s3_class(draws_joint, "draws_array")
      expect_equal(posterior::variables(draws_joint), "lprior")
    }
  )
})

test_that("log_prior_draws.mb_analysis errors for invalid inputs", {
  # Test error for non-mb_analysis object
  expect_error(log_prior_draws(list()), "Not an mb_analysis object.")
  
  # Create mb_analysis without lprior
  mcmcr <- structure(list(a = array(1:10, dim = c(5, 2, 1))),
                     class = "mcmcr")
  model <- list(new_expr = quote({}))
  
  analysis <- list(
    model = model,
    mcmcr = mcmcr
  )
  class(analysis) <- "mb_analysis"
  
  # Test error when lprior is not available
  expect_error(log_prior_draws(analysis), "There is no log prior")
})