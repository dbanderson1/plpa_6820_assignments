# About

This is a script to plot sampling locations on the map for this study

- **input:** NCST_SeedTreatmentTrials_FinalData_2025-02-28.rds
- **output:** Figures 1 and Table 1

It was originally developed by Zachary Noel, Auburn University

# Global Setup

``` r
# Libraries needed
library(tidyverse)
# install.packages("usmap")
library(usmap)
# install.packages("maps")
library(maps)
# install.packages("mapdata")
library(mapdata)
# set the default global option for displaying code chunks
knitr::opts_chunk$set(echo = TRUE)
# this sets the root file project to the main R project directory not location of current Rmd file
knitr::opts_knit$set(root.dir = rprojroot::find_rstudio_root_file())
setwd(rprojroot::find_rstudio_root_file())
```

# RENV - Environment Control

The renv package helps you create reproducible environments for your R
projects. This vignette introduces you to the basic nouns and verbs of
renv, like the user and project libraries, and key functions like
renv::init(), renv::snapshot() and renv::restore(). You’ll also learn
about some of the infrastructure that makes renv tick, some problems
that renv doesn’t help with, and how to uninstall it if you no longer
want to use it.

RENV allows you store packages in the environment in a ‘lockfile’, which
enables you users to restore packages using the ‘lockfile’.

<figure>
<img src="renv.png" alt="RENV Figure Schematic" />
<figcaption aria-hidden="true">RENV Figure Schematic</figcaption>
</figure>

## Install RENV

``` r
# install.packages("renv")
library(renv)
```

    ## Warning: package 'renv' was built under R version 4.5.3

    ## 
    ## Attaching package: 'renv'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     modify

    ## The following objects are masked from 'package:stats':
    ## 
    ##     embed, update

    ## The following objects are masked from 'package:utils':
    ## 
    ##     history, upgrade

    ## The following objects are masked from 'package:base':
    ## 
    ##     autoload, load, remove, use

## RENV Initialize

``` r
# this will initialize the environment
renv::init()
```

## Updating packages

``` r
# this will update and should be used after publications
renv::update()
# this will upgrade RENV but not underlying packages
renv::upgrade()
# snapshot updates the lockfile
renv::snapshot() 
```

## Uninstall RENV

To deactivate renv in a project, use:

``` r
renv::deactivate()
# This removes the renv auto-loader from the project .Rprofile, but doesn’t touch any other renv files used in the project.
#If you’d like to later re-activate renv, you can do so with
renv::activate()
```

## Using RENV - Collaboration

``` r
renv::restore() 
#this installs the specific package versions recorded in the lockfile.
```

# Notes on Difficult Portions

## Subsetting

``` r
mtcars
```

    ##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    ## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    ## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    ## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    ## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    ## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
#subsetting
mtcars[1,] # 1st row
```

    ##           mpg cyl disp  hp drat   wt  qsec vs am gear carb
    ## Mazda RX4  21   6  160 110  3.9 2.62 16.46  0  1    4    4

``` r
mtcars[1,3] # row 1, column 3
```

    ## [1] 160

``` r
# find all rows such that VS = 1 : 2 ways
mtcars[mtcars$vs == 1,]
```

    ##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
subset(mtcars, vs == 1)
```

    ##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
# just the hp
mtcars$hp[mtcars$vs == 1]
```

    ##  [1]  93 110 105  62  95 123 123  66  52  65  97  66 113 109

``` r
# multiple
mtcars[mtcars$vs == 1 & mtcars$gear == 4,]
```

    ##                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
# car with most hp
max(mtcars$hp)
```

    ## [1] 335

``` r
#max or min value
mtcars[mtcars$hp == max(mtcars$hp),]
```

    ##               mpg cyl disp  hp drat   wt qsec vs am gear carb
    ## Maserati Bora  15   8  301 335 3.54 3.57 14.6  0  1    5    8

``` r
mtcars[mtcars$hp == min(mtcars$hp),]
```

    ##              mpg cyl disp hp drat    wt  qsec vs am gear carb
    ## Honda Civic 30.4   4 75.7 52 4.93 1.615 18.52  1  1    4    2

# Optional Learning Bonus Material

## Provided Bonus Material

