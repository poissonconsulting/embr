test_that("drop_pars", {
  new_expr <- " fit2 <- a + b * x
                    fit <- a + b * x + bYear[Year]
                     residual <- y - fit
                     prediction <- fit"

  expect_identical(drop_pars(new_expr), new_expr)
  expect_identical(drop_pars(new_expr, "ab"), new_expr)
  expect_match(drop_pars(new_expr, "a"), "fit [<][-] 0 [+] b [*] x +")
  expect_match(drop_pars(new_expr, "a"), "fit2 [<][-] 0 [+] b [*] x")
  expect_match(drop_pars(new_expr, c("a", "b")), "fit2 [<][-] 0 [+] 0 [*] x")
  expect_error(drop_pars(new_expr, c("bYear")), "pars must be scalar")
  expect_error(drop_pars(new_expr, c("bYear[1]")), "pars must be scalar")
})

test_that("drop_pars for expressions", {
  local_edition(3)

  new_expr <- rlang::expr({
    fit2 <- a + b * x
    fit <- a + b * x + bYear[Year]
    residual <- y - fit
    prediction <- fit
  })

  expect_snapshot({
    drop_pars(new_expr)
    drop_pars(new_expr, "ab")
    drop_pars(new_expr, "a")
    drop_pars(new_expr, c("a", "b"))
  })

  expect_error(drop_pars(new_expr, c("bYear")), "pars must be scalar")
  expect_error(drop_pars(new_expr, c("bYear[1]")), "pars must be scalar")
})
