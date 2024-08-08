# Inspiration from Advanced R
expr_type <- function(x) {
  if (rlang::is_syntactic_literal(x)) {
    "constant"
  } else if (is.symbol(x)) {
    "symbol"
  } else if (is.call(x)) {
    "call"
  } else if (is.pairlist(x)) {
    "pairlist"
  } else {
    typeof(x)
  }
}

switch_expr <- function(x, ...) {
  switch(expr_type(x),
    ...,
    stop("Don't know how to handle type ", typeof(x), call. = FALSE)
  )
}

edit_residuals_code <- function(new_expr, type = NULL, simulate = NULL) {
  residual_assignment_found <- FALSE

  is_residual <- function(xx) {
    if (identical(xx, as.name("residual"))) {
      return(TRUE)
    }

    if (is.call(xx) && xx[[1]] == "[" && xx[[2]] == "residual") {
      return(TRUE)
    }

    return(FALSE)
  }

  is_res_call <- function(xx) {
    is.call(xx) && grepl("^res_[[:alnum:]_]+$", rlang::as_string(xx[[1]]), perl = TRUE)
  }

  tweak_res_call <- function(xx) {
    args <- as.list(xx)[-1]
    if (!is.null(type)) {
      args <- c(args, list(type = type))
    }
    if (!is.null(simulate)) {
      args <- c(args, list(simulate = simulate))
    }

    rlang::call2(xx[[1]], !!!args)
  }

  walk_ast <- function(x) {
    switch_expr(
      x,
      # Base cases
      constant = x,
      symbol = x,
      # Recursive cases
      call = {
        # go into [ to remove i's or add cbind
        if (x[[1]] == "<-") {
          if (is_residual(x[[2]]) && is_res_call(x[[3]])) {
            x[[3]] <- tweak_res_call(x[[3]])
            residual_assignment_found <<- TRUE
            return(x)
          }
        }

        # Use base R variant because map2() catches all errors
        args <- lapply(as.list(x)[-1], walk_ast)
        rlang::call2(x[[1]], !!!args)
      },
      pairlist = x
    )
  }

  new_expr <- walk_ast(new_expr)

  if (!residual_assignment_found) {
    err("`new_expr` must include `residual <- res_xxx(` or `residual[i] <- res_xxx(`.")
  }

  new_expr
}

#' Simulate Residuals
#'
#' Requires that new_expr includes `residual <- res_bern(`
#' or `residual[i] <- res_norm(`.
#'
#' @param x The MB analysis object.
#' @inheritParams params
#' @return An mcmc_data of the simulated residuals.
#' @seealso extras::res_binom
#' @export
simulate_residuals <- function(x, type = NULL) {
  chk_s3_class(x, "mb_analysis")
  chk_null_or(type, vld = vld_string)

  new_expr <- new_expr(x)
  chk_true(is.call(new_expr))

  new_expr <- edit_residuals_code(new_expr, type = type, simulate = TRUE)

  inject(mcmc_derive_data(x, new_expr = !!new_expr, term = "^residual$"))
}
