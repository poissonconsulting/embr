translate_jmbr <- function(template) {
  chk_s3_class(template, "pmb_code")
  out <- paste0("model ", walk_translate_jmbr(template$template))
  mb_code(out)
}

r_ops <- c("+", "-", "*", "/", "^", "%%", "%/%", ">", "<", ">=", "<=", "==", "!=", "&", "|", "!", ":", "~", "=", "<-")
r_brackets <- c("(" = ")", "{" = "}", "[" = "]")

# ";"

walk_translate_jmbr <- function(expr) {
  switch(expr_type(expr),
    constant = ,
    symbol =
      as.character(expr),
    call = {
      if (as.character(expr[[1]]) %in% c("T", "I")) {
        t_fun <- expr[[1]]
        t_args <- as.list(expr)[-(1:2)]
        t_call <- call2(t_fun, !!!t_args)
        expr <- expr[[2]]
        out <- paste0(
          paste(walk_translate_jmbr(expr), collapse = "\n"),
          " ",
          paste(expr_deparse(t_call), collapse = "\n")
        )
      } else {
        if (length(expr) > 1) {
          args <- map_chr(expr[-1], walk_translate_jmbr)
          fun <- as.character(expr[[1]])

          if (as.character(expr[[1]]) %in% sd_dists) {
            args[[2]] <- paste0("(", args[[2]], ") ^ -2")
          }

          if (fun == "{") {
            paste0("{\n", paste(gsub("(^|\n)", "\\1  ", args), collapse = "\n"), "\n}")
          } else if (fun == "[") {
            paste0(args[[1]], "[", paste0(args[-1], collapse = ", "), "]")
          } else if (fun == "(") {
            paste0("(", paste0(args, collapse = ", "), ")")
          } else if (fun == "for") {
            paste0("for (", args[[1]], " in ", args[[2]], ") ", args[[3]])
            # } else if (fun == "if") {
            #   paste0("if (", args[[1]], ") {\n", paste0("  ", args[-1], collapse = "\n"), "\n}")
            # } else if (fun == "else") {
            #   paste0("else {\n", paste0("  ", args, collapse = "\n"), "\n}")
            # } else if (fun == "while") {
            #   paste0("while (", args[[1]], ") {\n", paste0("  ", args[-1], collapse = "\n"), "\n}")
            # } else if (fun == "repeat") {
            #   paste0("repeat {\n", paste0("  ", args, collapse = "\n"), "\n}")
            # } else if (fun == "break") {
            #   paste0("break")
            # } else if (fun == "next") {
            #   paste0("next")
            # } else if (fun == "return") {
            #   paste0("return(", paste0(args, collapse = ", "), ")")
          } else if (fun %in% r_ops) {
            if (length(args) >= 2) {
              paste0(args[[1]], " ", fun, " ", args[[2]])
            } else {
              # Unary
              paste0(fun, args[[1]])
            }
          } else {
            paste0(expr[[1]], "(", paste(args, collapse = ", "), ")")
          }
        } else {
          paste0(expr[[1]], "()")
        }
      }
    },
    default = {
      stop("Unknown expression type: ", expr_type(expr))
    }
  )
}
