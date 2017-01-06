#' Update MB Model
#'
#' Updates an object inherting from class mb_model.
#'
#' @param model The model to update.
#' @param code A string of the model template or an object inheriting from class mb_code.
#' @inheritParams model.mb_code
#' @return An object inheriting from class mb_model.
#' @export
update_model <- function(model, code = NULL, gen_inits = NULL,
                         random_effects = NULL, monitor = NULL, select_data = NULL,
                         center = NULL, scale = NULL, modify_data = NULL,
                         niters = NULL, new_expr = NULL, modify_new_data = NULL,
                         drops = NULL, ...) {
  UseMethod("update_model")
}

#' @export
update_model.mb_model <- function(model, code = NULL, gen_inits = NULL,
                                  random_effects = NULL, monitor = NULL, select_data = NULL,
                                  center = NULL, scale = NULL, modify_data = NULL,
                                  niters = NULL, new_expr = NULL, modify_new_data = NULL,
                                  drops = NULL, ...) {

  

  if (is.null(code)) code <- code(model)
  if (is.null(gen_inits)) gen_inits <- model$gen_inits
  if (is.null(random_effects)) random_effects <- model$random_effects
  if (is.null(monitor)) monitor <- model$monitor
  if (is.null(select_data)) select_data <- model$select_data
  if (is.null(center)) center <- model$center
  if (is.null(scale)) scale <- model$scale
  if (is.null(modify_data)) modify_data <- model$modify_data
  if (is.null(niters)) niters <- model$niters
  if (is.null(new_expr)) new_expr <- model$new_expr
  if (is.null(modify_new_data)) modify_new_data <- model$modify_new_data
  if (is.null(drops)) drops <- model$drops

  model(x = code, gen_inits = gen_inits,
        random_effects = random_effects, monitor = monitor, select_data = select_data,
        center = center, scale = scale, modify_data = modify_data,
        niters = niters, new_expr = new_expr, modify_new_data = modify_new_data,
        drops = drops)
}
