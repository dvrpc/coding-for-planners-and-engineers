# Pusdo Code
Before you start any project in R it is best to lay out what you are doing first. 
Start by laying out all of the different pieces you need the code to do then start making them work.

# Dependencies
These are packages created by other users they contain functions that you will use in this exercise.
It is best to install them at the top.
If you haven't followed the installation instructions please do so. 
To install packages replace the library command with install ie. Install(dplyr)

```R
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
```

# Working Directory
This is where your files will be saved to. 
To change this go to Session -> Set Working Directory -> Choose Directory (ctrl + shift + h)
Also this is where you'd want to still your API key, we won't need this for this number of queries but its best practice
```R
getwd()

#remember to insert your api key here
census_api_key(" INSERT API KEY HERE ", overwrite = TRUE)
```

# General Info
Input some general info here at the top as variables so they are easy to change later.
```R
acs_year <- 2019
dec_year <-
  dvrpc_states <- c("PA", "NJ")
dvrpc_counties <-
  c(34005, 34007, 34015, 34021, 42017, 42029, 42045, 42091, 42101)
```

# Looking for Variables
There are a lot of varibles in the Census!
To find out which varibles to use first run this command.
```R
? load_variables
```
Notice the documentation for this function pop up in the bottom right corner.
Fill in the function below to get a list of varibles for the 2019 acs5 survey.
```R
acs_vari_check <- load_variables(2019, "  ", cache = TRUE)
view(acs_vari_check)
```
Awesome! Now add those variables below.
Make sure to use the same format as the 10 year variables.
```R
dec_vari <- c("P013001")
acs_vari <-
```
  
 # Grabbing Census data
 Lets try something just a little bit harder.
 ```R
  ?get_acs
  ```

Now that we know what to add to this function.
Add in the varibles above as well as the correct geometry.
```R  
tracts <- get_acs(
  geography = " ",
  variables = ,
  survey = "",
  year = ,
  state = ,
  geometry = TRUE
)
```

# Grabbing Block Level Data
Check out the get_decennial function 
```R
?get_decennial
```
Awesome now add in the arguments to the function below.
You have to do an independent one for each county.
Use the FIPS code info to help you.

```R
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
```
You should be able to write you own API calls now!
But check out the help feature if you get stuck
```R
c34015 <- get_decennial
c34021 <- get_decennial
c42017 <- get_decennial
c42029 <- get_decennial
c42045 <- get_decennial
c42091 <- get_decennial
c42101 <- get_decennial
```

# Binding the blocks together
R is really helpful for putting differnt pieces of data together.
Check out this rbind function.
```R
? rbind
```
We can use rbind to stack the census block data on top of each other
```R
finalBlocks <- rbind()
finalBlocks$GEOID <- as.numeric(finalBlocks$GEOID)
```

# Filtering the data
Check out the filter and substr functions
We can use those to filter the data to fit the DVRPC region
```R
?filter
?substr
```
Remember to use the arguments we created above!

```R
finalTracts <-
  filter(tracts, as.numeric(substr(
    tracts$GEOID, start = 1, stop = 5
  )) %in% )
finalTracts$GEOID <- as.numeric(finalTracts$GEOID)
```

# exporting your files
Another great way we can use R is to export our files into other formats.
Check out these 2 functions that are build to be compatible with census data.
```R
?st_write
?write.csv
```
Now that you see how to make a shp file write anotherone to output the Tracts data
```R
st_write(finalBlocks, "blockGrabberOut.shp", delete_layer = TRUE)
write.csv(finalBlocks, here("blockGrabberOut.csv"))
st_write(, "", delete_layer =)
```
# Visuaizing your data
Another super cool thing R can do is visulize your data
Check out the ggplot function
```R
?ggplot
```
Now enter the arguments to spit out own own map
It is displayed at the bottom right corner under plots
```R
ggplot(data =) +
  geom_sf(aes(fill =)) +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt")
```
