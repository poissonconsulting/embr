test_that("analyse.mb_model errors with sf object", {
  skip_if_not_installed("sf")
  skip_if_not_installed("jmbr")  # Need a backend for testing

  # Create simple model and sf data for testing
  model <- model(code = "model { bX ~ dnorm(0, 1) }")
  sf_data <- data.frame(x = 1:3, y = 4:6)
  class(sf_data) <- c("sf", "data.frame")  # Simulate an sf object

  # This should error early in the analysis pipeline
  set_analysis_mode("check")
  expect_error(
    analyse(model, data = sf_data, niters = 10),
    regexp = "data must not be an sf object.",
    fixed = TRUE
  )
})
