#' Analyse Priors
#'
#' Analyse the priors to determine if they are influencing the posteriors.
#'
#' @inheritParams analyse
#' @param multipliers A numeric vector of values to multiply the standard deviation of simple normal prior distributions by.
#' @param analysis The analysis object with the priors to analyse.
#' @param ...  Additional arguments.
#' @export
analyse_priors <- function(analysis, multipliers = c(0.5, 2),
                           parallel = getOption("mb.parallel", FALSE),
                           quick = getOption("mb.quick", FALSE),
                           quiet = getOption("mb.quiet", TRUE),
                           beep = getOption("mb.beep", TRUE),
                           ...) {
  UseMethod("analyse_priors")
}

#' @export
analyse_priors.mb_analysis <- function(analysis, multipliers = c(0.5, 2),
                                       parallel = getOption("mb.parallel", FALSE),
                                       quick = getOption("mb.quick", FALSE),
                                       quiet = getOption("mb.quiet", TRUE),
                                       beep = getOption("mb.beep", TRUE),
                                       ...) {
  check_vector(multipliers, c(0, 10))
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  if (!is.null(analysis$priors)) error("prior analyses have already been generated")

  multipliers %<>% unique() %>% sort()

  model <- model(analysis)

  models <- plyr::rlply(length(multipliers), model)
  models %<>% purrr::map2(multipliers, adjust_priors, ...)

  names(models) <- multipliers

  analysis$priors <- analyse(models, data = data_set(analysis), parallel = parallel,
                      quick = quick, quiet = quiet, beep = FALSE)
  analysis
}
