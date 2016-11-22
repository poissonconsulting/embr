#' Make All Models
#'
#' @param model The full model.
#' @param drops A list of character vectors specifying possible drops.
#' @return A list of objects inheriting from class mb_model.
#' @export
make_all_models <- function(model, drops = list()) {
  check_mb_model(model)
  check_drops(drops)
  if (!length(drops)) return(list(model))

  drops %<>% make_all_drops()
  models <- rep(list(model), length(drops))
  models %<>% purrr::map2(drops, drop_parameters)
  drops %<>% lapply(str_c, collapse = " ") %>% unlist()
  drops[1] <- ""
  names(models) <- drops
  models
}
