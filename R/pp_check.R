#' Posterior predictive checks for an MB analysis
#'
#' @param analysis The mb_analysis object.
#' @param y Character naming response to compare with posterior predictions.
#' @param nrep Integer number of posterior predictive replicates. Defaults to 100.
#' @param plot Should posterior predictions be plotted? Default is TRUE.
#' @param ... unused.
#'
#' @return A list of \code{y} and \code{nrep} posterior predictions the same length as \code{y}.
#'
#' @seealso \link{pp_check}
#'
#' @export
pp_check.mb_analysis <- function(analysis, y, nrep = 100L, plot = TRUE, ...) {

  # Extract new_expr and data_set from mb_analysis object
  model <- analysis$model
  expr <- analysis$model$new_expr
  values <- data_set(analysis) %>% modify_data(model) %>% llply(as.numeric)
  chains <- nchains(analysis)
  iters <- analysis$ngens
  monitor <- "prediction"
  variables_expr <- all.vars(parse(text = expr))

  # Checks
  if (!y %in% names(values)) error(y, ' must be in data')
  check_string(expr)
  if (!is.list(values)) error("values must be a list")
  check_string(monitor)
  if (!monitor %in% variables_expr) error(monitor, ' must be in expression')

  expr %<>% parse(text = .)

  # Randomly sample iterations if nrep is less than total
  if (nrep < iters * chains) {
    sample_iters <- sample(iters * chains, nrep, replace = FALSE)
    sample_chains <- sample_iters %>% divide_by(iters) %>% ceiling() %>% as.integer()
    sample_iters %<>% subtract(iters * (sample_chains - 1)) %>% as.integer()
    analysis %<>% as.mcmcr() %<>% subset(chains = sample_chains,
                                         iterations = sample_iters)
  } else {
    if (nrep > iters * chains) warning(str_c(iters * chains, " < ", nrep, ". Returning ", iters * chains, " posterior predictions instead."))
    analysis %<>% as.mcmcr()
  }

  n <- length(values[[y]]) # length of respond vector
  prediction <- data.frame(matrix(NA, nrow = n, ncol = nrep)) %>%
    set_colnames(str_c("pp_", 1:nrep))
  for (i in 1L:nrep) {

    x <- subset(analysis, iterations = i) %>%
      estimates() %>%
      c(values)
    x$prediction <- NA
    prediction[, i] <- within(x, eval(expr)) %>% use_series(prediction)
  }

  if (plot) bayesplot::ppc_dens_overlay(values[[y]], t(as.matrix(prediction)), ...)

  prediction %<>% as.list()
  prediction[[y]] <- values[[y]]
  prediction

}
