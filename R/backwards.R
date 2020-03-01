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
#' @param model An object.
#' @param data Data.
#' @param drops A list of character vectors specifying the scalar parameters to consider.
#' @param conf_level A number specifying the confidence level. By default 0.95.
#' @param beep A flag indicating whether to beep on completion of the analysis.
#' @param ... Unused.
#' @return A list of the analyses.
#' @export
backwards <- function(model, data, drops = list(), conf_level = getOption("mb.conf_level", 0.95),
                      beep = getOption("mb.beep", TRUE), ...) {
  UseMethod("backwards")
}

#' @export
backwards.mb_model <- function(model, data, drops = list(), conf_level = getOption("mb.conf_level", 0.95),
                               beep = getOption("mb.beep", TRUE), ...) {

  .NotYetImplemented()

  chk_flag(beep)
  if (beep) on.exit(beepr::beep(2))

  if (!length(drops)) drops <- model$drops

  drops_org <- drops

  to_drop <- character(0)
  dropped <- list(character(0))

  analysis <- analyse(model, data, beep = FALSE)
  analyses <- list(analysis)

  next_drop <- next_drop(analysis, drops, conf_level = conf_level)

  while (length(next_drop)) {
    cat("dropping", next_drop, "...\n")

    drops %<>% eliminate_drop(next_drop)
    to_drop %<>% c(next_drop)
    dropped %<>% c(to_drop)

    analysis <- analyse(model, data, drop = to_drop, beep = FALSE)
    analyses %<>% c(list(analysis))

    next_drop <- next_drop(analysis, drops, conf_level = conf_level)
  }
  names(analyses) <- model_names(dropped, drops_org)
  analyses
}
