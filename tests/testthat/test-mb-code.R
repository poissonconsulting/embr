test_that("mb_code", {
  expect_warning(mb_code("blah blah"), "template type is unrecognised")
  expect_s3_class(mb_code(.tmb_template), "tmb_code")
  expect_s3_class(mb_code("function() dpois()"), "lmb_code")
})

test_that("template", {
  code <- mb_code(.tmb_template)
  expect_identical(template(code), .tmb_template)
  template(code) <- gsub("nll", "negll", template(code))
  expect_identical(template(code), gsub("nll", "negll", .tmb_template))
})

test_that("expression templates", {
  expect_equal(
    mb_code({}),
    new_mb_code(quote({}), "pmb_code")
  )
})

test_that("class smb2_code", {
  x <- mb_code("parameters{}", stan_engine = "cmdstanr")
  expect_true(inherits(x, "smb2_code"))
})
