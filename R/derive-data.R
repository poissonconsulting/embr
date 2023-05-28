mcmc_derive_fun <- function(object,
                       new_data = data_set(object),
                       new_expr = NULL,
                       new_values = list(),
                       term = "prediction",
                       modify_new_data = NULL,
                       random_effects = NULL,
                       parallel,
                       quiet,
                       ...) {
  chk_data(new_data)
  if(is.null(random_effects) || isTRUE(random_effects)) {
    random_effects <- random_effects(object)
  } else if(isFALSE(random_effects)) {
    random_effects <- list()
  }

  check_uniquely_named_list(new_values)
  check_uniquely_named_list(random_effects)
  check_all_elements_class_character(random_effects)

  chk_flag(parallel)
  chk_flag(quiet)

  model <- model(object)

  if (is.null(new_expr)) new_expr <- model$new_expr
  chk_string(new_expr)

  data <- mbr::modify_new_data(new_data, data2 = data_set(object), model = model,
                               modify_new_data = modify_new_data)

  object <- as.mcmcr(object)

  object <- zero_random_effects(object, data, random_effects)

  data <- numericize_factors(data)
  data <- c(data, new_values)

  object <- mcmc_derive(object, expr = new_expr, values = data, monitor = term,
                     parallel = parallel, silent = quiet)
  object
}

#' @export
mcmcdata::mcmc_derive_data

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
#' @param ref_fun2 A function whose first argument takes a vector of two numbers and returns a scalar of a metric of the difference between them.
#' @param random_effects A named list specifying the random effects and the associated factors.
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @return A object of class mcmc_data.
#' @export
mcmc_derive_data.mb_analysis <- function(object,
                        new_data = data_set(object),
                        new_expr = NULL,
                        new_values = list(),
                        term = "prediction",
                        modify_new_data = NULL,
                        ref_data = FALSE,
                        ref_fun2 = proportional_change2,
                        random_effects = NULL,
                        parallel = getOption("mb.parallel", FALSE),
                        quiet = getOption("mb.quiet", TRUE),
                        beep = getOption("mb.beep", FALSE),
                        ...) {
  chk_string(term)
  if(!vld_data(new_data) && !vld_character(new_data)) {
    chkor_vld(vld_data(new_data), vld_character(new_data))
  }
  if (is.character(new_data))
    new_data <- newdata::new_data(data_set(object), new_data)

  object <- mcmc_derive(
    object,
    new_data = new_data,
    new_expr = new_expr,
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    ref_fun2 = ref_fun2,
    random_effects = random_effects,
    parallel = parallel,
    quiet = quiet,
    beep = beep,
    ...
  )

  object <- mcmc_data(object, new_data)
  object
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
#' @param ref_fun2 A function whose first argument takes a vector of two numbers and returns a scalar of a metric of the difference between them.
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @return A object of class mcmc_data.
#' @export
mcmc_derive_data.mb_analyses <- function(object,
                                    new_data = data_set(object),
                                    new_expr = NULL,
                                    new_values = list(),
                                    term = "prediction",
                                    modify_new_data = NULL,
                                    ref_data = FALSE,
                                    ref_fun2 = proportional_change2,
                                    parallel = getOption("mb.parallel", FALSE),
                                    quiet = getOption("mb.quiet", TRUE),
                                    beep = getOption("mb.beep", FALSE),
                                    ...) {

  chk_string(term)
  if(!vld_data(new_data) && !vld_character(new_data)) {
    chkor_vld(vld_data(new_data), vld_character(new_data))
  }
  if (is.character(new_data))
    new_data <- newdata::new_data(data_set(object), new_data)

  object <- mcmc_derive(
    object,
    new_data = new_data,
    new_expr = new_expr,
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    ref_fun2 = ref_fun2,
    parallel = parallel,
    quiet = quiet,
    beep = beep,
    ...
  )

  mcmc_data(object, new_data)
}
