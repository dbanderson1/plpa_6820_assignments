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

#### Exercise Number 1 ####
# R is a big calculator
#addition
2+2
#subtraction
2-2 
#division
2/2
#multiplication 
2*2

#### Exercise Number 2 ####
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

#functions
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
