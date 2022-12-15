#' @export
generics::tidy

#' @export
tidy.mb_analysis <- function(x, conf_level = getOption("mb.conf_level", 0.95), ...) {
  coef <- coef(x, conf_level = conf_level, beep = FALSE, simplify = TRUE)

  coef <- coef[c("term", "estimate", "lower", "upper")]

  if (!nrow(coef)) return(coef)

  if (is_bayesian(x)) {
    mcmcr <- as.mcmcr(x)
    mcmcr <- subset(mcmcr, pars = pars(x))

    rhat <- rhat(mcmcr, by = "term", as_df = TRUE)
    esr <- esr(mcmcr, by = "term", as_df = TRUE)

    coef <- merge(coef, esr, by = "term")
    coef <- merge(coef, rhat, by = "term")
  }
  coef
}
