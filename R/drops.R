eliminate <- function(x, y) {
  x[!x %in% y]
}

not_last <- function(x) {
  if (!length(x)) return(x)
  x[-length(x)]
}

eliminate_drop <- function(drops, drop) {
  check_drops(drops)
  check_vector(drop, "", min_length = 0)
  drops %<>% lapply(eliminate, drop)
  drops <- drops[vapply(drops, length, 1L) > 0]
  drops
}

possible_drop <- function(drops) {
  if (!length(drops)) return(character(0))
  drops %<>% lapply(dplyr::last) %>% unlist() %>% unique() %>% sort()
  drops
}

impossible_drop <- function(drops) {
  if (!length(drops)) return(character(0))
  drops %<>% lapply(not_last) %>% unlist() %>% unique() %>% sort()
  drops
}

recursive_drop <- function(drops, drop) {
  list <- list(drop)
  drop2 <- eliminate_drop(drops, drop) %>% possible_drop()
  for (d2 in drop2) {
    d2 <- c(drop, d2)
    list %<>% c(recursive_drop(drops, d2))
  }
  list
}

make_all_drops <- function(drops) {
  check_drops(drops)
  if (!length(drops)) return(list("-" = character(0)))
  drop <- recursive_drop(drops, character(0))
  drop %<>% lapply(sort) %>% unique()
  drop <- drop[order(vapply(drop, length, 1L))]
  names(drop) <- model_names(drop)
  drop
}

next_drop <- function(analysis, drops, conf_level) {
  check_mb_analysis(analysis)
  check_drops(drops)
  check_number(conf_level, c(0.5, 0.99))

  drop <- possible_drop(drops)

  if (!length(drop)) return(character(0))

  coef <- coef(analysis, scalar_only = TRUE, conf_level = conf_level)

  if (!all(drop %in% coef$term)) error("unrecognised fixed scalar parameter")

  if (any(is.na(coef$p.value))) error("undefined p-values")

  coef %<>% dplyr::filter_(~p.value > (1 - conf_level))
  if (!nrow(coef)) return(character(0))

  coef %<>% dplyr::filter_(~term %in% drop)
  if (!nrow(coef)) return(character(0))

  coef %<>% dplyr::arrange_(~dplyr::desc(p.value))
  coef$term[1]
}
