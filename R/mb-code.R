#' MB Code
#'
#' Identifies the type of the code and creates an object of the appropriate class.
#'
#' @param template A string, a braced `{}` expression (unquoted or quoted),
#'   or an object of class `"mb_code"`.
#' @param stan_engine A string indicating the Stan engine to use, e.g., `"cmdstanr"`.
#' Currently, any value other than `"cmdstanr"` will assume the engine is `"rstan"`.
#'
#' @return An object inheriting from class mb_code.
#' @export
#' @examples
#' x <- mb_code(
#'   "#include <TMB.hpp>
#'
#' template<class Type>
#'
#' Type objective_function<Type>::operator() () {
#' DATA_VECTOR(Count);
#' PARAMETER(bIntercept);
#'
#' int n = Count.size();
#'
#' Type nll = 0.0;
#' for(int i = 0; i < n; i++){
#'   nll -= dpois(Count(i), bIntercept, true);
#' }
#' return nll;
#' }
#' "
#' )
#' class(x)
mb_code <- function(template, stan_engine = character(0)) {
  template_expr <- quo_get_expr(enquo(template))

  if (is.call(template_expr) && template_expr[[1]] == "{") {
    template <- template_expr
    check_pmbr(template)
    class <- "pmb_code"
  } else if (is.call(template) && template[[1]] == "{") {
    check_pmbr(template)
    class <- "pmb_code"
  } else if (is.mb_code(template)) {
    return(template)
  } else if (grepl("#include <TMB.hpp>", template)) {
    class <- "tmb_code"
  } else if (grepl("parameters\\s*[{]", template) && identical(stan_engine, "cmdstanr")) {
    class <- c("smb2_code", "smb_code")
  } else if (grepl("parameters\\s*[{]", template)) {
    class <- "smb_code"
  } else if (grepl("model\\s*[{]", template)) {
    class <- "jmb_code"
  } else if (grepl("^\\s*function\\s*[(]\\s*[)]", template)) {
    class <- "lmb_code"
  } else {
    wrn("template type is unrecognised", tidy = FALSE)
    class <- NULL
  }

  new_mb_code(template, class)
}

#' @rdname mb_code
#' @param x A string or a braced `{}` expression.
#' @param class The class of the new object.
#' @export
new_mb_code <- function(x, class) {
  chk_true(vld_string(x) || is.language(x))
  class <- c(setdiff(class, "mb_code"), "mb_code")
  structure(list(template = x), class = class)
}
