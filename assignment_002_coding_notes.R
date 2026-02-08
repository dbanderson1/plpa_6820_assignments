#### Learn the Basics of Plotting ####
## Derek Anderson
## we will predominantly use ggplot() ##
## will cover basic things like plotting, layering, changing appearance, faceting, etc. ##

#### Step 1 - Install and Load ggplot2 ####
# install.packages("ggplot2") - you don't need this because ggplot2 is in tidyverse
install.packages("tidyverse")
# library(ggplot2) - you don't need this because ggplot2 is in tidyverse
library(tidyverse)

# there are a lot of different packages that you can download to get help

# mtcars is an example data set. it is a data frame 
mtcars

# aes is aesthetics 
# + sign allows us to add layers
# geoms are different representations of data layers; for example points, lines of best fit, linear
# scale can help you change color
# xlab and ylab are used to change labels


# lets get plotting
ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point() + #this is plotted first
  geom_smooth(method = lm, se = FALSE)

ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_smooth(method = lm) +
  geom_point(aes(size = hp, color = hp)) +
  xlab("Weight (tons)") +
  ylab("Miles Per Gallon (MPG)") +
  scale_color_gradient(low = "green", high = "red")

# whatever is plotted first is plotted are on top

## Now Lets Load File 

bull.richness <- read.csv("Bull_richness.csv", na.strings = ".")

ggplot(bull.richness, aes(x = GrowthStage, y = richness)) +
  geom_boxplot() +
  geom_point(position = position_jitterdodge())
  

## now lets compare by fungicide using color = fungicide

ggplot(bull.richness, aes(x = GrowthStage, y = richness, fill = Fungicide)) +
  geom_point(position = position_jitterdodge()) +
  geom_boxplot() +
  scale_color_manual(values = c("#E87722","#0C2340")) +
  scale_fill_manual(values = c("#E87722", "#0C2340"))


# bars with SE error bars
ggplot(bull.richness, aes(x = GrowthStage, y = richness, fill = Fungicide)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", position = "dodge") +
  scale_fill_manual(values = c("#E87722", "#0C2340"))

# bars with SE error bars
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") +
  scale_color_manual(values = c("#E87722", "#0C2340"))

# Faceting
ggplot(bull.richness, aes(x = GrowthStage, y = richness, group = Fungicide, color = Fungicide)) +
  stat_summary(fun = mean, geom = "line") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") +
  scale_color_manual(values = c("#E87722", "#0C2340")) + 
  facet_wrap(~Treatment*Crop, scales = "free")
  
