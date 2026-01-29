#### Introduction to R – 25 pts ####

### This assignment is intended to introduce you to R, RStudio, and integration with GitHub, as well as help you practice some R coding. You may work in pairs. When submitting the assignment on Canvas, please put both names on the assignment.

## 1.	5 pts. Explain the following things about R and Rstudio: 
  #	Where do you type code? 
  # a: you will type the code into the tab on the .R 

  #	Where is the output of the code? 
  # a: the output of the code will generate in your console

  #	Where do plots show up?
  # a: there is a plots tab on the bottom right of R studio interface

  #	What is a global environment? 
  # a: the global environment shows objects, vectors, and matrices that you have created and defined. example x <- 'insert number' will display within the environment
  
  #	How do you get help for a function through R studio? 
  # a: Use ?function_name (e.g., ?mean) to open the help documentation
  # a: Use help(function_name) as an alternative
?(mean)
help(mean)
  #	What is an R package?
  # a: An R package is a collection of functions, data, and documentation bundled together

  #	What is a function?
  # a: A function is a reusable piece of code that performs a specific task

  #	How do you find the installed and loaded packages? 
  # a: there is a packages tab. loaded packages will be indicated with check mark.

  #	What is a working directory, and how do you find it? 
  # a: The working directory is the folder on your computer where R looks for files by default and where it saves output unless another path is specified
  # It defines the reference point for relative file paths
  # You can find the current working directory using getwd()
getwd()
  #	What is a relative file path and how is it different than an absolute file path? 
  # a: A relative file path describes the location of a file in relation to the current working directory
  # Relative paths do not include the full directory structure from the root of the computer
  # An absolute file path specifies the complete path to a file starting from the root of the file system
  # Absolute paths are unambiguous but are often system-specific
  
## 2. 2 pts. Explain the steps to start a new R project connected to a GitHub repository.
  # 1. create your new repository on github
  # 2. then you click file -> new project
  # 3. then click version control -> git -> enter your repository url
 
## 3.	3 pts. Please explain the different data classes and how they are similar and different from each other. 
  # Vector
    # A vector is a one-dimensional data structure in R
    # All elements in a vector must be of the same data type
    # Vectors are used to store sequences of values such as numbers or characters
    # Examples include numeric, character, and logical vectors
  # Matrix
    # A matrix is a two-dimensional data structure with rows and columns
    # All elements in a matrix must be of the same data type
    # Matrices are commonly used for mathematical and linear algebra operations
  # Data frame
    # A data frame is a two-dimensional data structure similar to a table
    # Columns can contain different data types, but each column must be a single type
    # Data frames are commonly used to store datasets in R
    # Each row represents an observation and each column represents a variable

## 4.	10 pts. Complete all tasks in an R script and push it to GitHub.
  #	Create a vector named 'z' with the values 1 to 200
z <- (1:100)
  #	Print the mean and standard deviation of z on the console
print(mean(z))
print(sd(z))
  #	Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z > 30
  #	Make a dataframe with z and zlog as columns. Name the dataframe zdf
zdf <- data.frame(z = z, zlog = zlog)
  # Change the column names in your new dataframe to equal “zvec” and “zlogic”
colnames(zdf) <- c("zvec", "zlogic")
  #Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared. 
zdf$zsquared <- zdf$zvec ^ 2
  # Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100
zdf$zsquared[zdf$zsquared > 10 & zdf$zsquared < 100]
subset(zdf, zsquared > 10 & zsquared < 100)
  #	Subset the zdf dataframe to only include the values on row 26
zdf[26,]
subset(zdf, row(zdf) == 26) #technically you can do this but you shouldn't because subset is supposed to used on logical
  #	Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf[180,]
subset(zdf, row(zdf) == 180) 
  # note: we only have 100 rows so the above outputs NA NA NA NA

## 5.	3 pts. Download the Tips.csv file from Canvas. Use the read.csv() function to read the data into R using a relative file path  and so that the missing values are properly coded. **Note the missing values are reported in the data as a period (i.e., “.”). How do you know the data were read correctly? 
csv <- read.csv("corr.csv", na.strings = ".")
csv
  # you know that it is read properly because you can double click the data frame in the environment and see the missing data labeled as "NA" or you can type the dataframe name to display "csv"
## 6.	2 pts. Annotate your code, commit the changes and push it to your GitHub repository you created last class
