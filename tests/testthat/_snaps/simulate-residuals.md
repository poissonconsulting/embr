# edit_residuals_code

    Code
      edit_residuals_code(rlang::expr(residual <- res_bern(x)))
    Output
      residual <- res_bern(x)

---

    Code
      edit_residuals_code(rlang::expr(residual <- res_bern(x)), type = "dev")
    Output
      residual <- res_bern(x, type = "dev")

---

    Code
      edit_residuals_code(rlang::expr(residual[i] <- res_bern(x)), simulate = TRUE)
    Output
      residual[i] <- res_bern(x, simulate = TRUE)

---

    Code
      edit_residuals_code(rlang::expr(residual[i] <- res_bern(x)), type = "data",
      simulate = TRUE)
    Output
      residual[i] <- res_bern(x, type = "data", simulate = TRUE)

---

    Code
      edit_residuals_code(rlang::expr({
        foo <- bar
        residual <- res_bern(x)
      }), type = "data", simulate = TRUE)
    Output
      {
          foo <- bar
          residual <- res_bern(x, type = "data", simulate = TRUE)
      }

---

    Code
      edit_residuals_code("boo[i] <- res_bern(x)")
    Error <rlang_error>
      `new_expr` must include `residual <- res_xxx(` or `residual[i] <- res_xxx(`.

