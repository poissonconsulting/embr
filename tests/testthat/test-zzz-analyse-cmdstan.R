test_that(
  "model pars for smbr2 and cmdstan engine",
  {
    skip_if_not_installed("smbr2")

    library(smbr2)
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
expect_output(analysis <- analyse(model, data = data, stan_engine = "cmdstan-mcmc",
                    parallel = TRUE, niters = niters, nchains = nchains, niters_warmup = niters, seed = 1))

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

expect_identical(class(analysis), c("cmdstan_mcmc_analysis", "cmdstan_analysis", "mb_analysis"))

expect_identical(niters(analysis), niters)
expect_identical(nchains(analysis), nchains)
expect_identical(nsims(analysis), 500L)
expect_identical(ngens(analysis), 1000L)

expect_output(analysis <- reanalyse(analysis))

expect_identical(niters(analysis), niters)
expect_identical(ngens(analysis), 1000L)

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
  "bHabitatQuality",
  "bIntercept", "bYear",
  "log_sDensity", "log_sSiteYear"
)))

expect_identical(nrow(coef(analysis, "primary", simplify = TRUE)), 65L)
expect_identical(nrow(coef(analysis, "all", simplify = TRUE)), 365L)

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
  })
