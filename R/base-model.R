#' Base Model
#'
#' @param model The full model.
#' @param drops A list of character vectors specifying possible drops.
#' @return The base model (with all drops).
#' @export
base_model <- function(model, drops = list()) {
  check_mb_model(model)
  check_drops(drops)

  if (!length(drops)) drops <- model$drops

  if (!length(drops)) return(list(model))

  drop <- unlist(drops) %>% unique() %>% sort()
  drop_parameters(model, drop)
}
