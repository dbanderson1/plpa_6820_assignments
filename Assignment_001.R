# This is my assignment_001

#### This is a section - Learning Objectives ####
# you can collapse this whole section to hide
# Use basic mathematical operators in R
# know some of the data types
# install package
# load data into R from a .csv or .txt files

#### Notes Section ####
# This a comment - it will not code
# Command + Enter will execute a line of code or you can click ‘run’
# R is case-sensitive. X does not equal x

#### Exercise Number 1 - Calculations ####
# R is a big calculator
#addition
2+2
#subtraction
2-2 
#division
2/2
#multiplication 
2*2

#### Exercise Number 2 - Scalar Objects ####
#you can store results of equations <- , note you can also use "=" but "<-" is preferred
#objects
#these are numeric variables
x <- 2
y <- 3
#using objects
obj_sum <- x+y
obj_dif <- x-y
obj_prod <- x*y
obj_quotient <- x/y
obj_power <- x^y

#this is a character variable
name <- "Derek"
seven <- 7
five <- "5"
#this is a logical variable, you must use all caps TRUE or FALSE
excited <- TRUE
# this is an integer variable, it will only output whole numbers not decimals. you annotate with L.
age <- 40L
# example equation using named objects
seven * x
# five * x will not run because you can't execute math operations on character variables

#### Exercise 3 - Functions ####
#print() function will display it your console
#class() function will tell you whether it is numeric, character, integer, or logical
#you can combine print() with other functions, like Class(), if you want to display the output
print(obj_sum)
print(class(obj_sum))
print(name)
print(class(name))
print(excited)
print(class(excited))
print(age)
print(class(age))

#concatenate function
#here we are using c() to make vectors
#we can make any class vector similar to above (numeric, character, integer, logical)
vec <- c(1, 2, 3, 4, 5, 6, 7)
vec1 <- c(1:7)
vec2 <- 1:7
vec3 <- c("zach", "derek", "brenda")
vec4 <- c(TRUE, FALSE, TRUE)
#choosing an item within a vector
#use [] to select a number within a vector
vec[3]
vec3[3]
#you can do operations with your vectors
vec2 + 2

#basic functions built into R
vec <- c(1, 2, 3, 4, 5, 6, 7)
mean(vec)  # mean
sd(vec)  # standard deviation
sum(vec)  # sum
median(vec)  # median
min(vec)  # minimum 
max(vec)  # maximum
summary(vec)  #IQR - output depends on the data class
abs(vec) # absolute value
sqrt(vec) # square root
log(vec) # natural log
log10(vec) # log base 10
exp(vec) # power of e

#### Exercise 4 - Logical Operators ####
# > is greater than
1 > 2 
# < is less than
1 < 2 
# <= is less than or equal to, >= greater than or equal to, != not equal 
1 <= 2 
1 >= 2
1 != 2
# == is exactly equal to
1 == 1
# = is used to assign values left to right. similar to <- but often in functions where <- is reserved for objects
# | means 'OR'
1 == 2 | 1 == 1 
# & means 'AND' 
1 == 2 & 1 == 1 
1 == 1 & 1 == 1 
#### Exercise 5 - Vectors ####
t <- 1:10 

t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
t[(t > 8) & (t < 10)]  # returns 9
t[t != 2]  # returns elements of t that are not exactly equal to 2
t[!t == 2] # multiple ways to do the same thing
2 %in% t #asks if the item between % _ % is found within

#### Exercise 6 - Data Types ####
# review of types we have covered
# scalar objects
x
# vectors
t
# numeric matrix
mat1 <- matrix(data = c(1,2,3), nrow = 3, ncol =3)
##      [,1] [,2] [,3]
## [1,]    1    1    1
## [2,]    2    2    2
## [3,]    3    3    3

# character matrix
mat2 <- matrix(data = c("Zach", "Jie", "Tom"), nrow = 3, ncol = 3)
##      [,1]   [,2]   [,3]  
## [1,] "Zach" "Zach" "Zach"
## [2,] "Jie"  "Jie"  "Jie" 
## [3,] "Tom"  "Tom"  "Tom"

#to output to console just type name of matrix
mat2

mat1[1]
mat1[2]
mat1[3]
mat1[4]
# logical function using  
mat1[3] == 3
mat1[3] == 2
mat1[1,3]
# example print first row
print(mat1[1,])
# example of using math function on matrix | portion of matrix
mat1[1,] * 3

#### Exercise 7 - Data Frames ####
# data frames are basically like matrices but with multiple data classes or data types (i.e., logical, character, & numeric)
# created a data frame with the first columns of mat1 and mat2 and all rows
df <- data.frame(mat1[,1], mat2[,1])
# output to see in the console
df 

colnames(df) <- c("value", "name")
df

## Review of Indexing
# vectors
# returns the second element of vec2
vec2[2] 

# matrices
mat1[1]  # returns the first element of the matrix i.e. row 1 column 1
mat1[2]  # returns the second element of the matrix i.e. row 2 column 1 
mat1[5]  # returns the 5th element of the matrix i.e. row 2 column 2
mat1[1, 3]  # returns the element in row 1 column 3
mat1[1, ]  # returns the first row 
mat1[,1] # returns the first column

# data frames
df[1, ]  # returns the first row of the data frame 
df[1,2]  # returns first row second column
df[, "value"]  # returns the first column

## However, data frames are awesome because we we can introduce a new and super easy way to index data frames with the $ operator.
# $ will allow you to access all the data within the column
df$value # outputs the entire column named value, the result is a vector
df$name # outputs the entire column named name, the result is a vector
df$name[2] # Brackets help us output the second value in our name column
df$name[2:3] # Brackets help us output the second through the third value in our name column with a colon.

## Fancy Subset Examples
df$value[df$name == "Jie"]  # returns 2, i.e. the element of var1 such that names = Jie 
df[df$name == "Jie",] # retu rns all rows with the value Jie in the name column.
df$value[df$name %in% c("Jie", "Tom")] #returns values in column that have Jie or Zach in corresponding row
# return the elements of the column value within the data frame such that name is NOT (!) equal to Jie
df$value[df$name != "Jie"] 
# return the elements of the column value within the data frame such that name is NOT (!) equal to Jie or Tom
df$value[!df$name %in% c("Jie", "Tom")]

#subset function
subset(df, name == "Jie")

##add column to data frame
df$log_value <- log(df$value) # create a new column with the column header named "log_value" and create this variable with the log of the "value" column
df

#### Installing Packages ####

