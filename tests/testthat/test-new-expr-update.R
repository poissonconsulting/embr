test_that("update new expr string expression", {
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

  model <- update_model(model,
    new_expr = "
            {
          fit <- bIntercept + bYear * Year + bHabitatQuality[HabitatQuality] +
              bSiteYear[cbind(Site, YearFactor)]
          log(prediction) <- fit
          residual <- res_lnorm(Density, fit, exp(log_sDensity))
      }"
  )
  expect_warning(expect_warning(analysis <- analyse(model, data = data, glance = FALSE)))

  expect_identical(pars(analysis, "derived"), "eDensity")
  expect_identical(pars(analysis, "random"), "bSiteYear")
  expect_identical(length(pars(analysis, "raw")), 26L)
  expect_identical(length(pars(analysis, "all")), 7L)
  expect_identical(length(pars(analysis, "fixed")), 5L)

  year <- predict(analysis, new_data = "Year")

  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})


test_that("update new expr bare expression", {
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

  model <- update_model(model,
    new_expr = {
      fit <- bIntercept + bYear * Year + bHabitatQuality[HabitatQuality] +
        bSiteYear[cbind(Site, YearFactor)]
      log(prediction) <- fit
      residual <- res_lnorm(Density, fit, exp(log_sDensity))
    }
  )
  expect_warning(expect_warning(analysis <- analyse(model, data = data, glance = FALSE)))

  year <- predict(analysis, new_data = "Year")

  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})

test_that("add new_expr_vec argument to update model", {
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
    new_expr_vec = TRUE,
    select_data = list(
      "Year+" = numeric(), YearFactor = factor(),
      Site = factor(), Density = numeric(),
      HabitatQuality = factor()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    random_effects = list(bSiteYear = c("Site", "YearFactor"))
  )

  model <- update_model(
    model,
    new_expr =
      "
      for(i in 1:length(Density)) {
        fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
        log(prediction[i]) <- fit[i]
        residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      }",
    new_expr_vec = FALSE
  )
  expect_warning(expect_warning(analysis <- analyse(model, data = data, glance = FALSE)))

  year <- predict(analysis, new_data = "Year")

  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})

test_that("add new_expr_vec argument to update model and updates original new_expr", {
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

  model <- update_model(
    model,
    new_expr_vec = TRUE
  )
  expect_warning(expect_warning(analysis <- analyse(model, data = data, glance = TRUE)))

  year <- predict(analysis, new_data = "Year")

  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})

test_that("cannot undo the vectorization if orignally set in the model", {
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
    new_expr_vec = TRUE,
    select_data = list(
      "Year+" = numeric(), YearFactor = factor(),
      Site = factor(), Density = numeric(),
      HabitatQuality = factor()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    random_effects = list(bSiteYear = c("Site", "YearFactor"))
  )

  model <- update_model(
    model,
    new_expr_vec = FALSE
  )
  expect_warning(expect_warning(analysis <- analyse(model, data = data, glance = FALSE)))

  year <- predict(analysis, new_data = "Year")

  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  local_edition(3)
  expect_snapshot(new_expr(analysis))
})
