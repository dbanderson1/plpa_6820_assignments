# Global Setup

``` r
library(ggplot2)
library(knitr)
library(markdown)
library(ggrepel)
library(ggpubr)
knitr::opts_chunk$set(echo = TRUE)
```

# Instructions

This assignment will help you practice integrating markdown into your R
scripts for literate programming. It will also involve some more
practice with GitHub. You may collaborate with a partner to enhance your
learning experience. Please ensure the following:

- **Collaboration:** If you work with a partner, include both names on
  the final submission by editing the YAML header.
- **Submission:** Each person should still submit an assignment to
  canvas in a Word document, html, or .pdf file generated through R
  markdown. Additionally, you should provide a link to your GitHub,
  where the assignment should be viewable by rendering it as a
  GitHub-flavored markdown file.
- **Setup:** It is also assumed you already have a GitHub repository for
  this class.

This document contains data from the following manuscript: [Noel, Z.A.,
Roze, L.V., Breunig, M., Trail, F. 2022. Endophytic fungi as promising
biocontrol agent to protect wheat from Fusarium graminearum head blight.
Plant Disease.](https://doi.org/10.1094/PDIS-06-21-1253-RE)

# Questions

## Question 1

4 pts. Explain the following:

1.  YAML header - is the metadata section at the top of the markdown
    file. It contains common fields such as title, date, author, and
    output format.

2.  Literate programming - is when programming is given as an
    explanation of how it works in a natural language, such as English,
    interspersed with snippets of macros and traditional source code.
    This makes the code both machine and human readable.

## Question 2

6 pts. Take the code you wrote for coding challenge 3, question 5, and
incorporate it into your R markdown file.

1.  At the top of the document, make a clickable link to the manuscript
    where these data are published. ☑

2.  Read the data using a relative file path with na.strings option set
    to “na”. This means you need to put the Mycotoxin.csv file we have
    used for the past two weeks into your directory, which git tracks. ☑

``` r
mycotoxin_csv <- read.csv("MycotoxinData.csv", na.strings = "na")
```

3.  Make a separate code chunk for the figures plotting the DON data,
    15ADON, and Seedmass, and one for the three combined using
    ggarrange. ☑

``` r
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
```

``` r
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

# boxplot with treatment by X15ADON
treatment.X15ADON <- ggplot(mycotoxin_csv, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") +
  facet_wrap(~ Cultivar) +
  ylab("X15ADON (ppm)") +
  xlab("") +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  theme_classic() 

# boxplot with treatment by MassperSeed_mg
treatment.massperseed_mg <- ggplot(mycotoxin_csv, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position = "dodge") +
  geom_point(position = position_jitterdodge(), shape = 21, color = "#000000", alpha = 0.6) +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "{p.adj.format}{p.adj.signif}") +
  facet_wrap(~ Cultivar) +
  ylab("Mass per Seed (mg)") +
  xlab("") +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  theme_classic() 
```

``` r
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
```

![](Coding_Challenge_4_files/figure-gfm/Commbine%20and%20Display%20Plots-1.png)<!-- -->

## Question 3

6 pts. Knit your document together in the following formats:

1.  Choose one format: .docx (word document), .pdf, or **.html.** Make
    sure it includes a table of contents ☑

2.  GitHub flavored markdown (.md file). ☑

## Question 4

2 pts. Push the .docx or .pdf and .md files to GitHub inside a directory
called Coding Challenge 4. ☑

## Question 5

6 pts. Now edit, commit, and push the README file for your repository
and include the following elements.

1.  A clickable link in your README to your GitHub flavored .md file. ☑

2.  A file tree of your GitHub repository. ☑

## Question 6

1 pt. Please turn in the file generated in question 3a to canvas with a
clickable link to your GitHub repository within the document. ☑
