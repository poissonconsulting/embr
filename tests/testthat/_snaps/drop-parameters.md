# drop_pars for expressions

    Code
      drop_pars(new_expr)
    Output
      {
          fit2 <- a + b * x
          fit <- a + b * x + bYear[Year]
          residual <- y - fit
          prediction <- fit
      }
    Code
      drop_pars(new_expr, "ab")
    Output
      {
          fit2 <- a + b * x
          fit <- a + b * x + bYear[Year]
          residual <- y - fit
          prediction <- fit
      }
    Code
      drop_pars(new_expr, "a")
    Output
      {
          fit2 <- 0 + b * x
          fit <- 0 + b * x + bYear[Year]
          residual <- y - fit
          prediction <- fit
      }
    Code
      drop_pars(new_expr, c("a", "b"))
    Output
      {
          fit2 <- 0 + 0 * x
          fit <- 0 + 0 * x + bYear[Year]
          residual <- y - fit
          prediction <- fit
      }

