#' Backwards
#'
#' Perform backwards step-wise regression on a model.
#' Returns a list of the analysis at each step starting with the full model.
#'
#' drop is a list of character vectors specifying the scalar parameters to possibly drop.
#' If a list element consists of two or more strings then the earlier strings
#' are only available to drop after the later strings have been eliminated.
#' This allows polynomial dependencies to be respected.
#'
#' @inheritParams analyse
#' @param drops A list of character vectors specifying the scalar parameters to consider.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param parallel A flag indicating whether to perform the analysis in parallel if possible.
#' @return A list of the analyses.
#' @export
backwards <- function(model, data, drops = list(), conf_level = 0.95,
                      parallel = getOption("mb.parallel", FALSE),
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE), ...) {
  UseMethod("backwards")
}

#' @export
backwards.mb_model <- function(model, data, drops = list(), conf_level = 0.95,
                               parallel = getOption("mb.parallel", FALSE),
                               quick = getOption("mb.quick", FALSE),
                               quiet = getOption("mb.quiet", TRUE),
                               beep = getOption("mb.beep", TRUE), ...) {

  check_flag(beep)
  if (beep) on.exit(beepr::beep(2))

  if (!length(drops)) drops <- model$drops

  drops_org <- drops

  to_drop <- character(0)
  dropped <- list(character(0))

  analysis <- analyse(model, data, parallel = parallel, quick = quick, quiet = quiet, beep = beep)
  analyses <- list(analysis)

  next_drop <- next_drop(analysis, drops, conf_level = conf_level)

  while (length(next_drop)) {
    cat("dropping", next_drop, "...\n")

    drops %<>% eliminate_drop(next_drop)
    to_drop %<>% c(next_drop)
    dropped %<>% c(to_drop)

    analysis <- analyse(model, data, drop = to_drop, parallel = parallel, quick = quick, quiet = quiet, beep = beep)
    analyses %<>% c(list(analysis))

    next_drop <- next_drop(analysis, drops, conf_level = conf_level)
  }
  names(analyses) <- model_names(dropped, drops_org)
  analyses
}
