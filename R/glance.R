#' @export
generics::glance

#' @export
glance.mb_analysis <- function(x, rhat = getOption("mb.rhat", 1.1), esr = getOption("mb.esr", 0.33), ...) {
  glance <- tibble(
    n = sample_size(x),
    K = nterms(x, include_constant = FALSE)
  )

  if (is_bayesian(x)) {
    glance$nchains <- nchains(x)
    glance$niters <- niters(x)
    glance$nthin <- nthin(x)
    glance$ess <- ess(x)
    glance$rhat <- rhat(x)
  }

  glance$converged <- converged(x, rhat = rhat, esr = esr)
  glance
}

#' @export
glance.mb_analyses <- function(
    x, rhat = getOption("mb.rhat", 1.1), bound = FALSE, ...) {
  chk_flag(bound)
  if (bound) {
    if (!is_bayesian(x)) {
      err("glance with bound = TRUE is only defined for Bayesian analyses.", tidy = FALSE)
    }

    glance <- glance(x, rhat = rhat)
    rhat_all <- rhat(x, bound = TRUE)

    if (packageVersion("mcmcr") >= "0.6.1.9001") {
      rhat_all <- rhat_all$bound
    }

    converged <- all(glance$rhat <= rhat) && rhat_all <= rhat

    rhat <- glance[c("model", "rhat")]
    glance <- glance[1, c("n", "K", "nchains", "niters")]
    rhat$model <- p0("rhat_", rhat$model)
    rhat <- matrix(rhat$rhat, nrow = 1, dimnames = list("1", rhat$model))
    rhat <- as.data.frame(rhat)
    glance <- cbind(glance, rhat)

    glance$rhat_all <- rhat_all

    glance$converged <- converged

    return(as_tibble(glance))
  }
  x <- purrr::map_dfr(x, glance, .id = "model")
  x
}
