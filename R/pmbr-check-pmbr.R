# From Nimble user manual
sd_dists <- c("dnorm")

check_pmbr <- function(expr) {
  switch(expr_type(expr),
    call = {
      if (as.character(expr[[1]]) %in% sd_dists) {
        if (names2(as.list(expr))[[3]] != "sd") {
          err("`", as.character(expr[[1]]), "()` must be used with a named argument `sd`")
        }
        if (is.call(expr[[3]])) {
          if (expr[[3]][[1]] == "^") {
            if (expr[[3]][[3]][[1]] == "-" && expr[[3]][[3]][[2]] == 2) {
              err(
                "The `sd` argument to `",
                as.character(expr[[1]]),
                "()` must be a standard deviation, not a term like `... ^ -2`"
              )
            }
            if (expr[[3]][[3]][[1]] == "(" && expr[[3]][[3]][[2]][[1]] == "-" && expr[[3]][[3]][[2]][[2]] == 2) {
              err(
                "The `sd` argument to `",
                as.character(expr[[1]]),
                "()` must be a standard deviation, not a term like `... ^ (-2)`"
              )
            }
          }
          if (expr[[3]][[1]] == "/" && expr[[3]][[2]] == 1) {
            err(
              "The `sd` argument to `",
              as.character(expr[[1]]),
              "()` must be a standard deviation, not a term like `1 / ...`"
            )
          }
        }
      }
      walk(as.list(expr)[-1], check_pmbr)
    }
  )
}

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
