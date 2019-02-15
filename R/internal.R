tibble <- function(...) {
  data <- data.frame(..., stringsAsFactors = FALSE)
  class(data) <- c("tbl_df", "tbl", "data.frame")
  data
}

as_tibble <- function(x) {
  class(data) <- c("tbl_df", "tbl", "data.frame")
  data
}
