add_nfactors <- function(data) {
  factor <- data[vapply(data, is.factor, TRUE)]

  if (!length(factor)) return(data)

  factor <- llply(factor, nlevels)
  names(factor) <- str_c("n", names(factor))

  if (any(names(factor) %in% names(data)))
    err("nFactor names are reserved")

  data <- c(data, factor)
  data
}

select_data <- function(data, select_data, center, scale, random_effects) {
  if (!length(select_data)) {
    cols <- c(center, scale)
    cols <- c(cols, unlist(random_effects))
    check_colnames(data, sort(unique(cols)))
    return(data)
  }

  names(select_data) <- rescale::get_rescaler_colnames(names(select_data))
  checkr::check_data(data, select_data)
  data <- data[names(select_data)]
  data
}

#' Select and Rescale Data
#'
#' Selects and rescales data.
#'
#' @param data The data to modify.
#' @param data2 The base data.
#' @param model An object inheriting from class mb_model.
#' @return The modified data in list form.
#' @export
select_rescale_data <- function(data, model, data2 = data) {
  chk_data(data)
  chk_not_empty(data)
  chk_data(data2)
  chk_not_empty(data2)
  check_mb_model(model)
  data <- select_data(data, model$select_data, model$center, model$scale, model$random_effects)
  data2 <- select_data(data2, model$select_data, model$center, model$scale, model$random_effects)

  if (!identical(model$center, character(0)) || !identical(model$scale, character(0)))  {
    data <- rescale::rescale(data, data2 = data2, center = model$center, scale = model$scale)
  } else if (length(model$select_data))
    data <- rescale::rescale_c(data, data2 = data2, colnames = names(model$select_data))
  data
}

#' Modify Data
#'
#' Modifies a data frame to the form it will be passed to the analysis code.
#'
#' @param data The data to modify.
#' @param model An object inheriting from class mb_model.
#' @param numericize_factors A flag indicating whether to convert factors to integer.
#' @return The modified data in list form.
#' @export
modify_data <- function(data, model, numericize_factors = FALSE) {
  chk_data(data)
  chk_not_empty(data)
  check_mb_model(model)
  chk_flag(numericize_factors)
  if (any(c("nObs", "Obs") %in% colnames(data)))
     err("Obs and nObs are reserved column names")

  nobs <- nrow(data)

  data <- select_rescale_data(data, model)
  data <- as.list(data)
  data <- numericize_logicals(data)
  data <- numericize_dates(data)
  data <- numericize_difftimes(data)
  data <- add_nfactors(data)
  if (numericize_factors) data <- numericize_factors(data)
  data$nObs <- nobs
  data <- model$modify_data(data)
  data
}


#' Modify New Data
#'
#' Modifies a data frame to the form it will be passed to the analysis code.
#'
#' @inheritParams modify_data
#' @param data2 The base data.
#' @param modify_new_data A single argument function to modify new data (in list form) immediately prior to calculating new_expr.
#' @return The modified data in list form.
#' @export
modify_new_data <- function(data, data2, model, modify_new_data = NULL, numericize_factors = FALSE) {
  chk_data(data)
  chk_not_empty(data)
  chk_data(data2)
  chk_not_empty(data2)
  check_mb_model(model)
  chk_flag(numericize_factors)

  if (is.null(modify_new_data)) modify_new_data <- model$modify_new_data
  check_single_arg_fun(modify_new_data)

  if (any(c("nObs", "Obs") %in% colnames(data)))
     err("Obs and nObs are reserved column names")

  nobs <- nrow(data)

  data <- select_rescale_data(data, model, data2 = data2)
  data <- as.list(data)
  data <- numericize_logicals(data)
  data <- numericize_dates(data)
  data <- numericize_difftimes(data)
  data <- add_nfactors(data)

  if (numericize_factors) data <- numericize_factors(data)
  data$nObs <- nobs
  data <- modify_new_data(data)
  data
}
