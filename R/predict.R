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
  check_vector(conf_level, c(0.5, 0.99), length = 1)
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  term %<>% str_c("^", ., "$")

  object %<>% mcmc_derive_data(new_data = new_data, new_expr = new_expr,
                          new_values = new_values, term = term,
                          modify_new_data = modify_new_data, ref_data = ref_data,
                          parallel = parallel, quiet = quiet,
                          beep = FALSE, ...)

  object %<>% coef(conf_level = conf_level)

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
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  ic <- IC(object)

  prediction <- llply(object, predict, new_data = new_data, new_expr = new_expr,
                      new_values = new_values, term = term, conf_level = conf_level,
                      modify_new_data = modify_new_data, ref_data = ref_data,
                      parallel = parallel, quiet = quiet, beep = FALSE)

  if (!all(is.finite(ic$IC))) {
    prediction <- prediction[[1]] %<>%
      dplyr::mutate_(estimate = ~NA_real_,
                     sd = ~NA_real_,
                     zscore = ~NA_real_,
                     lower = ~NA_real_,
                     upper = ~NA_real_,
                     pvalue = ~NA_real_
    )
    return(prediction)
  }

  new_data <- prediction[[1]] %>%
   dplyr::select_(~-estimate, ~-sd, ~-zscore, ~-lower, ~-upper, ~-pvalue)

  prediction <- prediction[is.finite(ic$IC)]
  ic <- ic[is.finite(ic$IC),,drop = FALSE]

  prediction %<>% purrr::map2(ic$ICWt, function(x, y) {x$ICWt <- y; x})

  prediction %<>% purrr::map_df(function(x) {x$.row <- 1:nrow(x); x})

  prediction %<>%
    dplyr::bind_rows(.id = ".model") %>%
    dplyr::group_by_(~.row) %>%
    dplyr::summarise_(
      estimate = ~sum(ICWt * estimate)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate_(lower = ~NA_real_,
                   upper = ~NA_real_,
                   sd = ~NA_real_,
                   zscore = ~NA_real_,
                   pvalue = ~NA_real_) %>%
    dplyr::arrange_(~.row) %>%
    dplyr::select_(~estimate,~sd,~zscore,~lower,~upper,~pvalue)
  new_data %<>% dplyr::bind_cols(prediction)
  new_data
}
