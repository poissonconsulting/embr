#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams derive_data.mb_analysis
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

#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams derive_data.mb_analysis
#' @return A object of class mcmcr.
#' @export
derive.mb_analyses <- function(object,
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

  if (beep) on.exit(beepr::beep())

  ic <- IC(object)

  if (!all(is.finite(ic$IC))) error("non-finite IC values")

  object %<>% llply(derive, new_data = new_data, new_expr = new_expr,
                      new_values = new_values, term = term,
                      modify_new_data = modify_new_data, ref_data = ref_data,
                      parallel = parallel, quiet = quiet, beep = FALSE)

  set_weight <- function(x, weight) mcmc_map(x, .f = magrittr::multiply_by, weight)

  object %<>% purrr::map2(ic$ICWt, set_weight)

  object %<>% purrr::reduce(combine_values, fun = sum)

  object
}
