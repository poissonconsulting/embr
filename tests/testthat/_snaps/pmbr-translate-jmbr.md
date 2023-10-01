# translate_jmbr()

    Code
      translate_jmbr(mb_code({
        bY ~ dnorm(0, sd = 2)
        bX ~ dnorm(0, sd = 2)
        sY ~ T(dnorm(0, sd = 2), 0, )
        for (i in 1:nObs) {
          eY[i] <- bY + bX * X[i]
          Y[i] ~ dnorm(eY[i], sd = sY)
        }
      }))
    Output
      model {
        bY ~ dnorm(0, (2) ^ -2)
        bX ~ dnorm(0, (2) ^ -2)
        sY ~ dnorm(0, (2) ^ -2) T(0, )
        for (i in 1 : nObs) {
          eY[i] <- bY + bX * X[i]
          Y[i] ~ dnorm(eY[i], (sY) ^ -2)
        }
      }

