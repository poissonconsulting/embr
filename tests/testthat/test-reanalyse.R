test_that("reanalyse passes seed to analyse", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  seeds <- integer()
  local_mocked_bindings(
    analyse = function(x, data, ..., seed) {
      seeds <<- c(seeds, seed)
      analysis
    }
  )

  reanalyse(
    analysis,
    rhat = 1,
    nreanalyses = 2L,
    glance = FALSE,
    beep = FALSE,
    seed = 3L
  )

  expect_identical(seeds, c(3L, 3L))
})

test_that("reanalyse errors if seed is not a positive whole number", {
  analysis <- readRDS(
    file = system.file(
      package = "embr",
      "test-objects/analysis_jags_newexpr.RDS"
    )
  )

  expect_snapshot(
    reanalyse(analysis, glance = FALSE, beep = FALSE, seed = 0L),
    error = TRUE
  )
})
