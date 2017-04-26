context("mb-code")

test_that("mb_code", {
  expect_error(mb_code("blah blah"), "template type is unrecognised")
  expect_is(mb_code(.tmb_template), "tmb_code")
  expect_is(mb_code("response ~ alpha"), "lmb_code")
  expect_is(mb_code("
                    count / area ~ alpha:beta"), "lmb_code")
})

test_that("template", {
  require(stringr, quietly = TRUE)
  require(magrittr, quietly = TRUE)
  code <- mb_code(.tmb_template)
  expect_identical(template(code), .tmb_template)
  template(code) %<>% str_replace_all("nll", "negll")
  expect_identical(template(code), str_replace_all(.tmb_template, "nll", "negll"))
})
