test_that("get_analysis_mode with no options", {
  local_edition(3)
  expect_snapshot(get_analysis_mode())
})

test_that("get_analysis_mode with debug mode", {
  local_edition(3)
  set_analysis_mode("debug")
  expect_snapshot(get_analysis_mode())
  set_analysis_mode("reset")
})
