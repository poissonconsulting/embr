#' MB Model
#'
#' Creates or retrieves an object inherting from class mb_model.
#'
#' @param x The object.
#' @param ... Additional arguments.
#' @return An object inheriting from class mb_model.
#' @export
model <- function(x, ...) {
  UseMethod("model")
}

#' @export
model.character <- function(
    x,
    gen_inits = function(data) {list()},
    random_effects = list(),
    fixed = getOption("mb.fixed", "^[^e]"),
    derived = character(0),
    select_data = list(),
    center = character(0),
    scale = character(0),
    modify_data = identity,
    nthin = getOption("mb.nthin", 1L),
    new_expr = NULL,
    new_expr_vec = NULL,
    modify_new_data = identity,
    drops = list(),
    ...
) {

  x <- mb_code(x)

  model(
    x,
    gen_inits = gen_inits,
    fixed = fixed,
    derived = derived,
    random_effects = random_effects,
    select_data = select_data,
    center = center,
    scale = scale,
    modify_data = modify_data,
    nthin = nthin,
    new_expr = {{ new_expr }},
    new_expr_vec = new_expr_vec,
    modify_new_data = modify_new_data,
    drops = drops
  )
}

model_mb_code <- function(x,
                          gen_inits = function(data) {list()},
                          random_effects = list(),
                          fixed = getOption("mb.fixed", "^[^e]"),
                          derived = character(0),
                          select_data = list(),
                          center = character(0),
                          scale = character(0),
                          modify_data = identity,
                          nthin = getOption("mb.nthin", 1L),
                          new_expr = NULL,
                          new_expr_vec = NULL,
                          modify_new_data = identity,
                          drops = list(),
                          ...) {

  check_mb_code(x)
  check_single_arg_fun(gen_inits)
  check_uniquely_named_list(random_effects)
  chk_string(fixed)
  check_unique_character_vector(derived)
  check_uniquely_named_list(select_data)
  check_valid_rescalers(names(select_data))
  check_unique_character_vector(center)
  check_unique_character_vector(scale)
  check_single_arg_fun(modify_data)
  check_single_arg_fun(modify_new_data)
  chk_null_or(new_expr_vec, vld = vld_logical)
  new_expr <- enexpr_new_expr({{ new_expr }}, vectorize = new_expr_vec)
  chk_whole_number(nthin)
  chk_scalar(nthin)
  check_drops(drops)

  select_colnames <- rescale::get_rescaler_colnames(names(select_data))
  if(!length(select_colnames)) select_colnames <- NULL

  if (!identical(center, character(0)) || !identical(scale, character(0))) {
    if (!identical(names(select_data), select_colnames))
      err("scaling (and transforms) should be specified with select_data or center/scale not both", tidy = FALSE)

    warning("arguments center and scale are deprecated; please use select_data instead.",
            call. = FALSE)
  }

  check_all_elements_class_character(random_effects)
  check_x_in_y(unlist(random_effects), select_colnames,
               x_name = "random_effects", y_name = "select_data",
               type_x = "elements", type_y = "names")
  check_x_not_in_y(names(random_effects), select_colnames,
                   x_name = "random_effects", y_name = "select_data",
                   type_x = "names", type_y = "names")
  check_x_not_in_y(derived, select_colnames,
                   x_name = "derived", y_name = "select_data", type_y = "names")
  check_x_not_in_y(names(random_effects), derived,
                   x_name = "random_effects", y_name = "derived", type_x = "names")
  check_x_not_in_y(unlist(random_effects), center, x_name = "random_effects",
                   type_x = "elements")
  check_x_not_in_y(unlist(random_effects), scale, x_name = "random_effects",
                   type_x = "elements")
  check_x_not_in_y(derived, center, x_name = "random_effects",
                   type_x = "elements")
  check_x_not_in_y(derived, scale, x_name = "random_effects",
                   type_x = "elements")

  check_x_in_y(center, select_colnames, y_name = "select_data", type_y = "names")
  check_x_in_y(scale, select_colnames, y_name = "select_data", type_y = "names")

  derived <- check_model_pars(x, fixed, random = names(random_effects),
                         derived = derived, drops = unlist(drops))

  center <- sort(center)
  scale <- sort(scale)
  random_effects <- sort_nlist(random_effects)

  obj <- list(
    code = x,
    gen_inits = gen_inits,
    fixed = fixed,
    derived = derived,
    select_data = select_data,
    center = center,
    scale = scale,
    random_effects =  random_effects,
    modify_data = modify_data,
    new_expr = new_expr,
    modify_new_data = modify_new_data,
    drops = drops,
    nthin = nthin
  )
  class(obj) <- class(x)
  class(obj) <- sub("code", "model", class(obj))
  obj
}

#' MB Model
#'
#' Creates MB model.
#'
#' For tmb models gen_inits must specify all the fixed pars.
#' Missing random pars are assigned the value 0.
#'
#' For jmb models unspecified the initial values for each chain are drawn from the prior distributions.
#'
#' @param x An object inheriting from class mb_code.
#' @param gen_inits A single argument function taking the modified data and
#' returning a named list of initial values.
#' @param random_effects A named list specifying the random effects and the associated factors.
#' @param fixed A string of a regular expression specifying the fixed pars to monitor.
#' @param derived A character vector of the derived pars to monitor.
#' @param select_data A named list specifying the columns to select and their associated classes and values as well as transformations and scaling options.
#' @inheritParams rescale::rescale
#' @param modify_data A single argument function to modify the data (in list form) immediately prior to the analysis.
#' @param nthin A count specifying the thinning interval.
#' @param new_expr A string of R code specifying the predictive relationships.
#' @param new_expr_vec A flag specifying whether to vectorize the new_expr code.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param drops A list of character vector of possible scalar pars to drop (fix at 0).
#' @param ... Unused arguments.
#' @return An object inherting from class mb_model.
#' @seealso \code{\link[chk]{check_data}} \code{\link[rescale]{rescale_c}}
#' @export
model.mb_code <- function(
    x,
    gen_inits = function(data) {list()},
    random_effects = list(),
    fixed = getOption("mb.fixed", "^[^e]"),
    derived = character(0),
    select_data = list(),
    center = character(0),
    scale = character(0),
    modify_data = identity,
    nthin = getOption("mb.nthin", 1L),
    new_expr = NULL,
    new_expr_vec = FALSE,
    modify_new_data = identity,
    drops = list(),
    ...
) {

  model_mb_code(
    x = x,
    gen_inits = gen_inits,
    random_effects = random_effects,
    fixed = fixed,
    derived = derived,
    select_data = select_data,
    center = center,
    scale = scale,
    modify_data = modify_data,
    nthin = nthin,
    new_expr = {{ new_expr }},
    new_expr_vec = new_expr_vec,
    modify_new_data = modify_new_data,
    drops = drops
  )
}

#' @export
model.mb_analysis <- function(x, ...) {
  x$model
}
