test_that("check_pmbr()", {
  local_edition(3)

  expect_silent(check_pmbr(expr({
    bY ~ dnorm(0, sd = 2)
    bX ~ dnorm(0, sd = 2)
    sY ~ T(dnorm(0, sd = 2), 0, )

    for (i in 1:nObs) {
      eY[i] <- bY + bX * X[i]
      Y[i] ~ dnorm(eY[i], sd = sY)
    }
  })))

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
})
