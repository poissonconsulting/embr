#' R-Squared
#'
#' Calculate the proportion of the variance in the response predicted after discounting.
#'
#' @inheritParams predict_data
#' @param response A string indicating the response term.
#' @param prediction A string indicating the prediction term.
#' @param discounted A string indicating the term to discount.
#' @export
rsquared <- function(analysis, response = "response",
                     prediction = "prediction", discounted = NULL,
                     new_expr = NULL, modify_new_data = NULL,
                     quick = getOption("mb.quick", FALSE),
                     quiet = getOption("mb.quiet", TRUE),
                     beep = getOption("mb.beep", FALSE), ...) {
  UseMethod("rsquared")
}

#' @export
rsquared.mb_analysis <- function(analysis, response = "response",
                                 prediction = "prediction", discounted = NULL,
                                 new_expr = NULL, modify_new_data = NULL,
                                 quick = getOption("mb.quick", FALSE),
                                 quiet = getOption("mb.quiet", TRUE),
                                 beep = getOption("mb.beep", FALSE), ...) {
  check_string(response)
  check_string(fitted)
  if (!is.null(discounted)) check_string(discounted)

  check_flag(beep)
  if (beep) on.exit(beepr::beep())


  response <- predict(analysis, term = response, new_expr = new_expr,
                      modify_new_data = modify_new_data, quick = quick, quiet = quiet,
                      beep = FALSE)$estimate

  prediction <- predict(analysis, term = prediction, new_expr = new_expr,
                        modify_new_data = modify_new_data, quick = quick, quiet = quiet,
                        beep = FALSE)$estimate

  if (!identical(length(response), length(prediction))) error("response and prediction values must be the same length")

  if (!is.null(discounted)) {
    discounted <- predict(analysis, term = discounted, new_expr = new_expr,
                          modify_new_data = modify_new_data, quick = quick, quiet = quiet,
                          beep = FALSE)$estimate
    if (!identical(length(response), length(discounted)))
      error("response and discounted values must be the same length")

    response <- response - discounted
    prediction <- prediction - discounted
  }

  r2 <- 1 - var(response - prediction) / var(response)
  r2
}
