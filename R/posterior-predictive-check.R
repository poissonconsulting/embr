#' Posterior Predictive Check
#'
#' Simulates
#'
#' @param x The object
#' @param ... Unused.
#' @return A tibble of the checks.
#' @export
posterior_predictive_check <- function(x, ...) {
  UseMethod("posterior_predictive_check", x)
}

#' Posterior Predictive Check
#'
#' @param x The MB analysis object.
#' @param ... Unused.
#' @return A tibble of the checks.
#' @export
posterior_predictive_check.mb_analysis <- function(x, ...) {
  chk_unused(...)

  resample_residuals <- resample_residuals(x)
  residuals <- residuals(x)

  resample_residuals <- as.mcmc(collapse_chains(resample_residuals$mcmc))
  residuals <- residuals$estimate

  zeros <- extras::zeros(residuals, na_rm = TRUE)
  mean <- extras::xtr_mean(residuals, na_rm = TRUE)
  variance <- extras::variance(residuals, na_rm = TRUE)
  skewness <- extras::skewness(residuals, na_rm = TRUE)
  kurtosis <- extras::kurtosis(residuals, na_rm = TRUE)

  zeroses <- apply(resample_residuals, 1, FUN = extras::zeros, na_rm = TRUE)
  means <- apply(resample_residuals, 1, FUN = extras::xtr_mean, na_rm = TRUE)
  variances <- apply(resample_residuals, 1, FUN = extras::variance, na_rm = TRUE)
  skewnesses <- apply(resample_residuals, 1, FUN = extras::skewness, na_rm = TRUE)
  kurtoses <- apply(resample_residuals, 1, FUN = extras::kurtosis, na_rm = TRUE)

  tibble <- tibble::tibble(moment = c("zeros", "mean", "variance", "skewness", "kurtosis"))
  tibble$moment <- factor(tibble$moment, tibble$moment)
  tibble$observed <- c(zeros, mean, variance, skewness, kurtosis)
  tibble$median <- c(median(zeros), median(means), median(variances), median(skewnesses), median(kurtoses))
  tibble$lower <- c(lower(zeros), lower(means), lower(variances), lower(skewnesses), lower(kurtoses))
  tibble$upper <- c(upper(zeros), upper(means), upper(variances), upper(skewnesses), upper(kurtoses))
  tibble$svalue <- c(svalue(zeroses, threshold = zeros),
                     svalue(means, threshold = mean),
                     svalue(variances, threshold = variance),
                     svalue(skewnesses, threshold = skewness),
                     svalue(kurtoses, threshold = kurtosis))

  tibble
}
