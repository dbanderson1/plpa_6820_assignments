# Global Setup

``` r
library(tidyverse)
library(ggplot2)
library(knitr)
library(markdown)
library(drc)
library(dplyr)
# set the default global option for displaying code chunks
knitr::opts_chunk$set(echo = TRUE)
# this sets the root file project to the main R project directory not location of current Rmd file
knitr::opts_knit$set(root.dir = rprojroot::find_rstudio_root_file())
```

# Question 1.

2 pts. Regarding reproducibility, what is the main point of writing your
own functions and iterations?

*Answer: The main point of writing your own functions and iterations is
to make analyses repeatable, consistent, and automated. Instead of
manually repeating the same code multiple times, a function allows you
to define a set of instructions once and apply it to different data
inputs. Iterations (such as for loops) allow the same operation to be
applied across multiple elements of a dataset. This reduces human error,
keeps workflows organized, and ensures that someone else can run the
same code and obtain the same results, which is a key principle of
reproducible science.*

# Question 2.

2 pts. In your own words, describe how to write a function and a for
loop in R and how they work. Give me specifics like syntax, where to
write code, and how the results are returned.

*Answer: A function in R is created using the function() keyword. It
allows you to define a reusable block of code that performs a specific
task. The basic syntax is:*

*The function name is assigned using \<-. Inside the parentheses you
define the inputs (arguments). The code inside the curly braces {}
contains the operations the function performs. The result is typically
returned using return(). Once the function is defined in a script or
console, it can be used by calling the function name and supplying input
values.*

``` r
my_function <- function(argument1, argument2) {
  result <- argument1 + argument2
  return(result)
}
#Example:
my_function(2, 3)
```

    ## [1] 5

*A for loop is used to repeat a set of instructions multiple times.*

*The loop variable (i) takes on each value in the sequence (1:5). For
every value, the code inside the curly braces {} is executed. For loops
are useful when applying the same operation across many items, such as
rows in a dataset or elements in a vector.*

*Both functions and loops are written inside R scripts or the console in
RStudio, and they help automate repetitive tasks so analyses are easier
to reproduce and modify. The syntax is:*

``` r
for (i in 1:5) {
  print(i)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5

# Question 3.

2 pts. Read in the Cities.csv file from Canvas using a relative file
path.

``` r
cities.df <- read.csv("data_files/Cities.csv")
```

# Question 4.

6 pts. Write a function to calculate the distance between two pairs of
coordinates based on the Haversine formula (see below). The input into
the function should be lat1, lon1, lat2, and lon2. The function should
return the object distance_km. All the code below needs to go into the
function.

``` r
distance_calc <- function(lat1, lon1, lat2, lon2){
# convert to radians
rad.lat1 <- lat1 * pi/180
rad.lon1 <- lon1 * pi/180
rad.lat2 <- lat2 * pi/180
rad.lon2 <- lon2 * pi/180

# Haversine formula
delta_lat <- rad.lat2 - rad.lat1
delta_lon <- rad.lon2 - rad.lon1
a <- sin(delta_lat / 2)^2 + cos(rad.lat1) * cos(rad.lat2) * sin(delta_lon / 2)^2
c <- 2 * asin(sqrt(a)) 

# Earth's radius in kilometers
earth_radius <- 6378137

# Calculate the distance
distance_km <- (earth_radius * c)/1000

# Return the distance
return(distance_km)
}
```

# Question 5.

5 pts. Using your function, compute the distance between Auburn, AL and
New York City

1.  Subset/filter the Cities.csv data to include only the latitude and
    longitude values you need and input as input to your function.
2.  The output of your function should be 1367.854 km

``` r
# filter and subset 
cities.sub <- cities.df %>%
  dplyr::filter(city %in% c("Auburn", "New York")) %>%
  dplyr::select(city, lat, long)
# pass to function
distance_calc(
  lat1 = cities.sub$lat[1],
  lon1 = cities.sub$long[1],
  lat2 = cities.sub$lat[2],
  lon2 = cities.sub$long[2]
)
```

    ## [1] 1367.854

# Question 6.

6 pts. Now, use your function within a for loop to calculate the
distance between all other cities in the data. The output of the first 9
iterations is shown below.

# Bonus point

Have the output of each iteration append a new row to a dataframe,
generating a new column of data. In other words, the loop should create
a dataframe with three columns called city1, city2, and distance_km, as
shown below. The first six rows of the dataframe are shown below.

``` r
# Get Auburn coordinates
auburn_lat <- cities.df$lat[cities.df$city == "Auburn"]
auburn_long <- cities.df$long[cities.df$city == "Auburn"]

# Create empty dataframe to store results
distance.df <- data.frame(
  City1 = character(),
  City2 = character(),
  Distance_km = numeric(),
  stringsAsFactors = FALSE
)

