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




