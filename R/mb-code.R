#' MB Code
#'
#' Identifies the type of the code and creates an object of the appropriate class.
#'
#' @param template A string of the model template.
#'
#' @return An object inheriting from class mb_code.
#' @export
#' @examples
#' x <- mb_code(
#' "#include <TMB.hpp>
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
#'")
#' class(x)
mb_code <- function(template) {
  check_string(template)

  if (stringr::str_detect(template, "#include <TMB.hpp>")) {
    class <- c("tmb_code", "mb_code")
  } else if (stringr::str_detect(template, "model[{]")) {
    class <- c("jmb_code", "mb_code")
  } else error("template type is unrecognised")

  object <- list()
  object$template <- template
  class(object) <- class
  object
}
