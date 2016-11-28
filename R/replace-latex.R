#' Replace LaTeX
#'
#' Replaces terms with the values in latex.
#'
#' Any indices are replaced with the corresponding latex codes for subscripted indices
#' ie b[1,3] is replaced by b_{1,3}.
#'
#' @param term A character vector of the terms.
#' @param latex A named character vector specifying the latex math code for the terms in coef.
#' @return A character vector of the corresponding latex code.
#' @export
#' @examples
#' term <- c("a", "b", paste0("c", c("[1,1]", "[2,1,44]")))
#' replace_latex(term, c(a = "\\alpha", b = "\\beta_{\\lambda}", c = "\\beta Y"))
replace_latex <- function(term, latex) {
  check_vector(term, "", min_length = 1)
  check_vector(latex, "", min_length = 1)

  check_unique(term)
  check_uniquely_named_character_vector(latex)

  indexes <- indexes(term)
  indexes %<>% str_replace("\\[", "_{") %>% str_replace("\\]", "}")
  term %<>% str_replace("^(\\w+)(\\[.*)", "\\1")
  bol <- term %in% names(latex)
  if (!all(bol)) warning("terms missing from latex parameters")
  term[bol] <- latex[term[bol]]
  term[bol] %<>% str_c(indexes[bol])
  term[bol] %<>% str_c("$", ., "$")
  term
}
