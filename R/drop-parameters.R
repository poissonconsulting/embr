#' Drop pars
#'
#' Drops named scalar fixed pars from an object by fixing them at 0.
#'
#' @param x The object.
#' @param pars A character vector of the pars to drop.
#' @param ... Not used.
#' @return The updated object.
#' @export
drop_pars <- function(x, pars = character(0), ...) {
  UseMethod("drop_pars")
}

#' @export
drop_pars.character <- function(x, pars = character(0), ...) {
  chk_s3_class(pars, "character")
  chk_not_any_na(pars)
  chk_unique(pars)


  if (!length(pars)) {
    return(x)
  }

  # check that [ not in parameter name or followed by [ in x
  if (any(grepl("\\[", pars))) err("pars must be scalar", tidy = FALSE)
  if (length(x) & length(pars)) {
    if (length(x) && any(stringr::str_detect(x, p0(pars, "\\s*\\[")))) {
      err("pars must be scalar", tidy = FALSE)
    }
  }
  for (parameter in pars) {
    x <- gsub(p0("\\b", parameter, "\\s+"), p0("0 "), x)
  }
  x
}

#' @export
drop_pars.default <- function(x, pars = character(0), ...) {
  if (is.language(x)) {
    return(drop_pars_language(x, pars, ...))
  }
  err("drop_pars() not implemented for class ", class(x), tidy = FALSE)
}

drop_pars_language <- function(expr, pars = character(0), ...) {
  chk_s3_class(pars, "character")
  chk_not_any_na(pars)
  chk_unique(pars)

  if (!length(pars)) {
    return(expr)
  }

  # check that [ not in parameter name or followed by [ in x
  if (any(grepl("\\[", pars))) err("pars must be scalar", tidy = FALSE)

  walk_ast <- function(x) {
    switch_expr(x,
      # Base cases
      constant = x,
      symbol = {
        if (as.character(x) %in% pars) {
          x <- 0
        }
        x
      },
      # Recursive cases
      call = {
        # go into [ to remove i's or add cbind
        if (x[[1]] == "[") {
          if (as.character(x[[2]]) %in% pars) {
            # FIXME: This could be handled by replacing the entire call with 0
            # to support elision of array paramters
            err("pars must be scalar", tidy = FALSE)
          }
        }

        # Use base R variant because map2() catches all errors
        args <- lapply(as.list(x)[-1], walk_ast)
        rlang::call2(x[[1]], !!!args)
      },
      pairlist = x
    )
  }

  walk_ast(expr)
}

#' @export
drop_pars.mb_model <- function(x, pars = character(0), ...) {
  chk_s3_class(pars, "character")
  chk_not_any_na(pars)
  chk_unique(pars)


  if (!length(pars)) {
    return(x)
  }

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
