days_since_2000 <- function(x) {
  as.integer(x) - as.integer(as.Date("1999-12-31"))
}

numericize_dates <- function(data) {
  check_uniquely_named_list(data)
  if (!length(data)) return(data)
  data[vapply(data, lubridate::is.Date, TRUE)] %<>% lapply(days_since_2000)
  data
}
