```R
# Dependencies
library(plyr); library(here); library(sf); library(summarytools); library(survey); library(srvyr); library(sjmisc); library(maptools); library(ggplot)
library(tidycensus); library(tidyverse); library(tigris); library(dplyr); library(descr); library(sp); library(rgdal); library(raster)

#where you'll be saving stuff to
getwd()

#remember to insert your api key here
census_api_key("219399afeaa3b3c28f7b5351b56bb92d7d0f576d", overwrite = TRUE)

#general info
acs_year <- 2019
dec_year <- 2010
dvrpc_states <- c("PA", "NJ")
dvrpc_counties <-c(34005, 34007, 34015, 34021, 42017, 42029, 42045, 42091, 42101)

#census varibles
dec_vari <- c("P013001")
acs_vari <- c("C16001_005")

#grabbing tract level data
tracts <- get_acs(geography = "tract",
                  variables = acs_vari,
                  survey = "acs5",
                  year = 2019,
                  state = dvrpc_states,
                  geometry = TRUE)

#grabbing block level data
c34005<- get_decennial(geography = "block", year = dec_year, state = "NJ",
                       county = "005", variables = dec_vari, output = "wide", geometry = TRUE)
c34007<- get_decennial(geography = "block", year = dec_year, state = "NJ",
                       county = "007", variables = dec_vari, output = "wide", geometry = TRUE)
c34015<- get_decennial(geography = "block", year = dec_year, state = "NJ",
                       county = "015", variables = dec_vari, output = "wide", geometry = TRUE)
c34021<- get_decennial(geography = "block", year = dec_year, state = "NJ",
                       county = "021", variables = dec_vari, output = "wide", geometry = TRUE)
c42017<- get_decennial(geography = "block", year = dec_year, state = "PA",
                       county = "017", variables = dec_vari, output = "wide", geometry = TRUE)
c42029<- get_decennial(geography = "block", year = dec_year, state = "PA",
                       county = "029", variables = dec_vari, output = "wide", geometry = TRUE)
c42045<- get_decennial(geography = "block", year = dec_year, state = "PA",
                       county = "045", variables = dec_vari, output = "wide", geometry = TRUE)
c42091 <-get_decennial(geography = "block", year = dec_year, state = "PA",
                       county = "091", variables = dec_vari, output = "wide", geometry = TRUE)
c42101 <-get_decennial(geography = "block", year = dec_year, state = "PA",
                       county = "101", variables = dec_vari, output = "wide", geometry = TRUE)

#binding the blocks together
finalBlocks <- rbind(c34005, c34007, c34015, c34021,c42017,c42029, c42045, c42091, c42101)
finalBlocks$GEOID <- as.numeric(finalBlocks$GEOID)

#filtering the tracts
finalTracts <- filter(tracts, as.numeric(substr(tracts$GEOID, start = 1, stop = 5)) %in% dvrpc_counties)
finalTracts$GEOID <- as.numeric(finalTracts$GEOID)


#exporting your files
st_write(finalBlocks, "blockGrabberOut.shp", delete_layer = TRUE)
write.csv(finalBlocks, here("blockGrabberOut.csv"))
st_write(finalTracts, "finalTract.shp", delete_layer = TRUE)
write.csv(finalTracts, here("finalTract.csv"))

#visuaizing your data
ggplot(data = finalBlocks) +
  geom_sf(aes(fill = P013001)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")
```
