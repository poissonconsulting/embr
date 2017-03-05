#' RhatÎı
#'
#' rhat
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A tidy tibble of the coefficient terms.
#' @export
rhat.mb_analysis <- function(x, ...) {
  rhat(as.mcmcr(x))
}


#' Number of chains
#'
#' nchains
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A count of the number of chains.
#' @export
nchains.mb_analysis <- function(x, ...) {
  nchains(as.mcmcr(x))
}

#' Number of iterations
#'
#' niters
#'
#' @param x The mb_analysis object.
#' @param ... Not used.
#' @return A count of the number of iterations.
#' @export
niters.mb_analysis <- function(x, ...) {
  niters(as.mcmcr(x))
}

#' Is Converged
#'
#' @param x Object to test rhat for
#' @param rhat A number specifying the rhat threshold.
#' @param ... Unused
#' @export
converged.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), ...) {
  converged(as.mcmcr(x), rhat = rhat)
}

#' @export
converged.mb_null_analysis <- function(x, ...) {
  FALSE
}

#' Derive
#'
#' Calculate derived parameters.
#'
#' @param object An object inheriting from class mb_analysis.
#' @param new_data The data frame to calculate the predictions for.
#' @param new_expr A string of R code specifying the predictive relationship.
#' @param new_values A named list of new or replacement values to pass to new_expr.
#' @param term A string of the term in new_expr.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.
#' @return A object of class mcmcr.
#' @export
derive.mb_analysis <- function(object,
                               new_data = data_set(object),
                               new_expr = NULL,
                               new_values = list(),
                               term = "prediction",
                               modify_new_data = NULL,
                               parallel = getOption("mb.parallel", FALSE),
                               quick = getOption("mb.quick", FALSE),
                               quiet = getOption("mb.quiet", TRUE),
                               beep = getOption("mb.beep", FALSE),
                               ...) {
  check_data2(new_data)
  check_uniquely_named_list(new_values)
  check_flag(parallel)
  check_flag(quick)
  check_flag(quiet)
  check_flag(beep)

  model <- model(object)

  if (is.null(new_expr)) new_expr <- model$new_expr
  check_string(new_expr)

  if (beep) on.exit(beepr::beep())

  data <- mbr::modify_new_data(new_data, data2 = data_set(object), model = model,
                               modify_new_data = modify_new_data)

  object %<>% as.mcmcr()

  object %<>% zero_random_effects(data, model$random_effects)

  data %<>% numericize_factors()
  data %<>% c(new_values)

  object %<>% derive(expr = new_expr, values = data, monitor = term, quick = quick)

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
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
#' @param quick A flag indicating whether to quickly get unreliable values.
#' @param quiet A flag indicating whether to disable tracing information.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ...  Additional arguments.#' @return A object of class mcmcr_data.
#' @export
derive_data <- function(object,
                        new_data = data_set(object),
                        new_expr = NULL,
                        new_values = list(),
                        term = "prediction",
                        modify_new_data = NULL,
                        parallel = getOption("mb.parallel", FALSE),
                        quick = getOption("mb.quick", FALSE),
                        quiet = getOption("mb.quiet", TRUE),
                        beep = getOption("mb.beep", FALSE),
                        ...) {
  check_string(term)

  object %<>% derive(new_data = new_data, new_expr = new_expr, new_values = new_values,
                     term = term, modify_new_data = modify_new_data, parallel = parallel,
                     quick = quick, quiet = quiet, beep = beep, ...)

  object %<>% mcmcr_data(new_data)
  object
}
