test_that("check_pmbr()", {
  local_edition(3)

  expect_silent(check_pmbr(expr({
    bY ~ dnorm(0, sd = 2)
    bX ~ dlnorm(0.1, sd = 2)
    sY ~ T(dnorm(0, sd = 2), 0, )

    for (i in 1:nObs) {
      eY[i] <- bY + bX * X[i]
      Y[i] ~ dtnorm(eY[i], sd = sY, 10)
    }
  })))
})

cli::test_that_cli("check_pmbr() errors",
  {
    local_edition(3)
    expect_snapshot(error = TRUE, {
      check_pmbr(expr({
        bY ~ dnorm(0, 2^-2)
        bX ~ dnorm(0, 2^-2)
        sY ~ T(dnorm(0, 2^-2), 0, )

        for (i in 1:nObs) {
          eY[i] <- bY + bX * X[i]
          Y[i] ~ dnorm(eY[i], sY^-2)
        }
      }))
    })
    # For some reason this makes a difference, depending on whether it is run
    # in a snapshot or outside
    expect_error({
      check_pmbr(expr({
        bY ~ dnorm(0, sd = 2^-2)
      }))
    })
    expect_snapshot(error = TRUE, {
      check_pmbr(expr({
        bY ~ dnorm(0, sd = 2^-2)
      }))
    })

    expect_snapshot(error = TRUE, {
      check_pmbr(expr({
        bY ~ dnorm(0, sd = 1 / 2^2)
      }))
    })
  },
  configs = "plain"
)
