test_that("plot_data", {
  data <- data.frame(x = 1:10, y = rep(2, 10), y2 = c(1,4,6,7,9,11,2,2,1,5),
                     str = paste0("txt", 1:10), factor = factor(10:1),
                     stringsAsFactors = FALSE)

  expect_warning(
  x <- plot_data(data))

  expect_identical(length(x), 6L)
  expect_true(all(vapply(x, inherits, TRUE, what = "ggplot")))
})
