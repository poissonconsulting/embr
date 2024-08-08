#' Make All Models
#'
#' @param model The full model.
#' @param drops A list of character vectors specifying possible drops.
#' @return A list of objects inheriting from class mb_model.
#' @export
make_all_models <- function(model, drops = list()) {
  check_mb_model(model)
  check_drops(drops)

  if (!length(drops)) drops <- model$drops

  if (!length(drops)) {
    return(models(full = model))
  }

  drops <- make_all_drops(drops)
  models <- rep(list(model), length(drops))
  models <- purrr::map2(models, drops, drop_pars)
  names(models) <- names(drops)
  as.models(models)
}