# Loop through all cities
for (i in 1:nrow(cities.df)) {
  
  dist <- distance_calc(
    lat1 = cities.df$lat[i],
    lon1 = cities.df$long[i],
    lat2 = auburn_lat,
    lon2 = auburn_long
  )
  
  distance.df <- rbind(
    distance.df,
    data.frame(
      City1 = cities.df$city[i],
      City2 = "Auburn",
      Distance_km = dist
    )
  )
}

# View first rows
distance.df
```

    ##            City1  City2 Distance_km
    ## 1       New York Auburn   1367.8540
    ## 2    Los Angeles Auburn   3051.8382
    ## 3        Chicago Auburn   1045.5213
    ## 4          Miami Auburn    916.4138
    ## 5        Houston Auburn    993.0298
    ## 6         Dallas Auburn   1056.0217
    ## 7   Philadelphia Auburn   1239.9732
    ## 8        Atlanta Auburn    162.5121
    ## 9     Washington Auburn   1036.9900
    ## 10        Boston Auburn   1665.6985
    ## 11       Phoenix Auburn   2476.2552
    ## 12       Detroit Auburn   1108.2288
    ## 13       Seattle Auburn   3507.9589
    ## 14 San Francisco Auburn   3388.3656
    ## 15     San Diego Auburn   2951.3816
    ## 16   Minneapolis Auburn   1530.2000
    ## 17         Tampa Auburn    591.1181
    ## 18      Brooklyn Auburn   1363.2072
    ## 19        Denver Auburn   1909.7897
    ## 20        Queens Auburn   1380.1382
    ## 21     Riverside Auburn   2961.1199
    ## 22     Las Vegas Auburn   2752.8142
    ## 23     Baltimore Auburn   1092.2595
    ## 24     St. Louis Auburn    796.7541
    ## 25      Portland Auburn   3479.5376
    ## 26   San Antonio Auburn   1290.5492
    ## 27    Sacramento Auburn   3301.9923
    ## 28        Austin Auburn   1191.6657
    ## 29       Orlando Auburn    608.2035
    ## 30      San Juan Auburn   2504.6312
    ## 31      San Jose Auburn   3337.2781
    ## 32  Indianapolis Auburn    800.1452
    ## 33    Pittsburgh Auburn   1001.0879
    ## 34    Cincinnati Auburn    732.5906
    ## 35     Manhattan Auburn   1371.1633
    ## 36   Kansas City Auburn   1091.8970
    ## 37     Cleveland Auburn   1043.2727
    ## 38      Columbus Auburn    851.3423
    ## 39         Bronx Auburn   1382.3721
    ## 40        Auburn Auburn      0.0000

# Question 7.

2 pts. Commit and push a gfm .md file to GitHub inside a directory
called Coding Challenge 6. Provide me a link to your github written as a
clickable link in your .pdf or .docx or .html.

# Alternative Solutions

Above I used rbind(). You could also loop to create vectors to fill
columns:

## Vector Based

``` r
# Get Auburn coordinates
auburn_lat <- cities.df$lat[cities.df$city == "Auburn"]
auburn_long <- cities.df$long[cities.df$city == "Auburn"]

# Create your vectors
City1 <- c()
City2 <- c()
Distance_km <- c()

# Perform your loop
for (i in 1:nrow(cities.df)) {

  City1[i] <- cities.df$city[i]
  City2[i] <- "Auburn"

  Distance_km[i] <- distance_calc(
    cities.df$lat[i],
    cities.df$long[i],
    auburn_lat,
    auburn_long
  )
}

# Use vectors to fill data frames 
distance.df2 <- data.frame(City1, City2, Distance_km)

# preview to show that they are the same
head(distance.df2)
```

    ##         City1  City2 Distance_km
    ## 1    New York Auburn   1367.8540
    ## 2 Los Angeles Auburn   3051.8382
    ## 3     Chicago Auburn   1045.5213
    ## 4       Miami Auburn    916.4138
    ## 5     Houston Auburn    993.0298
    ## 6      Dallas Auburn   1056.0217

Lastly. You could use mutate() and select to avoid loops altogether.

## Mutate() Solution

``` r
# Get Auburn coordinates
auburn_lat <- cities.df$lat[cities.df$city == "Auburn"]
auburn_long <- cities.df$long[cities.df$city == "Auburn"]

# Pipe and Mutate
distance.df3 <- cities.df %>%
  dplyr::mutate(Distance_km = distance_calc(lat, long, auburn_lat, auburn_long)) %>%
  dplyr::select(City1 = city, Distance_km) %>%
  dplyr::mutate(City2 = "Auburn") %>%
  dplyr::select(City1, City2, Distance_km)

# preview to show that they are the same
head(distance.df3)
```

    ##         City1  City2 Distance_km
    ## 1    New York Auburn   1367.8540
    ## 2 Los Angeles Auburn   3051.8382
    ## 3     Chicago Auburn   1045.5213
    ## 4       Miami Auburn    916.4138
    ## 5     Houston Auburn    993.0298
    ## 6      Dallas Auburn   1056.0217
