#' Data Set
#'
#' Gets the data set for an object inheriting from class mb_analysis.
#'
#' @param x The object.
#' @param modify A flag indicating whether to modify the data.
#' @param numericize_factors A flag indicating whether to convert factors to integers if modifying the data.
#' @param marginalize_random_effects A flag indicating whether to set each factor in one or more random effects at its first level.
#' @param ... Unused.
#' @return The data set as a tibble.
#' @export
data_set <- function(x, modify = FALSE, numericize_factors = FALSE,
                     marginalize_random_effects = FALSE, ...) {
  UseMethod("data_set")
}

#' @export
data_set.mb_analysis <- function(x, modify = FALSE, numericize_factors = FALSE,
                                 marginalize_random_effects = FALSE, ...) {
  chk_flag(modify)
  chk_flag(numericize_factors)
  chk_flag(marginalize_random_effects)

  data <- x$data

  if (marginalize_random_effects) {
    for (random_effect in random_effects(x)) {
      for (factor in random_effect) {
        data[[factor]] <- all_first_level(data[[factor]])
      }
    }
  }

  if (modify) {
    data <- modify_data(data, model(x), numericize_factors = numericize_factors)
  } else {
    data <- tibble::as_tibble(data)
  }
  data
}

#' @export
data_set.mb_analyses <- function(x, modify = FALSE, numericize_factors = FALSE,
                                 marginalize_random_effects = FALSE, ...) {
  data_set(x[[1]],
    modify = modify, numericize_factors = numericize_factors,
    marginalize_random_effects = marginalize_random_effects
  )
}

#' @export
data_set.mb_meta_analysis <- function(x, modify = FALSE, numericize_factors = FALSE,
                                      marginalize_random_effects = FALSE, ...) {
  lapply(x, data_set,
    modify = modify, numericize_factors = numericize_factors,
    marginalize_random_effects = marginalize_random_effects
  )
}

#' @export
data_set.mb_meta_analyses <- function(x, modify = FALSE, numericize_factors = FALSE,
                                      marginalize_random_effects = FALSE, ...) {
  lapply(x, data_set,
    modify = modify, numericize_factors = numericize_factors,
    marginalize_random_effects = marginalize_random_effects
  )
}
