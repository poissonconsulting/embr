#' R2
#'
#' Gets the R2 value for an object.
#'
#' @param object The object.
#' @param ... Unused.
#' @return An index of the R2 value.
#' @export
R2 <- function(object, ...) {
  UseMethod("R2")
}

#' R2
#'
#' Gets the marginal or conditional R2 value on the original scale for an mb_analysis object.
#'
#' @param object The object.
#' @param response A string specifying the column in the data corresponding to the response.
#' @param marginal A flag indicating whether to calculate the marginal or conditional R2 value.
#' @inheritParams mcmc_derive_data.mb_analysis
#' @param ... Unused
#'
#' @return A number of the R2 value.
#' @export
R2.mb_analysis <- function(object, response, marginal = FALSE,
                           parallel = getOption("mb.parallel", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           beep = getOption("mb.beep", FALSE), ...) {

  check_string(response)
  check_flag(marginal)
  check_flag(beep)
  if (beep) on.exit(beepr::beep())

  data <- data_set(object, modify_data = TRUE, numericize_factors = TRUE)
  check_names(data, response, x_name = "data_set(object)")

  new_data <- data_set(object, marginalize_random_effects = marginal)

  prediction <- predict(object, new_data = new_data,
                                  parallel = parallel, quiet = quiet,
                                  beep = FALSE)

  1 - stats::var(data[[response]] - prediction$estimate) / stats::var(data[[response]])
}
