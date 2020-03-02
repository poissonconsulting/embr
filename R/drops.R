full_drop <- function(drops) {
  check_drops(drops)
  if (!length(drops)) return(character(0))
  drops <- unlist(drops)
  drops <- unique(drops)
  drops <- sort(drops)
  drops
}

eliminate <- function(x, y) {
  x[!x %in% y]
}

not_last <- function(x) {
  if (!length(x)) return(x)
  x[-length(x)]
}

eliminate_drop <- function(drops, drop) {
  check_drops(drops)
  chk_s3_class(drop, "character")
  drops <- llply(drops, eliminate, drop)
  drops <- drops[vapply(drops, length, 1L) > 0]
  drops
}

possible_drop <- function(drops) {
  if (!length(drops)) return(character(0))
  drops <- llply(drops, dplyr::last)
  drops <- unlist(drops)
  drops <- unique(drops)
  drops <- sort(drops)
  drops
}

impossible_drop <- function(drops) {
  if (!length(drops)) return(character(0))
  drops <- llply(drops, not_last)
  drops <- unlist(drops)
  drops <- unique(drops)
  drops <- sort(drops)
  drops
}

recursive_drop <- function(drops, drop) {
  list <- list(drop)
  drop2 <- eliminate_drop(drops, drop)
  drop2 <- possible_drop(drop2)
  for (d2 in drop2) {
    d2 <- c(drop, d2)
    list <- c(list, recursive_drop(drops, d2))
  }
  list
}

make_all_drops <- function(drops) {
  check_drops(drops)
  if (!length(drops)) return(list("base" = character(0)))
  drop <- recursive_drop(drops, character(0))
  drop <- llply(drop, sort)
  drop <- unique(drop)
  drop <- drop[order(vapply(drop, length, 1L))]
  names(drop) <- model_names(drop, drops)
  drop
}

next_drop <- function(analysis, drops, conf_level) {
  check_mb_analysis(analysis)
  check_drops(drops)
  chk_number(conf_level)
  chk_range(conf_level, c(0.5, 0.99))

  drop <- possible_drop(drops)

  if (!length(drop)) return(character(0))

  coef <- coef(analysis)
  # scalar only
  coef <- dplyr::filter_(coef, ~!str_detect(term, "\\["))

  if (!all(drop %in% coef$term)) err("unrecognised fixed scalar parameter")

  if (any(is.na(coef$pvalue))) err("undefined pvalues")

  coef <- dplyr::filter_(coef, ~pvalue > (1 - conf_level))
  if (!nrow(coef)) return(character(0))

  coef <- dplyr::filter_(coef, ~term %in% drop)
  if (!nrow(coef)) return(character(0))

  coef <- dplyr::arrange_(coef, ~dplyr::desc(pvalue))
  coef$term[1]
}
