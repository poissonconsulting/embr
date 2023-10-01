#' @export
print.mb_code <- function(x, ...) {
  template <- template(x)
  if (is.language(template)) {
    print(template)
  } else {
    cat(template)
  }
}
