#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @return A object of class mcmcr.
#' @export
mcmc_derive.mb_analysis <- function(object,
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
  chk_flag(beep)
  chk_function(ref_fun2)

  if(!vld_data(new_data) && !vld_character(new_data)) {
    chkor_vld(vld_data(new_data), vld_character(new_data))
  }
  if(!vld_flag(ref_data) && !vld_data(ref_data)) {
    chkor_vld(vld_flag(ref_data), vld_data(ref_data))
  }

  if (beep) on.exit(beepr::beep())

  if (is.character(new_data))
    new_data <- newdata::new_data(data_set(object), new_data)

  nrow <- nrow(new_data)

  new_data <- mcmc_derive_fun(
    object,
    new_data = new_data,
    new_expr = new_expr,
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    random_effects = random_effects,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE,
    ...
  )

  if (identical(ref_data, FALSE)) return(new_data)

  if (identical(ref_data, TRUE)) {
    ref_data <- data_set(object)
    ref_data <- newdata::new_data(ref_data)
  }
  ref_data <- mcmc_derive_fun(
    object,
    new_data = ref_data,
    new_expr = new_expr,
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    random_effects = random_effects,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE,
    ...
  )

  ref_data <- rep(ref_data, nrow)

  ref_data <- purrr::reduce(ref_data, bind_dimensions, along = 1L)

  ref_data <- list(ref_data)
  names(ref_data) <- names(new_data)
  class(ref_data) <- "mcmcr"

  object <- combine_samples(ref_data, new_data, fun = ref_fun2)
  object
}

#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @return A object of class mcmcr.
#' @export
mcmc_derive.mb_analyses <- function(object,
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

  chk_flag(beep)

  if (beep) on.exit(beepr::beep())

  ic <- IC(object)

  if (!all(is.finite(ic$IC))) err("non-finite IC values", tidy = FALSE)

  object <- llply(
    object,
    mcmc_derive,
    new_data = new_data,
    new_expr = new_expr,
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE
  )

  set_weight <- function(x, weight) mcmc_map(x, .f = function(x, weight) x * weight, weight = weight)

  object <- purrr::map2(object, ic$ICWt, set_weight)

  object <- purrr::reduce(object, combine_samples, fun = sum)

  object
}
