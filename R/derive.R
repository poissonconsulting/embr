#' Derive
#'
#' Calculate derived parameters.
#'
#' @inheritParams mcmc_derive_data.mb_analysis
#' @return A object of class mcmcr.
#' @seealso
#' * The [prediction article](https://poissonconsulting.github.io/embr/articles/prediction.html)
#'   for worked patterns including arithmetic on `mcmcr` posteriors.
#' * [predict.mb_analysis()] for tidy posterior summaries at new covariate
#'   values.
#' * [mcmc_derive_data.mb_analysis()] for raw MCMC samples paired with
#'   `new_data` and group-level summaries.
#' * [mcmcr::combine_samples()] for combining MCMC samples across independent
#'   analyses on shared data keys.
#' @examples
#' \dontrun{
#' # `analysis` is a fitted mb_analysis whose new_expr defines scalar terms
#' # `eBaseCount` and `eRestoredEffect`.
#'
#' # Pull related scalars by regex; shared iteration ordering supports
#' # downstream arithmetic.
#' scalars <- mcmc_derive(
#'   analysis,
#'   new_data = character(0),
#'   term = "^(eBaseCount|eRestoredEffect)$"
#' )
#'
#' # Arithmetic on mcmcr objects propagates posterior uncertainty
#' high_count <- scalars$eBaseCount * scalars$eRestoredEffect
#' coef(high_count)
#'
#' # Custom expression with injected scalar constants
#' as.mcmcr(analysis) |>
#'   mcmc_derive(
#'     expr = "biomass <- exp(bIntercept) * mean_mass_g",
#'     values = list(mean_mass_g = 250)
#'   ) |>
#'   coef()
#' }
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
                                    new_expr_vec = getOption("mb.new_expr_vec", FALSE),
                                    parallel = getOption("mb.parallel", FALSE),
                                    quiet = getOption("mb.quiet", TRUE),
                                    ...) {
  chk_function(ref_fun2)

  if (!vld_data(new_data) && !vld_character(new_data)) {
    chkor_vld(vld_data(new_data), vld_character(new_data))
  }
  if (!vld_flag(ref_data) && !vld_data(ref_data)) {
    chkor_vld(vld_flag(ref_data), vld_data(ref_data))
  }

  if (is.character(new_data)) {
    new_data <- newdata::new_data(data_set(object), new_data)
  }

  nrow <- nrow(new_data)

  new_data <- mcmc_derive_fun(
    object,
    new_data = new_data,
    new_expr = {{ new_expr }},
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    random_effects = random_effects,
    new_expr_vec = new_expr_vec,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE,
    ...
  )

  if (identical(ref_data, FALSE)) {
    return(new_data)
  }

  if (identical(ref_data, TRUE)) {
    ref_data <- data_set(object)
    ref_data <- newdata::new_data(ref_data)
  }
  ref_data <- mcmc_derive_fun(
    object,
    new_data = ref_data,
    new_expr = {{ new_expr }},
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    random_effects = random_effects,
    new_expr_vec = new_expr_vec,
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
                                    new_expr_vec = getOption("mb.new_expr_vec", FALSE),
                                    parallel = getOption("mb.parallel", FALSE),
                                    quiet = getOption("mb.quiet", TRUE),
                                    ...) {
  ic <- IC(object)

  if (!all(is.finite(ic$IC))) err("non-finite IC values", tidy = FALSE)

  object <- lapply(
    object,
    mcmc_derive,
    new_data = new_data,
    new_expr = {{ new_expr }},
    new_values = new_values,
    term = term,
    modify_new_data = modify_new_data,
    ref_data = ref_data,
    new_expr_vec = new_expr_vec,
    parallel = parallel,
    quiet = quiet,
    beep = FALSE
  )

  set_weight <- function(x, weight) mcmc_map(x, .f = function(x, weight) x * weight, weight = weight)

  object <- purrr::map2(object, ic$ICWt, set_weight)

  object <- purrr::reduce(object, combine_samples, fun = sum)

  object
}
