test_that("check_pmbr()", {
  expect_silent(check_pmbr(expr({
    bY ~ dnorm(0, sd = 2)
    bX ~ dnorm(0, sd = 2)
    sY ~ T(dnorm(0, sd = 2), 0, )

    for (i in 1:nObs) {
      eY[i] <- bY + bX * X[i]
      Y[i] ~ dnorm(eY[i], sd = sY)
    }
  })))

  expect_error(check_pmbr(expr({
    bY ~ dnorm(0, 2^-2)
    bX ~ dnorm(0, 2^-2)
    sY ~ T(dnorm(0, 2^-2), 0, )

    for (i in 1:nObs) {
      eY[i] <- bY + bX * X[i]
      Y[i] ~ dnorm(eY[i], sY^-2)
    }
  })))
})
