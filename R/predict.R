#' @export
stats::fitted

#' @export
stats::predict

#' Fitted Values
#'
#' Extract fitted values for a MB analysis.
#'
#' The new_expr in the model must include the term 'fit'.
#'
#' @param object The MB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the fitted values.
#' @export
fitted.mb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object), term = "fit")
}

#' Predict
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @export
predict.mb_analysis <- function(object,
                                new_data = data_set(object),
                                new_expr = NULL,
                                new_values = list(),
                                term = "prediction",
                                conf_level = getOption("mb.conf_level", 0.95),
                                modify_new_data = NULL,
                                ref_data = FALSE,
                                parallel = getOption("mb.parallel", FALSE),
                                quiet = getOption("mb.quiet", TRUE),
                                beep = getOption("mb.beep", FALSE),
                                ...) {
  chk_number(conf_level)
  chk_range(conf_level, c(0.5, 0.99))
  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  term <- p0("^", term, "$")

  object <- mcmc_derive_data(object, new_data = new_data, new_expr = new_expr,
                          new_values = new_values, term = term,
                          modify_new_data = modify_new_data, ref_data = ref_data,
                          parallel = parallel, quiet = quiet,
                          beep = FALSE, ...)

  object <- coef(object, conf_level = conf_level)

  object
}

#' Predict
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @export
predict.mb_analyses <- function(object,
                                new_data = data_set(object),
                                new_expr = NULL,
                                new_values = list(),
                                term = "prediction",
                                conf_level = getOption("mb.conf_level", 0.95),
                                modify_new_data = NULL,
                                ref_data = FALSE,
                                parallel = getOption("mb.parallel", FALSE),
                                quiet = getOption("mb.quiet", TRUE),
                                beep = getOption("mb.beep", FALSE),
                                ...) {
  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  ic <- IC(object)

  prediction <- llply(object, predict, new_data = new_data, new_expr = new_expr,
                      new_values = new_values, term = term, conf_level = conf_level,
                      modify_new_data = modify_new_data, ref_data = ref_data,
                      parallel = parallel, quiet = quiet, beep = FALSE)

  if (!all(is.finite(ic$IC))) {
    prediction <- dplyr::mutate(prediction[[1]], estimate = NA_real_,
                     sd = NA_real_,
                     zscore = NA_real_,
                     lower = NA_real_,
                     upper = NA_real_,
                     pvalue = NA_real_
    )
    return(prediction)
  }

  new_data <- prediction[[1]]
  new_data <- dplyr::select_(new_data, ~-estimate, ~-sd, ~-zscore, ~-lower, ~-upper, ~-pvalue)

  prediction <- prediction[is.finite(ic$IC)]
  ic <- ic[is.finite(ic$IC),,drop = FALSE]

  prediction <- purrr::map2(prediction, ic$ICWt, function(x, y) {x$ICWt <- y; x})

  prediction <- purrr::map_df(prediction, function(x) {x$.row <- 1:nrow(x); x})

  prediction <- dplyr::bind_rows(prediction, .id = ".model")
  prediction <- dplyr::group_by_(prediction, ~.row)
  prediction <- dplyr::summarise_(prediction,
      estimate = ~sum(ICWt * estimate))
  prediction <- dplyr::ungroup(prediction)
  prediction <- dplyr::mutate(prediction, lower = NA_real_,
                   upper = NA_real_,
                   sd = NA_real_,
                   zscore = NA_real_,
                   pvalue = NA_real_)
  prediction <- dplyr::arrange_(prediction, ~.row)
  prediction <- dplyr::select(prediction, estimate = .data$estimate,
                              sd = .data$sd, zscore = .data$zscore,
                              lower = .data$lower,,
                              upper = .data$upper,
                              pvalue = .data$pvalue)
  new_data <- dplyr::bind_cols(prediction, new_data, prediction)
  new_data
}
