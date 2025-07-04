#' Update MB Model
#'
#' Updates an object inherting from class mb_model.
#'
#' @param model The model to update.
#' @param code A string of the model template or an object inheriting from class mb_code.
#' @inheritParams model
#' @return An object inheriting from class mb_model.
#' @export
update_model <- function(
    model,
    code = NULL,
    gen_inits = NULL,
    random_effects = NULL,
    fixed = NULL,
    derived = NULL,
    select_data = NULL,
    center = NULL,
    scale = NULL,
    modify_data = NULL,
    nthin = NULL,
    new_expr = NULL,
    new_expr_vec = NULL,
    modify_new_data = NULL,
    drops = NULL,
    ...) {
  UseMethod("update_model")
}

#' @export
update_model.mb_model <- function(
    model,
    code = NULL,
    gen_inits = NULL,
    random_effects = NULL,
    fixed = NULL,
    derived = NULL,
    select_data = NULL,
    center = NULL,
    scale = NULL,
    modify_data = NULL,
    nthin = NULL,
    new_expr = NULL,
    new_expr_vec = NULL,
    modify_new_data = NULL,
    drops = NULL,
    ...) {
  if (is.null(code)) code <- code(model)
  if (is.null(gen_inits)) gen_inits <- model$gen_inits
  if (is.null(random_effects)) random_effects <- model$random_effects
  if (is.null(fixed)) fixed <- model$fixed
  if (is.null(derived)) derived <- model$derived
  if (is.null(select_data)) select_data <- model$select_data
  if (is.null(center)) center <- model$center
  if (is.null(scale)) scale <- model$scale
  if (is.null(modify_data)) modify_data <- model$modify_data
  if (is.null(nthin)) nthin <- model$nthin
  if (is.null(new_expr_vec)) new_expr_vec <- model$new_expr_vec
  new_expr <- enexpr_new_expr({{ new_expr }}, default = model$new_expr, vectorize = new_expr_vec)
  if (is.null(modify_new_data)) modify_new_data <- model$modify_new_data
  if (is.null(drops)) drops <- model$drops

  inject(model(
    x = code,
    gen_inits = gen_inits,
    random_effects = random_effects,
    fixed = fixed,
    derived = derived,
    select_data = select_data,
    center = center,
    scale = scale,
    modify_data = modify_data,
    nthin = nthin,
    new_expr = !!new_expr,
    new_expr_vec = new_expr_vec,
    modify_new_data = modify_new_data,
    drops = drops
  ))
}
