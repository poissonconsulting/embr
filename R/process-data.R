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

#' Process Data
#'
#' Processes a data frame by selecting, centering and scaling data
#'
#' @param data The data to modify.
#' @param data2 The base data.
#' @param model An object inheriting from class tmb_model.
#' @return The modified data in list form.
#' @export
process_data <- function(data, data2, model) {
  check_mb_model(model)
  data %<>% select_data(model$select_data, model$center, model$scale, model$random_effects)
  data %<>% rescale::rescale(data2 = data2, center = model$center, scale = model$scale)
  data %<>% as.list()
  data %<>% add_nfactors()
  data
}
