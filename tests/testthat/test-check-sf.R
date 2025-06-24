test_that("analyse.mb_model errors with sf object", {
  skip_if_not_installed("jmbr")

  model <- model(code = "model { bX ~ dnorm(0, 1) }")
  sf_data <- data.frame(x = 1:3, y = 4:6)
  class(sf_data) <- c("sf", "data.frame") # Simulate an sf object

  set_analysis_mode("check")
  expect_error(
    analyse(model, data = sf_data, niters = 10),
    regexp = "data must not be an sf object.",
    fixed = TRUE
  )
})
