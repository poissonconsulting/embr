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

#' Fitted Values
#'
#' Extract fitted values for a LMB analysis.
#'
#' @param object The LMB analysis object.
#' @param ... Unused.
#' @return The analysis data set with the fitted values.
#' @export
fitted.lmb_analysis <- function(object, ...) {
  predict(object, new_data = data_set(object))
}

#' Predict
#'
#' @inheritParams derive_data
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param marginal A string specifying the parameter set at its estimated and lower and upper values while fixing the remaining parameters at their estimated values.
#' @export
predict.mb_analysis <- function(object,
                                new_data = data_set(object),
                                new_expr = NULL,
                                new_values = list(),
                                term = "prediction",
                                marginal = NULL,
                                conf_level = 0.95,
                                modify_new_data = NULL,
                                ref_data = FALSE,
                                parallel = getOption("mb.parallel", FALSE),
                                quick = getOption("mb.quick", FALSE),
                                quiet = getOption("mb.quiet", TRUE),
                                beep = getOption("mb.beep", FALSE),
                                ...) {
  checkor(check_null(marginal), check_string(marginal))
  check_number(conf_level, c(0.5, 0.99))
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!is.null(marginal)) {
    if (!marginal %in% parameters(object, "primary")) error("marginal not in primary parameters")

    estimates <- coef(object, param_type = "all", conf_level = conf_level)

  }

  term %<>% str_c("^", ., "$")

  object %<>% derive_data(new_data = new_data, new_expr = new_expr,
                          new_values = new_values, term = term,
                          modify_new_data = modify_new_data, ref_data = ref_data,
                          parallel = parallel, quick = quick, quiet = quiet,
                          beep = FALSE, ...)

  object %<>% coef(conf_level = conf_level)
  object %<>% dplyr::select_(~-term)

  object
}

#' Predict
#'
#' @inheritParams derive_data
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @export
predict.lmb_analysis <- function(object,
                                 new_data = data_set(object),
                                 conf_level = 0.95,
                                 quiet = getOption("mb.quiet", TRUE),
                                 beep = getOption("mb.beep", FALSE),
                                 ...) {
  check_number(conf_level, c(0.5, 0.99))
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  checkor(check_data2(new_data), check_vector(new_data, "", min_length = 0))

  if (is.character(new_data))
    new_data %<>% newdata::new_data(data_set(object), .)

  data <- select_rescale_data(new_data, model(object), data2 = data_set(object))

  pred <- predict(object$lm, newdata = data, se.fit = TRUE,
                  interval = "confidence", level = conf_level)

  prediction <- pred$fit %<>%
    as.data.frame() %>%
    dplyr::rename_(estimate = ~fit, lower = ~lwr, upper = ~upr) %>%
    dplyr::mutate_(sd = ~pred$se.fit,
                   zscore = ~estimate/sd,
                   pvalue = ~ pnorm(-abs(zscore)) * 2)

  prediction %<>% dplyr::select_(~estimate, ~sd, ~zscore, ~lower, ~upper, ~pvalue)

  prediction %<>% dplyr::bind_cols(new_data, .)
  prediction
}

#' Predict
#'
#' @inheritParams derive_data
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @export
predict.mb_analyses <- function(object,
                                new_data = data_set(object),
                                new_expr = NULL,
                                new_values = list(),
                                term = "prediction",
                                conf_level = 0.95,
                                modify_new_data = NULL,
                                ref_data = FALSE,
                                parallel = getOption("mb.parallel", FALSE),
                                quick = getOption("mb.quick", FALSE),
                                quiet = getOption("mb.quiet", TRUE),
                                beep = getOption("mb.beep", FALSE),
                                ...) {
  check_number(conf_level, c(0.5, 0.99))
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  ic <- IC(object)

  prediction <- llply(object, predict, new_data = new_data, new_expr = new_expr,
                      new_values = new_values, term = term, conf_level = conf_level,
                      modify_new_data = modify_new_data, ref_data = ref_data,
                      parallel = parallel, quick = quick, quiet = quiet, beep = FALSE)

  if (!any(is.finite(ic$IC))) {
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
      estimate = ~sum(estimate * ICWt),
      lower = ~sum(lower * ICWt),
      upper = ~sum(upper * ICWt)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate_(sd = ~NA_real_,
                   zscore = ~NA_real_,
                   pvalue = ~NA_real_) %>%
    dplyr::arrange_(~.row) %>%
    dplyr::select_(~estimate,~sd,~zscore,~lower,~upper,~pvalue)
  new_data %<>% dplyr::bind_cols(prediction)
  new_data
}
