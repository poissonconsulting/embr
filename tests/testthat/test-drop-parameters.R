context("drop-parameters")

test_that("drop_parameters", {

  new_expr = " fit2 <- a + b * x
                    fit <- a + b * x + bYear[Year]
                     residual <- y - fit
                     prediction <- fit"

  expect_identical(drop_parameters(new_expr), new_expr)
  expect_identical(drop_parameters(new_expr, "ab"), new_expr)
  expect_match(drop_parameters(new_expr, "a"), "fit [<][-] 0 [+] b [*] x +")
  expect_match(drop_parameters(new_expr, "a"), "fit2 [<][-] 0 [+] b [*] x")
  expect_match(drop_parameters(new_expr, c("a", "b")), "fit2 [<][-] 0 [+] 0 [*] x")
})
