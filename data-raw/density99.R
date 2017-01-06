rm(list = ls())

library(magrittr)
library(dplyr)
library(devtools)

set.seed(99)

nsite <- 6
nyear <- 10
start_year <- 2000

alpha <- 1
beta <- 0.5
sd_site <- 0.25
sd_site_year <- 0.125
sd <- 0.0625

site <- data.frame(Site = paste0("Site", 1:nsite))
site$site_effect <- rnorm(nrow(site), sd = sd_site)

site_year <- expand.grid(Site = paste0("Site", 1:nsite), Year = 1:nyear + start_year)
site_year$site_year_effect <- rnorm(nrow(site_year), sd = sd_site_year)

data <- expand.grid(Visit = 1:3, Site = paste0("Site", 1:nsite), Year = 1:nyear + start_year)
data %<>% inner_join(site, by = "Site") %>% inner_join(site_year, by = c("Site", "Year"))

data$noise <- rnorm(nrow(data), sd = sd)

data %<>% mutate(Density = exp(alpha + beta * (Year - start_year) + site_effect + site_year_effect + noise))

data %<>% select(Density, Site, Year, Visit) %>% arrange(Site, Year, Visit)

density99 <- data
use_data(density99, overwrite = TRUE)
