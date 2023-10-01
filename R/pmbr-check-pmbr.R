# From Nimble user manual
sd_dists <- c("dnorm", "dlnorm", "dt", "dbeta", "dgamma")

check_pmbr <- function(expr) {
  switch(expr_type(expr),
    call = {
      if (as.character(expr[[1]]) %in% sd_dists) {
        if (names2(as.list(expr))[[3]] != "sd") {
          err("`", as.character(expr[[1]]), "` must be used with a named argument `sd`")
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
