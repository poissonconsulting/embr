#' Analyse
#'
#' Analyse a data set and model.
#'
#' @inheritParams analyse_data
#' @param model An object inheriting from class mb_model or a list of such objects.

#' @export
analyse <- function(model, data, drop = character(0),
                    quick = getOption("mb.quick", FALSE),
                    quiet = getOption("mb.quiet", TRUE),
                    beep = getOption("mb.beep", TRUE),
                    ...) {
  UseMethod("analyse")
}

#' @export
analyse.list <- function(model, data, drop = character(0),
                         quick = getOption("mb.quick", FALSE),
                         quiet = getOption("mb.quiet", TRUE),
                         beep = getOption("mb.beep", TRUE),
                         ...) {
  check_flag(beep)

  if (beep) on.exit(beepr::beep())

  plyr::llply(model, analyse, data = data, drop = drop,
              quick = quick, quiet = quiet, beep = FALSE, ...)
}

#' @export
analyse.mb_model <- function(model, data, drop = character(0),
                             quick = getOption("mb.quick", FALSE),
                             quiet = getOption("mb.quiet", TRUE),
                             beep = getOption("mb.beep", TRUE),
                             ...) {
  error("analyse is not defined for objects of the virtual class 'mb_model'")
}
