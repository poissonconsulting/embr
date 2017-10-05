#' @export
rhat.mb_analysis <- function(x, ...) {
  rhat(as.mcmcr(x))
}

#' @export
rhat.mb_analyses <- function(x, ...) {
  rhat(as.mcmcrs(x))
}

#' @export
esr.mb_analysis <- function(x, ...) {
  esr(as.mcmcr(x))
}

#' @export
esr.mb_analyses <- function(x, ...) {
  esr(as.mcmcrs(x))
}

#' @export
ess.mb_analysis <- function(x, ...) {
  ess(as.mcmcr(x))
}

#' @export
ess.mb_analyses <- function(x, ...) {
  ess(as.mcmcrs(x))
}

#' @export
nchains.mb_analysis <- function(x, ...) {
  if (is.mb_null_analysis(x)) return(0L)
  nchains(as.mcmcr(x))
}

#' @export
niters.mb_analysis <- function(x, ...) {
  niters(as.mcmcr(x))
}

#' @export
converged.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  x %<>% as.mcmcr(x)
  if (nchains(x) < 2L) return(NA)
  converged(x, rhat = rhat, esr = esr)
}

#' @export
converged.mb_analyses <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  all(vapply(x, converged, TRUE, rhat = rhat, esr = esr))
}

#' @export
converged.mb_null_analysis <- function(x, ...) FALSE

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

#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams derive_data
#' @return A object of class mcmcr.
#' @export
derive.mb_analysis <- function(object,
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
  check_flag(beep)
  checkor(check_data2(new_data), check_vector(new_data, "", min_length = 0))
  checkor(check_flag(ref_data), check_data2(ref_data))

  if (beep) on.exit(beepr::beep())

  if (is.character(new_data))
    new_data %<>% newdata::new_data(data_set(object), .)

  nrow <- nrow(new_data)

  new_data %<>% derive_fun(object, new_data = ., new_expr = new_expr,
                      new_values = new_values, term = term,
                      modify_new_data = modify_new_data,
                      parallel = parallel,
                      quiet = quiet, beep = FALSE, ...)

  if (identical(ref_data, FALSE)) return(new_data)

  if (identical(ref_data, TRUE))
    ref_data <- data_set(object) %>% newdata::new_data()

  ref_data %<>% derive_fun(object, new_data = ., new_expr = new_expr,
                           new_values = new_values, term = term,
                           modify_new_data = modify_new_data,
                           parallel = parallel,
                           quiet = quiet, beep = FALSE, ...)

  ref_data %<>% rep(nrow)

  ref_data %<>% purrr::reduce(bind_samples, along = 1)

  ref_data %<>% list()
  names(ref_data) <- names(new_data)
  class(ref_data) <- "mcmcr"

  object <- combine_values(new_data, ref_data, fun = function(x) {(x[1] - x[2]) / x[2]})
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
#' @param parallel A flag indicating whether to do predictions using parallel backend provided by foreach.
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
