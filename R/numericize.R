days_since_2000 <- function(x) {
  as.integer(x) - as.integer(as.Date("1999-12-31"))
}

numericize_dates <- function(data) {
  if (!is.list(data)) err("data must be a list", tidy = FALSE)
  if (!length(data)) return(data)
  data[vapply(data, lubridate::is.Date, TRUE)] <- llply(data[vapply(data, lubridate::is.Date, TRUE)], days_since_2000)
  data
}

numericize_difftimes <- function(data) {
  if (!is.list(data)) err("data must be a list", tidy = FALSE)
  if (!length(data)) return(data)
  data[vapply(data, lubridate::is.difftime, TRUE)] <- llply(data[vapply(data, lubridate::is.difftime, TRUE)], as.numeric)
  data
}

numericize_logicals <- function(data) {
  if (!is.list(data)) err("data must be a list", tidy = FALSE)
  if (!length(data)) return(data)
  data[vapply(data, is.logical, TRUE)] <- llply(data[vapply(data, is.logical, TRUE)], as.integer)
  data
}

numericize_factors <- function(data) {
  if (!is.list(data)) err("data must be a list", tidy = FALSE)
  if (!length(data)) return(data)
  data[vapply(data, is.factor, TRUE)] <- llply(data[vapply(data, is.factor, TRUE)], as.integer)
  data
}

