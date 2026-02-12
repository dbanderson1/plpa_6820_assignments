#### Coding Challenge 3 - Advanced Visualization ####
# student: Derek Anderson
# date: 2025-02-11
# location: https://github.com/dbanderson1/plpa_6820_assignments/blob/main/Coding_Challenge_3.R
# first, install ggplot2, which is in tidyverse
install.packages("tidyverse")
library(tidyverse)
# this time we will also add ggpubr which will allow us to integrate some stats into our figures
install.packages("ggpubr")
library(ggpubr)
# we will add ggrepel to label points as well. it will also help with figure design and consistency.
# we should also strive for color blind pallets
install.packages("ggrepel")
library(ggrepel)


# second, load the data
mycotoxin_csv <- read.csv("MycotoxinData.csv", na.strings = "na")

# we can define our color blind palette as a vector #
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

### 1.	5pts. Using ggplot, create a boxplot of DON by Treatment so that the plot looks like the image below. - complete
## a.	Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete introduced last week. -complete
## b.	Change the transparency of the jittered points to 0.6. -complete
## c.	The y-axis should be labeled "DON (ppm)", and the x-axis should be left blank. -complete
## d.	The plot should use a classic theme - complete
## e.	The plot should also be faceted by Cultivar - complete

ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("") +
  scale_color_manual(values = cbbPalette) +
  theme_classic() 

### 2.	4pts. Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70." -conmplete
mycotoxin_csv$Treatment <- factor(mycotoxin_csv$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

### 3.	5pts. Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.
# boxplot with treatment by DON
treatment.DON <- ggplot(mycotoxin_csv, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") +
  facet_wrap(~ Cultivar) +
  ylab("DON (ppm)") +
  xlab("") +
  theme_classic() +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) 
  

treatment.DON

# boxplot treatment by X15ADON
treatment.X15ADON <- ggplot(mycotoxin_csv, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") +
  facet_wrap(~ Cultivar) +
  ylab("X15ADON (ppm)") +
  xlab("") +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  theme_classic() 

treatment.X15ADON

# boxplot treatment by MassperSeed_mg
treatment.massperseed_mg <- ggplot(mycotoxin_csv, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") +
  facet_wrap(~ Cultivar) +
  ylab("Mass per Seed (mg)") +
  xlab("") +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  theme_classic() 

treatment.massperseed_mg

### 4.	5pts. Use ggarrange function to combine all three figures into one with three columns and one row. Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. What did the common.legend option do?
## a.	HINT: I didn’t specifically cover this in the tutorial, but you can go to the help page for the ggarange function to figure out what the common.legend option does and how to control it. 
# Arrange multiple ggplot objects into a single figure
figure1 <- ggarrange(
  treatment.DON,  
  treatment.massperseed_mg, 
  treatment.X15ADON,  
  labels = "auto",  
  nrow = 1,  
  ncol = 3,  
  common.legend = TRUE
)

figure1

# 5.	5pts. Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. Save each plot as a new R object, and combine them again with ggarange as you did in question 4. Your final plot should look something like this. 
# - complete