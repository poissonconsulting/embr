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
#' @param zeros A flag specifying whether to perform a posterior predictive check
#' on the number of zeros in the data.
#' @param ... Unused.
#' @return A tibble of the checks.
#' @export
posterior_predictive_check.mb_analysis <- function(x, zeros = TRUE, ...) {
  chk_flag(zeros)
  chk_unused(...)

  simulate_residuals <- simulate_residuals(x)
  if(zeros) {
    simulate_zeros <- simulate_residuals(x, type = "data")
  }
  residuals <- residuals(x)

  simulate_residuals <- as.mcmc(collapse_chains(simulate_residuals$mcmc))

  means <- apply(simulate_residuals, 1, FUN = extras::xtr_mean, na_rm = TRUE)
  variances <- apply(simulate_residuals, 1, FUN = extras::variance, na_rm = TRUE)
  skewnesses <- apply(simulate_residuals, 1, FUN = extras::skewness, na_rm = TRUE)
  kurtoses <- apply(simulate_residuals, 1, FUN = extras::kurtosis, na_rm = TRUE)

  residuals <- residuals$estimate

  mean <- extras::xtr_mean(residuals, na_rm = TRUE)
  variance <- extras::variance(residuals, na_rm = TRUE)
  skewness <- extras::skewness(residuals, na_rm = TRUE)
  kurtosis <- extras::kurtosis(residuals, na_rm = TRUE)

  if(zeros) {
    zeros <- residuals(x, type = "data")

    simulate_zeros <- as.mcmc(collapse_chains(simulate_zeros$mcmc))
    zeroses <- apply(simulate_zeros, 1, FUN = extras::pzeros, na_rm = TRUE)

    zeros <- zeros$estimate

    zeros <- extras::pzeros(zeros, na_rm = TRUE)
    zeroses_svalue <- svalue(zeroses, threshold = zeros)
  } else {
    zeros <- NA_integer_
    zeroses <- NA_integer_
    zeroses_svalue <- NA_real_
  }

  tibble <- tibble::tibble(moment = c("zeros", "mean", "variance", "skewness", "kurtosis"))
  tibble$moment <- factor(tibble$moment, tibble$moment)
  tibble$observed <- c(zeros, mean, variance, skewness, kurtosis)
  tibble$median <- c(median(zeroses), median(means), median(variances), median(skewnesses), median(kurtoses))
  tibble$lower <- c(lower(zeroses), lower(means), lower(variances), lower(skewnesses), lower(kurtoses))
  tibble$upper <- c(upper(zeroses), upper(means), upper(variances), upper(skewnesses), upper(kurtoses))
  tibble$svalue <- c(zeroses_svalue,
                     svalue(means, threshold = mean),
                     svalue(variances, threshold = variance),
                     svalue(skewnesses, threshold = skewness),
                     svalue(kurtoses, threshold = kurtosis))

  tibble
}
