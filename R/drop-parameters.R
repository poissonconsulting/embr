#' Drop pars
#'
#' Drops named scalar fixed pars from an object by fixing them at 0.
#'
#' @param x The object.
#' @param pars A character vector of the pars to drop.
#' @param ... Not used.
#' @return The updated object.
#' @export
drop_pars <- function(x, pars = character(0), ...) {UseMethod("drop_pars")}

#' @export
drop_pars.character <- function(x, pars = character(0), ...) {
  chk_s3_class(pars, "character")
  chk_not_any_na(pars)
  chk_unique(pars)


  if (!length(pars))
    return(x)

  # check that [ not in parameter name or followed by [ in x
  if (any(str_detect(pars, "\\["))) err("pars must be scalar")
  if (any(str_detect(x, str_c(pars, "\\s*\\["))))
    err("pars must be scalar")

  for (parameter in pars) {
    x <- str_replace_all(x, str_c("\\b", parameter, "\\s+"), str_c("0 "))
  }
  x
}

#' @export
drop_pars.mb_model <- function(x, pars = character(0), ...) {
  chk_s3_class(pars, "character")
  chk_not_any_na(pars)
  chk_unique(pars)


  if (!length(pars)) return(x)

  x$code <- drop_pars(x$code, pars = pars)
  x$new_expr <- drop_pars(x$new_expr, pars = pars)
  x$drops <- list()
  x
}

#' @export
drop_pars.lmb_code <- function(x, pars = character(0), ...) {
  .NotYetImplemented()
  x
}

