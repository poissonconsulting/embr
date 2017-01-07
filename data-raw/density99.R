rm(list = ls())

library(magrittr)
library(dplyr)
library(devtools)

set.seed(99)

nsite <- 6
nyear <- 10
nvisit <- 5
start_year <- 2000

alpha <- 0
beta <- 1
habitat <- 10
log_sd_site_year <- 1
log_sd <- 0

site <- data.frame(Site = paste0("Site", 1:nsite),
                   HabitatQuality = c("Low", "High"))

site_year <- expand.grid(Site = site$Site, Year = 1:nyear + start_year)
site_year$site_year_effect <- rnorm(nrow(site_year), sd = exp(log_sd_site_year))

data <- expand.grid(Visit = 1:nvisit, Site = site$Site,
                    Year = 1:nyear + start_year)

data %<>% inner_join(site, by = "Site") %>% inner_join(site_year, by = c("Site", "Year"))

residual <- rnorm(nrow(data), sd = exp(log_sd))

data %<>% mutate(Density = exp(alpha + beta * (Year - mean(Year)) + (as.integer(HabitatQuality) - 1) * habitat + site_year_effect + residual))

data %<>% select(Site, HabitatQuality, Year, Visit, Density) %>% arrange(Site, Year, Visit)

density99 <- data
use_data(density99, overwrite = TRUE)
