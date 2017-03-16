days_since_2000 <- function(x) {
  as.integer(x) - as.integer(as.Date("1999-12-31"))
}

numericize_dates <- function(data) {
  if (!is.list(data)) error("data must be a list")
  if (!length(data)) return(data)
  data[vapply(data, lubridate::is.Date, TRUE)] %<>% llply(days_since_2000)
  data
}

numericize_logicals <- function(data) {
  if (!is.list(data)) error("data must be a list")
  if (!length(data)) return(data)
  data[vapply(data, is.logical, TRUE)] %<>% llply(as.integer)
  data
}

#' Numericize Factors
#'
#' @param data A list.
#' @return The list with factors converted to integers.
#' @export
numericize_factors <- function(data) {
  if (!is.list(data)) error("data must be a list")
  if (!length(data)) return(data)
  data[vapply(data, is.factor, TRUE)] %<>% llply(as.integer)
  data
}

