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
# this time we will also add ggpubr which will allow us to integrate some stats into our figures
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
# first we load in factors
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings = "na")
# then we set time as a factor so it is not read as continuous variable
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
# then we will do the same for crop type
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
# then we change the default way in which it is plotted.
# by default R will use alphabetical order 
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels = c("Soil", "Cotton", "Soybean"))

str(sample.data.bac)

####### Bacterial evenness; Figure 2a ########
bac.even <- ggplot(sample.data.bac, aes(x = Time_Point, y = even, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as even, and color by Crop
  geom_boxplot(position = position_dodge(0.85)) +  # Add boxplots with dodged positions to avoid overlap
  geom_point(position = position_jitterdodge(0.05)) +  # Add jittered points to show individual data points, avoiding overlap
  ylab("Pielou's evenness") +  # Label the y-axis
  xlab("Hours post sowing") +  # Label the x-axis
  scale_color_manual(values = cbbPalette, name = "", labels = c("Soil no seeds", "Cotton spermosphere", "Soybean spermosphere")) +  # Manually set colors and labels for the Crop variable
  theme_classic()   # Use a classic theme for the plot
bac.even

####### Water Imbibition correlate with bacterial evenness; Figure 2b #####

sample.data.bac.nosoil <- subset(sample.data.bac, Crop != "Soil")

water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed

##### Figure 2c #####
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor

#### Figure 2; significance levels added with Adobe or powerpoint #### 

# Arrange multiple ggplot objects into a single figure
figure2 <- ggarrange(
  water.imbibed,  # First plot: water.imbibed
  bac.even,  # Second plot: bac.even
  water.imbibed.cor,  # Third plot: water.imbibed.cor
  labels = "auto",  # Automatically label the plots (A, B, C, etc.)
  nrow = 3,  # Arrange the plots in 3 rows
  ncol = 1,  # Arrange the plots in 1 column
  legend = FALSE  # Do not include a legend in the combined figure
)
figure2 # this last little bit of code is IMPORTANT because it renders it.
# The professor didn't type this because he used some fancy shortcut to enter figure2 that he highlighted
# you can be cool like him by using ctrl + enter

#### Integrating Basic Stats - ANOVA ####
bac.even + 
  stat_compare_means(method = "anova") # apply an anova to the groups
## popst hoc for all comparisons
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.format")
## this is cool and shows statistically significant levels
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")
## values with significance
bac.even + 
  geom_pwc(aes(group = Crop), method = "t_test", label = "{p.adj.format}{p.adj.signif}")

#### Displaying Correlation Data ####
# gives correlation data - pearson's
water.imbibed.cor + 
  stat_cor()
# with regression line
water.imbibed.cor + 
  stat_cor(label.y = 0.7) +
  stat_regline_equation()

#### Labeling Specific Points ####
# read the data
diff.abund <- read.csv("diff_abund.csv")

str(diff.abund)

#make volcanoe plot
diff.abund$log10_pvalue <- -log10(diff.abund$p_CropSoybean)
diff.abund.label <- diff.abund[diff.abund$log10_pvalue > 30,]

#make the plot
ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  theme_classic() + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label))

#make the plot look nice with colorblind palette
volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean)) + 
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label)) + 
  scale_color_manual(values = cbbPalette, name = "Significant") +
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano

#emphasize different parts using different shapes or colors
volcano <- ggplot() + 
  geom_point(data = diff.abund, aes(x = lfc_CropSoybean, y = log10_pvalue)) + 
  geom_point(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue), color = "red", shape = 17, size = 4) +
  geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, label = Label), color = "red") + 
  theme_classic() + 
  xlab("Log fold change Soil vs. Soybean") +
  ylab("-log10 p-value")
volcano


#### EXTRA - adding significance letters to represent pairwise comparisons ####
## install the packages
install.packages("lme4")
library(lme4)
install.packages("emmeans")
library(emmeans) #version 1.8.7
install.packages("multcomp")
library(multcomp)
## read the data, note: I could not find the .csv to follow these
STAND <- read.csv("raw_data_valent2023_pythium_seedtreatment.csv", na.strings = "na")


#### OTHER - CONSIDER TIDYPLOTS ####
# https://tidyplots.org/use-cases/
# alot of what tidyplots does is available natively in ggplots but it can make things easier



