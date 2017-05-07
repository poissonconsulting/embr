#' Plot Data
#'
#' @param x The object to plot the data for.
#' @param ... Unused.
#' @export
plot_data <- function(x, ...) {
  UseMethod("plot_data")
}

ggplot_data <- function(x, y, x_name, y_name) {
  data <- dplyr::data_frame(x, y)
  data %<>% dplyr::filter(!is.na(x), !is.na(y))

  if (length(unique(data$x)) <= 1) return(invisible(NULL))

  width <- if(is.numeric(x)) 0 else 0.2
  height <- if(is.numeric(y)) 0 else 0.2

  gp <- ggplot2::ggplot(data = data) +
    ggplot2::aes_string(x = "x", y = "y") +
    ggplot2::xlab(x_name) +
    ggplot2::ylab(y_name) +
    ggplot2::geom_jitter(alpha = 1/3, width = width, height = height)

  gp
}

#' @export
plot_data.default <- function(x, y, x_name, y_name, ...) {
  ggplot_data(x, y, x_name, y_name)
}

#' @export
plot_data.factor <- function(x, y, x_name, y_name, ...) {
  ggplot_data(x, y, x_name, y_name) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust = 1))
}

#' @export
plot_data.data.frame <- function(x, ...) {
  x %<>% dplyr::select(order(names(.))) %>%
    purrr::discard(is.character) %>%
    purrr::keep(is_multiple_values)

  if(!ncol(x)) return(invisible(NULL))

  plots <- list()
  for (x_name in names(x)) {
    for (y_name in names(x)) {
      if (!identical(x_name, y_name)) {
        plot <- plot_data(x = x[[x_name]], y = x[[y_name]],
                               x_name = x_name, y_name = y_name) %>%
          list() %>%
          stats::setNames(paste(x_name, y_name))
        plots %<>% c(plot)
      }
    }
  }
  plots %<>% purrr::discard(is.null)
  plots
}

#' @export
plot_data.mb_analysis <- function(x, ...) {
  plot_data(data_set(x))
}
