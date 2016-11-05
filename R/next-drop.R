next_drop <- function(analysis, drop, conf_level) {
  check_mb_analysis(analysis)
  check_vector(drop, "", min_length = 0)
  check_number(conf_level, c(0.5, 0.99))

  if (!length(drop)) return(character(0))

  coef <- coef(analysis, scalar = TRUE, conf_level = conf_level)

  if (!all(drop %in% coef$term)) error("unrecognised fixed scalar parameter")

  if (any(is.na(coef$p.value))) error("undefined p-values")

  coef %<>% dplyr::filter_(~p.value > (1 - conf_level))
  if (!nrow(coef)) return(character(0))

  coef %<>% dplyr::filter_(~term %in% drop)
  if (!nrow(coef)) return(character(0))

  coef %<>% dplyr::arrange_(~dplyr::desc(p.value))
  coef$term[1]
}
