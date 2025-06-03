test_that("log_lik_draws.mb_analysis with log_lik in new_expr", {
  # Create mock mb_analysis object with log_lik in new_expr
  mcmcr <- structure(list(a = array(1:10, dim = c(5, 2, 1)),
                         b = array(11:20, dim = c(5, 2, 1))),
                     class = "mcmcr")
  
  new_expr <- quote({
    log_lik <- a + b
  })
  
  model <- list(new_expr = new_expr)
  
  analysis <- list(
    model = model,
    mcmcr = mcmcr
  )
  class(analysis) <- "mb_analysis"
  
  # Mock mcmc_derive to return expected result for log_lik
  with_mock(
    "embr::mcmc_derive" = function(x, term) {
      expect_equal(term, "log_lik")
      structure(list(
        chain1 = array(1:5, dim = c(5, 1)),
        chain2 = array(6:10, dim = c(5, 1))
      ), class = "mcmc.list")
    },
    {
      # Test non-joint output
      draws <- log_lik_draws(analysis, joint = FALSE)
      expect_s3_class(draws, "draws_array")
      
      # Test joint output
      draws_joint <- log_lik_draws(analysis, joint = TRUE)
      expect_s3_class(draws_joint, "draws_array")
      expect_equal(posterior::variables(draws_joint), "log_lik")
    }
  )
})

test_that("log_lik_draws.mb_analysis errors for invalid inputs", {
  # Test error for non-mb_analysis object
  expect_error(log_lik_draws(list()), "Not an mb_analysis object.")
  
  # Create mb_analysis without log_lik
  mcmcr <- structure(list(a = array(1:10, dim = c(5, 2, 1))),
                     class = "mcmcr")
  model <- list(new_expr = quote({}))
  
  analysis <- list(
    model = model,
    mcmcr = mcmcr
  )
  class(analysis) <- "mb_analysis"
  
  # Test error when log_lik is not available
  expect_error(log_lik_draws(analysis), "There is no log likelihood")
})