zero_random_effects <- function(mcmcr, data, random_effects) {
  stopifnot(all(names(random_effects) %in% pars(mcmcr)))
  stopifnot(all(unlist(random_effects) %in% names(data)))

  data %<>% llply(as.numeric)
  data <- data[unique(unlist(random_effects))]
  data <- data[vapply(data, all1, TRUE)]
  data <- names(data)

  random_effects %<>% vapply(function(x, y) any(x %in% y), TRUE, data)
  random_effects <- random_effects[random_effects]
  random_effects %<>% names()

  if (!length(random_effects))
    return(mcmcr)

  mcmcr %<>% purrr::map_at(random_effects, zero)
  class(mcmcr) <- "mcmcr"
  mcmcr
}
