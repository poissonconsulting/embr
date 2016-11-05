#' Backwards
#'
#' Perform backwards step-wise regression on a model.
#' Returns a list of the analysis at each step sorted by increasing number
#' of parameters ie. the final model is the first element in the list.
#'
#' @inheritParams analyse_data
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @return A list of the analyses.
#' @export
backwards <- function(model, data, drop = character(0), conf_level = 0.95,
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE), ...) {
  UseMethod("backwards")
}

#' @export
backwards.mb_model <- function(model, data, drop = character(0), conf_level = 0.95,
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE), ...) {
  check_vector(drop, "", min_length = 0)
  check_unique(drop)

  if (beep) on.exit(beepr::beep(2))

  dropped <- character(0)

  analysis <- analyse(model, data, quick = quick, quiet = quiet, beep = beep)
  analyses <- list(analysis)

  next_drop <- next_drop(analysis, drop, conf_level = conf_level)

  while (length(next_drop)) {
    cat("dropping", next_drop, "...\n")

    drop <- drop[drop != next_drop]
    dropped %<>% c(next_drop)

    analysis <- analyse(model, data, drop = dropped, quick = quick, quiet = quiet, beep = beep)
    analyses %<>% c(list(analysis))

    next_drop <- next_drop(analysis, drop, conf_level = conf_level)
  }
  rev(analyses)
}
