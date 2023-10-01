# check_pmbr()

    Code
      check_pmbr(expr({
        bY ~ dnorm(0, 2^(-2))
        bX ~ dnorm(0, 2^(-2))
        sY ~ T(dnorm(0, 2^(-2)), 0, )
        for (i in 1:nObs) {
          eY[i] <- bY + bX * X[i]
          Y[i] ~ dnorm(eY[i], sY^(-2))
        }
      }))
    Error <rlang_error>
      `dnorm` must be used with a named argument `sd`.

---

    Code
      check_pmbr(expr({
        bY ~ dnorm(0, sd = 2^(-2))
      }))
    Error <rlang_error>
      The `sd` argument to `dnorm` must be a standard deviation, not a term like `... ^ (-2)`.

---

    Code
      check_pmbr(expr({
        bY ~ dnorm(0, sd = 1 / 2^2)
      }))
    Error <rlang_error>
      The `sd` argument to `dnorm` must be a standard deviation, not a term like `1 / ...`.

