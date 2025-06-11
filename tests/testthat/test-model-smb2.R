test_that("model pars for smb2", {
  skip_if_not_installed("smbr")

  template <- "data {
  int<lower=1> N;
  vector[N] Year;
  vector<lower=0>[N] Density;
}

parameters {
  real bIntercept;
  real bYear;
  real<lower=0> sDensity;
}

transformed parameters {
  vector[N] eDensity;

  for(i in 1:N) {
    eDensity[i] = bIntercept + bYear * Year[i];
  }
}

model {
  bIntercept ~ normal(0, 5);
  bYear ~ normal(0, 5);
  sDensity ~ exponential(1);

  Density ~ lognormal(eDensity, sDensity);
}"

  new_expr <- "
  for(i in 1:length(Density)) {
    prediction[i] <- exp(bIntercept + bYear * Year[i])
} "

  model <- model(
    code = template,
    select_data = list(
      "Year+" = numeric(),
      Density = numeric()
    ),
    fixed = "^(b|l)", derived = "eDensity",
    new_expr = new_expr,
    stan_engine = "cmdstanr"
  )

  expect_identical(class(model), c("smb2_model", "smb_model", "mb_model"))

  expect_identical(length(pars(model, "fixed")), 3L)
  expect_identical(length(pars(model, "primary")), 3L)
  expect_identical(pars(model, "random"), character(0))
  expect_identical(pars(model, "derived"), "eDensity")
})

