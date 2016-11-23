add_nfactors <- function(data) {
  factor <- data[vapply(data, is.factor, TRUE)]

  if (!length(factor)) return(data)

  factor %<>% lapply(nlevels)
  names(factor) %<>% str_c("n", .)

  if (any(names(factor) %in% names(data)))
    error("nFactor names are reserved")

  data %<>% c(factor)
  data
}

select_data <- function(data, select_data, center, scale, random_effects) {
  if (!length(select_data)) {
    cols <- c(center, scale)
    cols %<>% c(unlist(random_effects))
    check_cols(data, sort(unique(cols)))
    return(data)
  }

  check_data2(data, select_data)
  data <- data[names(select_data)]
  data
}

#' Modify Data
#'
#' Modifies a data frame to the form it will be passed to the analysis code.
#'
#' @param data The data to modify.
#' @param model An object inheriting from class mb_model.
#' @return The modified data in list form.
#' @export
modify_data <- function(data, model) {
  check_data1(data)
  check_mb_model(model)
  data %<>% select_data(model$select_data, model$center, model$scale, model$random_effects)
  data %<>% rescale::rescale(data2 = data, center = model$center, scale = model$scale)
  data %<>% as.list()
  data %<>% numericize_logicals()
  data %<>% numericize_dates()
  data %<>% add_nfactors()
  data %<>% model$modify_data()
  data
}


#' Modify New Data
#'
#' Modifies a data frame to the form it will be passed to the analysis code.
#'
#' @param data The new data to modify.
#' @param data2 The base data.
#' @param model An object inheriting from class mb_model.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @return The modified data in list form.
#' @export
modify_new_data <- function(data, data2, model, modify_new_data = NULL) {
  check_data1(data)
  check_data1(data2)
  check_mb_model(model)

  if (is.null(modify_new_data)) modify_new_data <- model$modify_new_data
    check_single_arg_fun(modify_new_data)

  data %<>% select_data(model$select_data, model$center, model$scale, model$random_effects)
  data %<>% rescale::rescale(data2 = data2, center = model$center, scale = model$scale)
  data %<>% as.list()
  data %<>% numericize_logicals()
  data %<>% numericize_dates()
  data %<>% add_nfactors()
  data %<>% modify_new_data()
  data
}
