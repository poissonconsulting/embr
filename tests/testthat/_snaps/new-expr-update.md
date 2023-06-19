# update new expr string expression

    Code
      new_expr(analysis)
    Output
      {
          fit <- bIntercept + bYear * Year + bHabitatQuality[HabitatQuality] + 
              bSiteYear[cbind(Site, YearFactor)]
          log(prediction) <- fit
          residual <- res_lnorm(Density, fit, exp(log_sDensity))
      }

# update new expr bare expression

    Code
      new_expr(analysis)
    Output
      {
          fit <- bIntercept + bYear * Year + bHabitatQuality[HabitatQuality] + 
              bSiteYear[cbind(Site, YearFactor)]
          log(prediction) <- fit
          residual <- res_lnorm(Density, fit, exp(log_sDensity))
      }

# add new_expr_vec argument to update model

    Code
      new_expr(analysis)
    Output
      for (i in 1:length(Density)) {
          fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + 
              bSiteYear[Site[i], YearFactor[i]]
          log(prediction[i]) <- fit[i]
          residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      }

# add new_expr_vec argument to update model and updates original new_expr

    Code
      new_expr(analysis)
    Output
      {
          fit <- bIntercept + bYear * Year + bHabitatQuality[HabitatQuality] + 
              bSiteYear[cbind(Site, YearFactor)]
          log(prediction) <- fit
          residual <- res_lnorm(Density, fit, exp(log_sDensity))
      }

