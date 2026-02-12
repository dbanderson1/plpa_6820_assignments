#### Coding Challenge 2 ####
# student: Derek Anderson
# date: 2025-02-11
# location: https://github.com/dbanderson1/plpa_6820_assignments/blob/main/Coding_Challenge_2.R
# first, install ggplot2, which is in tidyverse
install.packages("tidyverse")
library(tidyverse)

# second, load the data
mycotoxin_csv <- read.csv("MycotoxinData.csv", na.strings = "na")

### 1.	5 pts. Explain the following concepts about ggplot 
##a.	What three elements do you need to produce a ggplot?
# The three things that you you need are a:
# 1) data - a data frame that contains the variables you want to visualize
# 2) aesthetic mapping, which you call using aes(). 
# These are how variables map to visual properties like x-axis, y-axis, color and shape
# 3) a geom layer, or geometric object, that determines how the data are displayed (e.g. points, lines, bars)

##b.	What is a geom? 
# Geom is  short for geometric object.
# It is the visual representation of the data in a plot. It determines how the data are displayed
# Examples:
geom_point() #scatterplot points
geom_line() #lines
geom_boxplot() #boxplots
geom_bar() #bar charts

##c.	What is a facet? 
# A facet is a way to split data into subsets and display each subset in separate panels within the same figure.
# Faceting allows you to compare groups visually by creating multiple small plots based on the levels of a variable
# Examples:
facet_wrap(~ group)
facet_grid(rows ~ columns)

##d.	Explain the concept of layering.
# ggplot is built on the concept of layering.
# Plots are constructed by adding components one layer at a time using the + operator.
# example: 
ggplot(data, aes(x, y)) +
  geom_point() +
  geom_smooth()
# This creates one layer for points and another layer for a fitted line. Each layer builds on the previous one.

##e.	Where do you add x and y variables and map different shapes, colors, and other attributes to the data?
# You map x and y variables, as well as color, shape, size, and other visual attributes, inside the aes().
# example: 
ggplot(data, aes(x = height, y = weight, color = sex, shape = group)) +
  geom_point()
  

### 2.	4 pts. Make a boxplot using ggplot with DON as the y variable, treatment as the x variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, color = Cultivar)) +
  geom_boxplot() +
  ylab("DON (ppm)") +
  xlab("")

### 3.	4 pts. Now convert this data into a bar chart with standard-error error bars using the stat_summary() command. (hint: use position = dodge)
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  ylab("DON (ppm)") +
  xlab("")

### 4.	3 pts. Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge). 
## boxplot
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black") +
  ylab("DON (ppm)") +
  xlab("")

## bar chart
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black") +
  ylab("DON (ppm)") +
  xlab("")

### 5.	2 pts. Add a facet to the plots based on cultivar.
## boxplot
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black") +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("")

## bar chart
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black") +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("")
# accomplished using facet_wrap()

### 6.	3 pts. Add transparency to the points so you can still see the boxplot or bar in the background.
## boxplot
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black", alpha = 0.5) +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("")

## bar chart
ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean, geom = "bar", position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "black", alpha = 0.5) +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("")
# I did this by adding alpha to the geom point

### 7.	4 pts. Annotate your code and push it to github. 
# https://github.com/dbanderson1/plpa_6820_assignments/blob/main/Coding_Challenge_2.R