#### Coding Challenge 2 ####
# student: Derek Anderson
# date: 2025-02-11

### 1.	5 pts. Explain the following concepts about ggplot 
##a.	What three elements do you need to produce a ggplot?
# The three things that you you need are a:
# 1) data - a data fram that contains the variables you want to visualize
# 2) aesthetic mapping, which you call using aes(). 
# These are how variables map to visual properties like x-axis, y-axis, color and shape
# 3) a geom layer, or geometric object, that determins how the data are displayed (e.g. points, lines, bars)

##b.	What is a geom? 
# Geom is  short for geometric object.
# It is the visual representation of the data in a plot. It determines how the data are displayed..
geom_point() #scatterplot points
geom_line() #lines
geom_boxplot() #boxplots
geom_bar() #bar charts

##c.	What is a facet? 
#

##d.	Explain the concept of layering. 
##e.	Where do you add x and y variables and map different shapes, colors, and other attributes to the data? 
  
### 2.	4 pts. Make a boxplot using ggplot with DON as the y variable, treatment as the x variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.

### 3.	4 pts. Now convert this data into a bar chart with standard-error error bars using the stat_summary() command. (hint: use position = dodge)

### 4.	3 pts. Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge). 

### 5.	2 pts. Add a facet to the plots based on cultivar.

### 6.	3 pts. Add transparency to the points so you can still see the boxplot or bar in the background. 

### 7.	4 pts. Annotate your code and push it to github. 
