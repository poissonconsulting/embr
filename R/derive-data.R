derive_fun <- function(object,
                       new_data = data_set(object),
                       new_expr = NULL,
                       new_values = list(),
                       term = "prediction",
                       modify_new_data = NULL,
                       parallel,
                       quiet,
                       ...) {
  check_data2(new_data)
  check_uniquely_named_list(new_values)
  check_flag(parallel)
  check_flag(quiet)

  model <- model(object)

  if (is.null(new_expr)) new_expr <- model$new_expr
  check_string(new_expr)

  data <- mbr::modify_new_data(new_data, data2 = data_set(object), model = model,
                               modify_new_data = modify_new_data)

  object %<>% as.mcmcr()

  object %<>% zero_random_effects(data, model$random_effects)

  data %<>% numericize_factors()
  data %<>% c(new_values)

  object %<>% derive(expr = new_expr, values = data, monitor = term,
                     parallel = parallel)
  object
}

#' Derive Data
#'
#' Calculate derived parameters.
#'
#' @param object The object.
#' @param ... Not used.
#' @export
derive_data <- function(object, ...) {
  UseMethod("derive_data")
}

#' Derive Data
#'
#' Calculate derived parameters.
#'
#' @param object An object inheriting from class mb_analysis.
#' @param new_data The data frame to calculate the predictions for.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param new_values A named list of new or replacement values to pass to new_expr.
#' @param term A string of the term in new_expr.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param ref_data A flag or a data frame with 1 row indicating the reference values for calculating the effects size.
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.#' @return A object of class mcmcr_data.
#' @export
derive_data.mb_analysis <- function(object,
                        new_data = data_set(object),
                        new_expr = NULL,
                        new_values = list(),
                        term = "prediction",
                        modify_new_data = NULL,
                        ref_data = FALSE,
                        parallel = getOption("mb.parallel", FALSE),
                        quiet = getOption("mb.quiet", TRUE),
                        beep = getOption("mb.beep", FALSE),
                        ...) {
  check_string(term)
  checkor(check_data2(new_data), check_vector(new_data, "", min_length = 0))

  if (is.character(new_data))
    new_data %<>% newdata::new_data(data_set(object), .)

  object %<>% derive(new_data = new_data, new_expr = new_expr, new_values = new_values,
                     term = term, modify_new_data = modify_new_data,
                     ref_data = ref_data, parallel = parallel,
                     quiet = quiet, beep = beep, ...)

  object %<>% mcmcr_data(new_data)
  object
}
