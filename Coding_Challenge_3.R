#### Coding Challenge 3 - Advanced Visualization ####

### 1.	5pts. Using ggplot, create a boxplot of DON by Treatment so that the plot looks like the image below.
## a.	Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete introduced last week. 
## b.	Change the transparency of the jittered points to 0.6. 
## c.	The y-axis should be labeled "DON (ppm)", and the x-axis should be left blank. 
## d.	The plot should use a classic theme
## e.	The plot should also be faceted by Cultivar


2.	4pts. Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70. 

3.	5pts. Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.

4.	5pts. Use ggarrange function to combine all three figures into one with three columns and one row. Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. What did the common.legend option do?
  a.	HINT: I didn’t specifically cover this in the tutorial, but you can go to the help page for the ggarange function to figure out what the common.legend option does and how to control it. 

5.	5pts. Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. Save each plot as a new R object, and combine them again with ggarange as you did in question 4. Your final plot should look something like this. 
