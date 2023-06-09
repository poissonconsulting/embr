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

