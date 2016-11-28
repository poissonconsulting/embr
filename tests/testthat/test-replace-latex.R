context("replace_latex")

test_that("replace latex", {
  term <- c("a", "b", paste0("c", c("[1,1]", "[2,1,44]")))
  expect_identical(replace_latex(term, c(a = "\\alpha", b = "\\beta_{\\lambda}", c = "\\beta Y")),
                   c("$\\alpha$", "$\\beta_{\\lambda}$", "$\\beta Y_{1,1}$", "$\\beta Y_{2,1,44}$"))

  expect_warning(replace_latex(term, c(b = "$\\beta_{\\lambda}$", c = "$\\beta Y$")), "terms missing from latex parameters")
  expect_identical(suppressWarnings(replace_latex(term, c(b = "\\beta_{\\lambda}", c = "\\beta Y"))), c("a", "$\\beta_{\\lambda}$", "$\\beta Y_{1,1}$", "$\\beta Y_{2,1,44}$"))
})
