# Getting Set Up With R

## Install RStudio

RStudio can be [downloaded from the RStudio website](https://www.rstudio.com/products/rstudio/). Click through the installer after downloading.

## Install third-party packages

Copy/paste this code block into an empty file in RStudio. Highlight the lines and press `CTRL + Enter`. This is a one-time installation.

```R
packages_to_install <- c("plyr", "here", "sf","summarytools", "survey", "srvyr", "sjmisc", "maptools", "ggplot", 
"tidycensus", "tidyverse", "tigris", "dplyr", "descr", "sp", "rgdal", "raster")
install.packages(packages_to_install)
```

## Load packages

Every time you want to use one of these libraries in a R script, you'll need to load them into memory first. The syntax is `library(library_name)`. For example, the following code block loads the `here`, `plyr` and `sf` packages:

```R
library(here);
library(plyr);
library(sf);
```

## Configure the working directory

The following command will show your working directory:

```R
wd <- getwd()
```

Make sure this is a place you have write-access to. This can be changed by going through Session -> Set Working Directory -> Choose Directory (`ctrl+shift+h`)
