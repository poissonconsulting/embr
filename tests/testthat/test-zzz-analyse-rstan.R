test_that(
  "model pars for smbr2 and cmdstan engine",
  {
    skip_if_not_installed("smbr")

    library(smbr)
    data <- embr::density99
    data$YearFactor <- factor(data$Year)

    set_analysis_mode("quick")

    template <- "data {
  int<lower=0> nObs;
  vector[nObs] Density;
  vector[nObs] Year;
  array[nObs] int<lower=1> Site;
  array[nObs] int<lower=1> YearFactor;
  array[nObs] int<lower=1> HabitatQuality;
  int<lower=1> nSite;
  int<lower=1> nYearFactor;
  int<lower=1> nHabitatQuality;
}

parameters {
  real bIntercept;
  real bYear;
  vector<lower=0>[nHabitatQuality-1] bHabitatQuality;
  real<lower=0> log_sSiteYear;
  real<lower=0> log_sDensity;
  matrix[nSite, nYearFactor] bSiteYear;
}

transformed parameters {
    vector[nObs] eDensity;
    vector[nObs] eHabitatQuality;
    for(i in 1:nObs){
        eHabitatQuality[i] = HabitatQuality[i] == 1 ? 0 : bHabitatQuality[HabitatQuality[i]-1];
        eDensity[i] = bIntercept + bYear * Year[i] + eHabitatQuality[i] + bSiteYear[Site[i], YearFactor[i]];
    }
}

model {
  bIntercept ~ normal(0, 5);
  bYear ~ normal(0, 0.5);
  bHabitatQuality ~ normal(0, 5);
  log_sSiteYear ~ lognormal(0, 5);
  log_sDensity ~ student_t(4.5, 0, 5);

  to_vector(bSiteYear) ~ normal(0, exp(log_sSiteYear));

  for (i in 1:nObs) {
    Density[i] ~ lognormal(eDensity[i], exp(log_sDensity));
  }
}"

new_expr <- "
  for(i in 1:length(Density)) {
     eHabitatQuality[2] <- bHabitatQuality
     eHabitatQuality[1] <- 0
     fit[i] <- bIntercept + bYear * Year[i] + eHabitatQuality[HabitatQuality[i]] + bSiteYear[Site[i], YearFactor[i]]
    log(prediction[i]) <- fit[i]
    residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
} "

model <- model(
  code = template,
  select_data = list(
    "Year+" = numeric(), YearFactor = factor(),
    Site = factor(), Density = numeric(),
    HabitatQuality = factor()
  ),
  fixed = "^(b|l)", derived = "eDensity",
  random_effects = list(bSiteYear = c("Site", "YearFactor")),
  new_expr = new_expr
)

niters <- 250L
nchains <- 2L
expect_output(analysis <- analyse(model, data = data,
                                  parallel = FALSE, niters = niters,
                                  nchains = nchains, seed = 1))

analysis$duration <- NULL
analysis$stanfit <- NULL
analysis$model$gen_inits <- NULL
expect_snapshot(analysis)

expect_output(analysis <- reanalyse(analysis, seed = 1))

expect_identical(pars(analysis, "fixed"), sort(c("bHabitatQuality", "bIntercept", "bYear", "log_sDensity", "log_sSiteYear")))
expect_identical(pars(analysis, "random"), "bSiteYear")
expect_identical(pars(analysis, "derived"), "eDensity")

expect_equal(as.data.frame(data_set(analysis)), data)

expect_s3_class(as.mcmcr(analysis), "mcmcr")

glance <- glance(analysis)
expect_snapshot(glance)

coef <- coef(analysis, simplify = TRUE)
expect_snapshot(coef)

derived <- coef(analysis, param_type = "derived", simplify = TRUE)
expect_snapshot(derived)

tidy <- tidy(analysis)
expect_snapshot(tidy)

year <- predict(analysis, new_data = "Year")
expect_snapshot(year)

dd <- mcmc_derive_data(analysis, new_data = c("Site", "Year"), ref_data = TRUE)
expect_snapshot(dd)
expect_true(mcmcdata::is.mcmc_data(dd))

  })
