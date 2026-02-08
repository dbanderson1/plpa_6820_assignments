# Derek Anderson
# Assignment_003 - Advanced Visualization 2
#### General Notes
# Figure design for accessibility
# plotting multiple plots together
# Integration of basic statistics for exploratory analysis
# Integration of text and labels
# Keeping it simple: what makes a good plot and why

#### Step 1 - Install and Load ggplot2 ####
# install.packages("ggplot2") - you don't need this because ggplot2 is in tidyverse
install.packages("tidyverse")
# library(ggplot2) - you don't need this because ggplot2 is in tidyverse
library(tidyverse)
# this timei we will also add ggpubr which will allow us to integrate some stats into our figures
install.packages("ggpubr")
library(ggpubr)
# we will add ggrepel to label points as well. it will also help with figure design and consistency.
# we should also strive for color blind pallets
install.packages("ggrepel")
library(ggrepel)

#### Set up our palette ####
# we can define our color blind palette as a vector #
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#### Load in our Data ####
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

str(sample.data.bac)

## 'data.frame':    70 obs. of  10 variables:
##  $ Code         : chr  "S01_13" "S02_16" "S03_19" "S04_22" ...
##  $ Crop         : Factor w/ 3 levels "Soil","Cotton",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ Time_Point   : Factor w/ 4 levels "0","6","12","18": 1 1 1 1 1 1 2 2 2 2 ...
##  $ Replicate    : int  1 2 3 4 5 6 1 2 3 4 ...
##  $ Water_Imbibed: num  NA NA NA NA NA NA NA NA NA NA ...
##  $ shannon      : num  6.62 6.61 6.66 6.66 6.61 ...
##  $ invsimpson   : num  211 207 213 205 200 ...
##  $ simpson      : num  0.995 0.995 0.995 0.995 0.995 ...
##  $ richness     : int  3319 3079 3935 3922 3196 3481 3250 3170 3657 3177 ...
##  $ even         : num  0.817 0.823 0.805 0.805 0.819 ...