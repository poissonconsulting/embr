test_that("analyse", {
  skip_if_not_installed("jmbr")

  set_analysis_mode("quick")

  data <- embr::density99
  data$YearFactor <- factor(data$Year)

  jags_template <- "model{

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
}"

  new_expr <- "
  for(i in 1:length(Density)) {
    fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
    log(prediction[i]) <- fit[i]
    residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
}"

  model <- model(
    code = jags_template,
    select_data = list(
      "Year+" = numeric(), YearFactor = factor(),
      Site = factor(), Density = numeric(),
      HabitatQuality = factor()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    random_effects = list(bSiteYear = c("Site", "YearFactor")),
    new_expr = new_expr
  )

  expect_output(expect_warning(expect_warning(analysis <- analyse(model, data = data))))

  expect_equal(as.data.frame(data_set(analysis)), data)
  data2 <- data_set(analysis, marginalize_random_effects = TRUE)
  expect_true(all(as.integer(data2$Site) == 1L))
  expect_true(all(as.integer(data2$YearFactor) == 1L))
  # need random seed so repeatable
  R2c <- R2(analysis, "Density")
  expect_gt(R2c, 0.5)
  expect_lt(R2c, 0.9)

  R2m <- R2(analysis, "Density", marginal = TRUE)
  expect_gt(R2m, 0.0)
  expect_lt(R2m, 0.01)

  expect_identical(class(analysis), c("jmb_analysis", "mb_analysis"))

  expect_identical(niters(analysis), 10L)
  expect_identical(nchains(analysis), 2L)
  expect_identical(nsims(analysis), 20L)
  expect_identical(ngens(analysis), 40L)

  expect_output(analysis <- reanalyse(analysis))

  expect_identical(niters(analysis), 10L)
  expect_identical(ngens(analysis), 40L)


  expect_identical(pars(analysis, "fixed"), sort(c("bHabitatQuality", "bIntercept", "bYear", "log_sDensity", "log_sSiteYear")))
  expect_identical(pars(analysis, "random"), "bSiteYear")
  expect_identical(pars(analysis, "derived"), "eDensity")
  expect_identical(
    pars(analysis, "primary"),
    c("bHabitatQuality", "bIntercept", "bSiteYear", "bYear", "log_sDensity", "log_sSiteYear")
  )
  expect_identical(
    pars(analysis),
    c("bHabitatQuality", "bIntercept", "bSiteYear", "bYear", "eDensity", "log_sDensity", "log_sSiteYear")
  )

  expect_s3_class(as.mcmcr(analysis), "mcmcr")

  glance <- glance(analysis)
  expect_s3_class(glance, "tbl")
  expect_identical(colnames(glance), c("n", "K", "nchains", "niters", "nthin", "ess", "rhat", "converged"))
  expect_identical(glance$n, 300L)
  expect_identical(glance$nthin, 1L)
  expect_identical(glance$K, 5L)

  derived <- coef(analysis, param_type = "derived", simplify = TRUE)
  expect_identical(colnames(derived), c("term", "estimate", "lower", "upper", "svalue"))
  expect_identical(nrow(derived), 300L)

  coef <- coef(analysis, simplify = TRUE)

  expect_s3_class(coef, "tbl")
  expect_identical(colnames(coef), c("term", "estimate", "lower", "upper", "svalue"))

  expect_identical(coef$term, as.term(c(
    "bHabitatQuality[1]", "bHabitatQuality[2]",
    "bIntercept", "bYear",
    "log_sDensity", "log_sSiteYear"
  )))

  expect_identical(nrow(coef(analysis, "primary", simplify = TRUE)), 66L)
  expect_identical(nrow(coef(analysis, "all", simplify = TRUE)), 366L)

  tidy <- tidy(analysis)
  expect_identical(colnames(tidy), c("term", "estimate", "lower", "upper", "esr", "rhat"))

  year <- predict(analysis, new_data = "Year")

  ppc <- posterior_predictive_check(analysis)

  expect_s3_class(ppc, "tbl_df")
  expect_identical(colnames(ppc), c("moment", "observed", "median", "lower", "upper", "svalue"))
  expect_identical(ppc$moment, structure(1:5, .Label = c(
    "zeros", "mean", "variance", "skewness",
    "kurtosis"
  ), class = "factor"))
  expect_s3_class(year, "tbl")
  expect_identical(colnames(year), c(
    "Site", "HabitatQuality", "Year", "Visit",
    "Density", "YearFactor",
    "estimate", "lower", "upper", "svalue"
  ))
  expect_true(all(year$lower < year$estimate))
  expect_false(is.unsorted(year$estimate))

  dd <- mcmc_derive_data(analysis, new_data = c("Site", "Year"), ref_data = TRUE)
  expect_true(mcmcdata::is.mcmc_data(dd))

  expect_warning(expect_warning(expect_warning(
    sensitivity <- sd_priors_by(analysis, by = 10, glance = FALSE),
    "incomplete adaptation"
  )))

  analyses <- analyses(analysis, sensitivity)

  rhat2 <- rhat(analyses)
  expect_type(rhat2, "list")
  expect_identical(names(rhat2), c("mcmcr1", "mcmcr2"))

  skip_if_not_installed("mcmcr", "0.6.1.9001")

  lifecycle::expect_deprecated(
    rhat2 <- rhat(analyses, bound = TRUE),
    "`rhat.mcmcrs\\(x, bound = TRUE\\)`"
  )

  expect_type(rhat2, "list")
  expect_identical(names(rhat2), c("mcmcr1", "mcmcr2", "bound"))

  lifecycle::expect_deprecated(
    glance <- glance(analyses, bound = TRUE),
    "`rhat.mcmcrs\\(x, bound = TRUE\\)`"
  )

  expect_s3_class(glance, "tbl")
  expect_identical(nrow(glance), 1L)
  expect_identical(colnames(glance), c("n", "K", "nchains", "niters", "rhat_1", "rhat_2", "rhat_all", "converged"))
})
