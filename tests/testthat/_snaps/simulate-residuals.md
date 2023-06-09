# simulate_residuals

    Code
      edit_residuals_code("residual <- res_bern(x)")
    Output
      residual <- res_bern(x)

---

    Code
      edit_residuals_code("residual <- res_bern(x)", type = "dev")
    Output
      residual <- res_bern(type = "dev", x)

---

    Code
      edit_residuals_code("residual[i] <- res_bern(x)", simulate = TRUE)
    Output
      residual[i] <- res_bern(simulate = TRUE, x)

---

    Code
      edit_residuals_code("residual[i] <- res_bern(x)", type = "data", simulate = TRUE)
    Output
      residual[i] <- res_bern(type = "data", simulate = TRUE, x)

