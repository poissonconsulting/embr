context("model")

test_that("model", {
  code <- mb_code(.tmb_template)
  model <- model(code, .gen_inits)

  expect_s3_class(model, "tmb_model")
  expect_identical(template(model), .tmb_template)

  expect_identical(model, model(.tmb_template, .gen_inits))

  expect_error(model(code, .gen_inits, select_data = 1))
  expect_s3_class(model(code, .gen_inits, select_data = list(Count = 1L)), "tmb_model")
  expect_error(model(code, .gen_inits, select_data = list(Count = 1L),
                         scale = "z"), "values in scale must also be in names of select_data")
  expect_error(model(code, gen_inits = list(a = 1, b = 1:2), random_effects = "c"),
               "gen_inits must be a function")
  expect_error(model(code, gen_inits = function() list(a = 1, b = 1:2), random_effects = "c"), "gen_inits must take a single argument")
  expect_error(model(code, gen_inits = function(data) list(a = 1, b = 1:2), random_effects = "c"), "random_effects must be a named list")
  expect_error(model(code, gen_inits = function(data) list(a = 1, b = 1:2), random_effects = list(c = "bYear")), "random effects parameters missing from code parameters")
  expect_error(model(code, gen_inits = function(data) list(a = 1, b = 1:2), select_data = list(x = 1), random_effects = list(b = c("Year"))), "elements in random_effects must also be in names of select_data")
  expect_error(model(code, gen_inits = function(data) list(a = 1, b = 1:2), select_data = list(Year = 1), random_effects = list(b = c("Year"))), "random effects parameters missing from code")
  expect_error(model(code, gen_inits = function(data) list(a = 1, b = 1:2), select_data = list(Year = 1), scale = "Year", random_effects = list(b = c("Year"))), "elements in random_effects must not be in values of scale")
  expect_is(model(code, .gen_inits, latex = c(bIntercept = "\\beta")), "tmb_model")
  expect_error(model(code, .gen_inits, latex = c(bIntercept2 = "\\beta")), "latex parameters missing from code parameters")
})

test_that("update_model", {
  code <- mb_code(.tmb_template)
  model <- model(code, .gen_inits)

  model2 <- update_model(model, center = "x")
  expect_false(identical(model, model2))
  model2 <- update_model(model2, center = character(0))
  expect_identical(model, model2)
})

test_that("describe", {
  code <- mb_code(.tmb_template)
  model <- model(code, .gen_inits)

  expect_identical(describe(model), dplyr::data_frame(parameter = character(0), description = character(0)))

  model <- update_model(model, description = c(bIntercept = "The intercept bIntercept intercept"))

  expect_identical(describe(model), dplyr::data_frame(parameter = "bIntercept", description = "The intercept bIntercept intercept"))

  expect_error(describe(model, latex = TRUE), "latex is undefined for x")

  expect_identical(describe(model, quote = "`"), dplyr::data_frame(parameter = "`bIntercept`", description = "The intercept `bIntercept` intercept"))

  model <- update_model(model, latex = c(bIntercept = "\\beta"))

  expect_identical(describe(model, latex = TRUE), dplyr::data_frame(parameter = "$\\beta$", description = "The intercept $\\beta$ intercept"))

  expect_identical(describe(model, latex = TRUE, quote = "'"), dplyr::data_frame(parameter = "'$\\beta$'", description = "The intercept '$\\beta$' intercept"))

 model <- update_model(model, description = c("bIntercept[i]" = "The intercept bIntercept intercept"))

  expect_identical(describe(model, latex = TRUE), dplyr::data_frame(parameter = "$\\beta_{i}$", description = "The intercept $\\beta$ intercept"))

  expect_identical(describe(model, latex = TRUE, quote = "'"), dplyr::data_frame(parameter = "'$\\beta_{i}$'", description = "The intercept '$\\beta$' intercept"))
})

