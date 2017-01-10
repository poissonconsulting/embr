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
  x, gen_inits = function(data) {list()}, random_effects = list(),
  fixed = "^[^e]", derived = character(0), select_data = list(),
  center = character(0), scale = character(0), modify_data = identity, niters = 10^3,
  new_expr = character(0), modify_new_data = identity, drops = list(), ...) {

  x %<>% mb_code()

  model(x, gen_inits = gen_inits, fixed = fixed, derived = derived,
        random_effects = random_effects, select_data = select_data,
        center = center, scale = scale, modify_data = modify_data,
        niters = niters, new_expr = new_expr, modify_new_data = modify_new_data,
        drops = drops)
}

#' MB Model
#'
#' Creates MB model.
#'
#' For tmb models gen_inits must specify all the fixed parameters.
#' Missing random parameters are assigned the value 0.
#'
#' For jmb models unspecified the initial values for each chain are drawn from the prior distributions.
#'
#' @param x An object inheriting from class mb_code.
#' @param gen_inits A single argument function taking the modified data and
#' returning a named list of initial values.
#' @param random_effects A named list specifying the random effects and the associated factors.
#' @param fixed A string of a regular expression specifying the fixed parameters to monitor.
#' @param derived A string of a regular expression specifying the derived parameters to monitor.
#' @param select_data A named list specifying the columns to select and their associated classes and values.
#' @inheritParams rescale::rescale
#' @param modify_data A single argument function to modify the data (in list form) immediately prior to the analysis.
#' @param niters A count between 3 and 6 specifying the order of the number of iterations.
#' @param new_expr A string of R code specifying the predictive relationships.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @param drops A list of character vector of possible scalar parameters to drop (fix at 0).
#' @param ... Unused arguments.
#' @return An object inherting from class mb_model.
#' @seealso \code{\link[datacheckr]{check_data}} \code{\link[rescale]{rescale}}
#' @export
model.mb_code <- function(
  x, gen_inits = function(data) {list()}, random_effects = list(), fixed = "^[^e]",
  derived = character(0),
  select_data = list(), center = character(0), scale = character(0),
  modify_data = identity, niters = 10^3,
  new_expr = character(0), modify_new_data = identity, drops = list(), ...) {

  check_mb_code(x)
  check_single_arg_fun(gen_inits)
  check_uniquely_named_list(random_effects)
  check_string(fixed)
  check_unique_character_vector(derived)
  check_uniquely_named_list(select_data)
  check_unique_character_vector(center)
  check_unique_character_vector(scale)
  check_single_arg_fun(modify_data)
  check_single_arg_fun(modify_new_data)
  check_vector(new_expr, "", min_length = 0, max_length = 1)
  check_scalar(niters, c(10^3, 10^6))
  if (!niters %in% 10^(3:6)) error("niters must be 10^2, 10^3, 10^4, 10^5 or 10^6")
  check_drops(drops)

  check_all_elements_class_character(random_effects)
  check_x_in_y(unlist(random_effects), names(select_data),
               x_name = "random_effects", y_name = "select_data",
               type_x = "elements", type_y = "names")
  check_x_not_in_y(names(random_effects), names(select_data),
               x_name = "random_effects", y_name = "select_data",
               type_x = "names", type_y = "names")
  check_x_not_in_y(derived, names(select_data),
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

  check_x_in_y(center, names(select_data), y_name = "select_data", type_y = "names")
  check_x_in_y(scale, names(select_data), y_name = "select_data", type_y = "names")

  if (!all(names(random_effects) %in% parameters(x, "random")))
    error("random effects parameters missing from code parameters")
  if (!all(derived %in% parameters(x, "derived")))
    error("derived parameters missing from code parameters")
  if (!all(unlist(drops) %in% parameters(x, "fixed")))
    error("drops parameters missing from code parameters")

  center %<>% sort()
  scale %<>% sort()
  random_effects %<>% sort_nlist()

  obj <- list(code = x,
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
              niters = niters)
  class(obj) <- class(x) %>% str_replace("code", "model")
  obj
}

#' @export
model.mb_analysis <- function(x, ...) {
  x$model
}
