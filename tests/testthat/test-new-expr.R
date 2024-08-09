test_that("predict string expression", {
  skip_if_not_installed("jmbr")

  set_analysis_mode("quick")

  data <- embr::density99
  data$YearFactor <- factor(data$Year)

  model <- model(
    code = "model{

  bIntercept ~ dnorm(0, 5^-2)
  bYear ~ dnorm(0, .5^-2) # bYear2 ~ dnorm(0, .5^-2)

  bHabitatQuality[1] <- 0
  for(i in 2:nHabitatQuality) {
    bHabitatQuality[i] ~ dnorm(0, 5.^-2) T(0,)
  }

  log_sSiteYear ~ dlnorm(0, 5^-2)
  log_sDensity ~ dt(0, 5^-2, 4.5)

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
}",
    new_expr = "
  for(i in 1:length(Density)) {
    fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
    log(prediction[i]) <- fit[i]
    residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
  }",
    new_expr_vec = FALSE,
    select_data = list(
      "Year+" = numeric(), YearFactor = factor(),
      Site = factor(), Density = numeric(),
      HabitatQuality = factor()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    random_effects = list(bSiteYear = c("Site", "YearFactor"))
  )

  expect_output(expect_warning(analysis <- analyse(model, data = data)))

  year <- predict(analysis, new_data = "Year")

  expect_is(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  ppc <- posterior_predictive_check(analysis)

  expect_is(ppc, "tbl_df")
  expect_identical(colnames(ppc), c("moment", "observed", "median", "lower", "upper", "svalue"))
  expect_identical(ppc$moment, structure(1:5, .Label = c(
    "zeros", "mean", "variance", "skewness",
    "kurtosis"
  ), class = "factor"))
  dd <- mcmc_derive_data(analysis, new_data = c("Site", "Year"), ref_data = TRUE)
  expect_true(mcmcdata::is.mcmc_data(dd))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})

test_that("predict bare expression", {
  skip_if_not_installed("jmbr")

  set_analysis_mode("quick")

  data <- embr::density99
  data$YearFactor <- factor(data$Year)

  model <- model(
    code = "model{

  bIntercept ~ dnorm(0, 5^-2)
  bYear ~ dnorm(0, .5^-2) # bYear2 ~ dnorm(0, .5^-2)

  bHabitatQuality[1] <- 0
  for(i in 2:nHabitatQuality) {
    bHabitatQuality[i] ~ dnorm(0, 5.^-2) T(0,)
  }

  log_sSiteYear ~ dlnorm(0, 5^-2)
  log_sDensity ~ dt(0, 5^-2, 4.5)

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
}",
    new_expr =
      for (i in 1:length(Density)) {
        fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
        log(prediction[i]) <- fit[i]
        residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      },
    new_expr_vec = FALSE,
    select_data = list(
      "Year+" = numeric(), YearFactor = factor(),
      Site = factor(), Density = numeric(),
      HabitatQuality = factor()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    random_effects = list(bSiteYear = c("Site", "YearFactor"))
  )

  expect_output(expect_warning(analysis <- analyse(model, data = data)))

  year <- predict(analysis, new_data = "Year")

  expect_is(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  ppc <- posterior_predictive_check(analysis)

  expect_is(ppc, "tbl_df")
  expect_identical(colnames(ppc), c("moment", "observed", "median", "lower", "upper", "svalue"))
  expect_identical(ppc$moment, structure(1:5, .Label = c(
    "zeros", "mean", "variance", "skewness",
    "kurtosis"
  ), class = "factor"))
  dd <- mcmc_derive_data(analysis, new_data = c("Site", "Year"), ref_data = TRUE)
  expect_true(mcmcdata::is.mcmc_data(dd))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})
