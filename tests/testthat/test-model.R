test_that("model construction", {
  local_edition(3)

  template <- "model{"

  lifecycle::expect_deprecated(old_model <- model(template))
  expect_equal(
    old_model,
    model(code = template)
  )
})

test_that("model pars", {
  skip_if_not_installed("jmbr")

  template <- "model{

  bIntercept ~ dnorm(0, 5^-2)
  bYear ~ dnorm(0, 5^-2)

  bHabitatQuality[1] <- 0
  for(i in 2:nHabitatQuality) {
    bHabitatQuality[i] ~ dnorm(0, 5^-2)
  }

  log_sSiteYear ~ dnorm(0, 5^-2) # xxx # yyy
  log_sDensity ~ dnorm(0, 5^-2)

  log(sSiteYear) <- log_sSiteYear
  log(sDensity) <- log_sDensity

  for(i in 1:nSite) {
    for(j in 1:nYearFactor) {
      bSiteYear[i,j] ~ dnorm(0, sSiteYear^-2)
    }
  }

  for(i in 1:length(Density)) {
    eDensity[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
    Density[i] ~ dlnorm(eDensity[i], sDensity^-2)
  }
}"

  new_expr <- "
  for(i in 1:length(Density)) {
    prediction[i] <- exp(bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]])
} "

  model <- model(code = template,
                 select_data = list("Year+" = numeric(), YearFactor = factor(),
                                    Site = factor(), Density = numeric(),
                                    HabitatQuality = factor()),
                 fixed = "^(b|l)", derived = "eDensity",
                 random_effects = list(bSiteYear = c("Site", "YearFactor")),
                 new_expr = new_expr)

  expect_identical(class(model), c("jmb_model", "mb_model"))

  expect_identical(length(pars(model, "raw")), 24L)
  expect_identical(length(pars(model, "all")), 9L)
  expect_identical(length(pars(model, "fixed")), 7L)
  expect_identical(length(pars(model, "primary")), 8L)
  expect_identical(pars(model, "random"), "bSiteYear")
  expect_identical(pars(model, "derived"), "eDensity")
})

test_that("model pars ", {
  skip_if_not_installed("jmbr")

  template <- "model{

  bIntercept ~ dnorm(0, 5^-2)
  bYear ~ dnorm(0, 5^-2)

  bHabitatQuality[1] <- 0
  for(i in 2:nHabitatQuality) {
    bHabitatQuality[i] ~ dnorm(0, 5^-2)
  }

  log_sSiteYear ~ dnorm(0, 5^-2) # xxx # yyy
  log_sDensity ~ dnorm(0, 5^-2)

  log(sSiteYear) <- log_sSiteYear
  log(sDensity) <- log_sDensity

  for(i in 1:nSite) {
    for(j in 1:nYearFactor) {
      rSiteYear[i,j] ~ dnorm(0, sSiteYear^-2)
    }
  }

  for(i in 1:length(Density)) {
    bDensity[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + rSiteYear[Site[i], YearFactor[i]]
    Density[i] ~ dlnorm(bDensity[i], sDensity^-2)
  }
}"

  new_expr <- "
  for(i in 1:length(Density)) {
    prediction[i] <- exp(bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + rSiteYear[Site[i], YearFactor[i]])
} "

  model <- model(code = template,
                 select_data = list("Year+" = numeric(), YearFactor = factor(),
                                    Site = factor(), Density = numeric(),
                                    HabitatQuality = factor()),
                 fixed = "^(b|log_)", derived = "bDensity",
                 random_effects = list(rSiteYear = c("Site", "YearFactor")),
                 new_expr = new_expr)

  expect_identical(class(model), c("jmb_model", "mb_model"))

  expect_identical(length(pars(model, "raw")), 24L)
  expect_identical(length(pars(model, "all")), 7L)
  expect_identical(length(pars(model, "fixed")), 5L)
  expect_identical(length(pars(model, "primary")), 6L)
  expect_identical(pars(model, "random"), "rSiteYear")
  expect_identical(pars(model, "derived"), "bDensity")
})

