#installing depdencies only install if you haven't already
install.packages(c("plyr", "here", "sf","summarytools", "survey", "srvyr", "sjmisc", "maptools", "ggplot", 
"tidycensus", "tidyverse", "tigris", "dplyr", "descr", "sp", "rgdal", "raster"
))

# Dependencies
library(plyr)
library(here)
library(sf)
library(summarytools)
library(survey)
library(srvyr)
library(sjmisc)
library(maptools)
library(ggplot)
library(tidycensus)
library(tidyverse)
library(tigris)
library(dplyr)
library(descr)
library(sp)
library(rgdal)
library(raster)

# Working Directory

getwd()

#remember to insert your api key here
census_api_key(" INSERT API KEY HERE ", overwrite = TRUE)


# General Info
acs_year <- 2019
dec_year <-
  dvrpc_states <- c("PA", "NJ")
dvrpc_counties <-
  c(34005, 34007, 34015, 34021, 42017, 42029, 42045, 42091, 42101)


# Looking for Variables

? load_variables

acs_vari_check <- load_variables(2019, "  ", cache = TRUE)
view(acs_vari_check)

dec_vari <- c("P013001")
acs_vari <-
  
  # Grabbing Census data
  ? get_acs

tracts <- get_acs(
  geography = " ",
  variables = ,
  survey = "",
  year = ,
  state = ,
  geometry = TRUE
)

# Grabbing Block Level Data
? get_decennial

c34005 <- get_decennial(
  geography = ,
  year = ,
  state = ,
  county = "005",
  variables = ,
  output = ,
  geometry = TRUE
)
c34007 <- get_decennial(
  geography = ,
  year = ,
  state = ,
  county = "007",
  variables = ,
  output = ,
  geometry = TRUE
)

c34015 <- get_decennial
c34021 <- get_decennial
c42017 <- get_decennial
c42029 <- get_decennial
c42045 <- get_decennial
c42091 <- get_decennial
c42101 <- get_decennial

# Binding the blocks together
? rbind

finalBlocks <- rbind()
finalBlocks$GEOID <- as.numeric(finalBlocks$GEOID)

# Filtering the data
? filter
? substr

finalTracts <-
  filter(tracts, as.numeric(substr(
    tracts$GEOID, start = 1, stop = 5
  )) %in% )
finalTracts$GEOID <- as.numeric(finalTracts$GEOID)

# exporting your files

? st_write
? write.csv

st_write(finalBlocks, "blockGrabberOut.shp", delete_layer = TRUE)
write.csv(finalBlocks, here("blockGrabberOut.csv"))
st_write( , "", delete_layer = )

# Visuaizing your data
? ggplot


ggplot(data = ) +
  geom_sf(aes(fill = )) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")
