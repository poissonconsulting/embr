# predict string expression

    Code
      new_expr(analysis)
    Output
      for (i in 1:length(Density)) {
          fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + 
              bSiteYear[Site[i], YearFactor[i]]
          log(prediction[i]) <- fit[i]
          residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      }

# predict bare expression

    Code
      new_expr(analysis)
    Output
      for (i in 1:length(Density)) {
          fit[i] <- bIntercept + bYear * Year[i] + bHabitatQuality[HabitatQuality[i]] + 
              bSiteYear[Site[i], YearFactor[i]]
          log(prediction[i]) <- fit[i]
          residual[i] <- res_lnorm(Density[i], fit[i], exp(log_sDensity))
      }