``` r
### Color palletts etc. ###
cbbPalette <- c("black", "#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00")
options(dplyr.print_max = 1e9)

#### Read in the data needed, which is the output of the preprocessing script

seedtreatment.prediction.nona <- readRDS("NCST_SeedTreatmentTrials_FinalData_2025-02-28.rds")

##### Map of sampling: Figure 1. ####
# Load in acrage planted map
counties <- map_data("county")
counties$State <- toupper(counties$region)
counties$County <- toupper(counties$subregion)

cotton.acres.harvested.county <- read.csv("1C1BDA3A-B866-36C2-B2AD-0FD203944B03.csv") # data downloaded from NASS
str(cotton.acres.harvested.county)
cotton.acres.harvested.bycounty <- cotton.acres.harvested.county %>%
  group_by(State, County) %>%
  summarise(mean.acres.harvested = mean(Value))

state.data <- map_data("state")
state.data$State <- toupper(state.data$region)

state.data2 <- state.data %>%
  subset(State %in% c("ALABAMA",
                      "FLORIDA",
                      "TEXAS", 
                      "ARKANSAS",
                      "MISSISSIPPI",
                      "SOUTH CAROLINA",
                      "NORTH CAROLINA",
                      "VIRGINIA",
                      "LOUISIANA",
                      "TENNESSEE",
                      "GEORGIA",
                      "OKLAHOMA"))

cotton.acres.harvested.bycounty2 <- left_join(counties, cotton.acres.harvested.bycounty, by = c("State", "County"))
cotton.acres.harvested.bycounty.plot <- cotton.acres.harvested.bycounty2 %>%
  subset(State %in% c("ALABAMA",
                      "FLORIDA",
                      "TEXAS", 
                      "ARKANSAS",
                      "MISSISSIPPI",
                      "SOUTH CAROLINA",
                      "NORTH CAROLINA",
                      "VIRGINIA",
                      "LOUISIANA",
                      "TENNESSEE",
                      "GEORGIA",
                      "OKLAHOMA")) 

# convert to hectares
cotton.acres.harvested.bycounty.plot$Hectares <- cotton.acres.harvested.bycounty.plot$mean.acres.harvested*0.404686
map.points <- seedtreatment.prediction.nona %>%
  group_by(Long, Lat) %>%
  tally()

##### Figure 1 ####
Fig1 <- ggplot() + 
  geom_polygon(data = cotton.acres.harvested.bycounty.plot, mapping=aes(x=long, y=lat, group=group, fill = Hectares), color = "grey", size = 0.05) + 
  geom_polygon(data = state.data2, mapping = aes(x = long, y = lat, group = group), color = "black", fill = NA) +
  scale_fill_gradient(high = "#4F7942", low = "#ECFFDC", na.value = "white", name = "Ave. Hectares \n Upland Cotton \n Harvested 1993-2023") +
  geom_point(data = map.points, aes(x = Long, y = Lat, size = n), fill = cbbPalette[[8]], color = "black", alpha = 0.6, shape = 21) +
  scale_size(name = "Years in \n National Cotton \n Seedtreatment Trials") +
  theme_minimal() +
  theme(legend.position="right") +
  coord_map("albers",  lat0 = 45.5, lat1 = 29.5) +
  xlab("Longitude") +
  ylab("Latitude")
Fig1

#### Summary statistics for percentage of land on average with these states. Justification for the samples. ####
cotton.acres.harvested.summary <- cotton.acres.harvested.county %>%
  group_by(State, Year) %>%
  summarise(sum.acres.harvested = sum(Value)) %>%
  group_by(State) %>%
  summarise(mean.acres.harvested = mean(sum.acres.harvested)) 

cotton.acres.harvested.summary$percent <- 100 *(cotton.acres.harvested.summary$mean.acres.harvested/sum(cotton.acres.harvested.summary$mean.acres.harvested))

cotton.acres.harvested.summary %>%
  subset(State %in% c("ALABAMA",
                      "FLORIDA",
                      "TEXAS", 
                      "ARKANSAS",
                      "MISSISSIPPI",
                      "VIRGINIA",
                      "LOUISIANA",
                      "TENNESSEE",
                      "GEORGIA",
                      "OKLAHOMA")) %>%
  summarise(sum.sampled = sum(percent)) 


#### General Summary Statistics: Table 1 ####

# Earliest and latest planting date to select weather data interval
date.moth.day <- format(seedtreatment.prediction.nona$Planted, format="%m-%d")
sort(date.moth.day)

# 10 site-years were planted in February or June. 
# 97.5% of the site-years planted in March to May
(dim(seedtreatment.prediction.nona)[[1]] - 10)/dim(seedtreatment.prediction.nona)[[1]] 

# Number of trials per state
trials.per.state <- seedtreatment.prediction.nona %>%
  group_by(State) %>%
  summarise(min.trial.date = min(Year2),
            max.trial.date = max(Year2),
            n.trials = n())

# Unique locations per state
unique.per.state <- seedtreatment.prediction.nona %>%
  group_by(State, Field_Location_Code, Lat, Long) %>%
  summarise(n.trials = n(),
            min.trial.date = min(Year2),
            max.trial.date = max(Year2)) %>%
  mutate(n_years = max.trial.date - min.trial.date) %>%
  group_by(State) %>%
  tally()

table.1 <- left_join(trials.per.state, unique.per.state)

sum(table.1$n.trials) # 405 trials
sum(table.1$n) # 38 unique locations

# Locations table
loc.table <- seedtreatment.prediction.nona %>%
  group_by(State, Field_Location_Code, Lat, Long) %>%
  summarise(n.trials = n(),
            min.trial.date = min(Year2),
            max.trial.date = max(Year2))
```

## Self Learning Bonus Material -lme()
