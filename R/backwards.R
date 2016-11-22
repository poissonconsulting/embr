#' Backwards
#'
#' Perform backwards step-wise regression on a model.
#' Returns a list of the analysis at each step sorted by increasing number
#' of parameters ie. the final model is the first element in the list.
#'
#' drop is a list of character vectors specifying the scalar parameters to possibly drop.
#' If a list element consists of two or more strings then the earlier strings
#' are only available to drop after the later strings have been eliminated.
#' This allows polynomial dependencies to be respected.
#'
#' @inheritParams analyse_data
#' @param drops A list of character vectors specifying the scalar parameters to consider.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @return A list of the analyses.
#' @export
backwards <- function(model, data, drops = list(), conf_level = 0.95,
                      quick = getOption("mb.quick", FALSE),
                      quiet = getOption("mb.quiet", TRUE),
                      beep = getOption("mb.beep", TRUE), ...) {
  UseMethod("backwards")
}

#' @export
backwards.mb_model <- function(model, data, drops = list(), conf_level = 0.95,
                                  quick = getOption("mb.quick", FALSE),
                                  quiet = getOption("mb.quiet", TRUE),
                                  beep = getOption("mb.beep", TRUE), ...) {
  check_flag(beep)
  if (beep) on.exit(beepr::beep(2))

  dropped <- character(0)

  analysis <- analyse(model, data, quick = quick, quiet = quiet, beep = beep)
  analyses <- list("-" = analysis)

  next_drop <- next_drop(analysis, drops, conf_level = conf_level)

  while (length(next_drop)) {
    cat("dropping", next_drop, "...\n")

    drops %<>% eliminate_drop(next_drop)
    dropped %<>% c(next_drop)

    analysis <- analyse(model, data, drop = dropped, quick = quick, quiet = quiet, beep = beep)
    analysis_list <- list(analysis)
    names(analysis_list) <- str_c("", dropped) %>% str_c(collapse = "-")
    analyses %<>% c(analysis_list)

    next_drop <- next_drop(analysis, drops, conf_level = conf_level)
  }
  rev(analyses)
}
