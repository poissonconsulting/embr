tibble <- function(...) {
  x <- data.frame(..., stringsAsFactors = FALSE)
  as_tibble(x)
}

as_tibble <- function(x) {
  row.names(x) <- NULL
  class(x) <- c("tbl_df", "tbl", "data.frame")
  x
}
