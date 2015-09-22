# Bruno Passarelli
# September 5, 2015
# EEB 201 - Examples from "A Primer of Ecology with R" - Appendix B

# This script will calculate the mean of 10 random standard normal variables.
mean(rnorm(10))

# B.1 Help
# This function allow you to access help from a specific function
'?'(mean)
'?'(barplot)
'?'(sd)

# alternatively, you can search for help this way:
help(mean)
help(barplot)
help(sd)

# You can also try the following if you don't know the exact name of a function
help.search("mean")
apropos("mean")
help.search("reg")
apropos("reg")

# To find help with functions that you have not yet downloaded, use:
RSiteSearch("violin")
RSiteSearch("violin", restrict = c("functions"))

# You can also combine help functions
help(RSiteSearch)

# B.2 Assignment
# assigning results to an object
a <- 2 + 7
a

# Assigning a new object
b <- a + a
b

# To perform two actions on one line, separate them with a semicolon
a + a; b - 6

# B.3 Data Structures
# B.3.1 Vectors
# Creating a vector (a group of numbers arranged in a row or column)
# Use the c() function and assign it to an objct (Y in this case)
Y <- c(5.4, 5.7, 6.1, 6.2, 6.8, 6.8, 7, 7, 7.3, 7.7 )

# Sequences
# Creating an order sequence
1:7
12:1
-5:5
-(1:5)

# Creating more complex sequences, specifying the units of the sequence, 
# or the total length of the sequence
seq(from = 0, to = 7, by = 0.5)
seq(1,7, by = 0.5)

# Create a sequence with a set range and length
seq(1,3, length = 8)

# Creating repetitive sequences - use rep() function
rep(1,3) # this creates a sequence of length 3 with repeating values of "1"
rep(1:3, 2) # this creates a sequence (1,2,3) and repeats it twice
rep(1:3, each = 2) # this creates a sequence 1-3 and repeats each value twice

# B.3.2 Getting information about vectors
# You can get the length, mean, maximum, and a six number summary of a vector
# Note - I created a different vector that the one in the book
sum(Y)
mean(Y)
max(Y)
summary(Y)

# Vectors can also be characters (logical)
Names <- c("Alley","Cairo")
Names
b <- c(TRUE, FALSE)
b

# You can also assign dates, complex numbers, real numbers, integers, or factors
# Ask R to what classes of data your vectors belong
class(Y) 
class(b)

# Now you can test whether each element of a vector is greater than a particular
# value or mean
Y > 6
Y > mean(Y)

# Testing using other conditions
Y == 7 # tests if any values are equal to 7 (must use double equal sign)
Y != 7 # tests if any values are NOT equal to 7
Y <= 7 # tests if any values are smaller or equal to 7
Y >= 7 # tests if any values are greater or equal to 7

# Algebra with vectors
# We can add, subtract, multiply, and divide vectors
# First, create two vectors (a and b), here I'll use two vectors of same length
a <- 1:4
b <- 3:6
a + b # this adds up the values of vectors a and b
a * b # this multiplies the values of vectors a and b
a/b # this divides the values of vectors a and b
a + 2 # this adds 2 to each value of vector a
a * 3 # this multiplies each value of vector a by 3
2/a # this divides 2 by each of the values of vector a

# Vectors of different lengths
# R may or may not give a warning
# Example 1 - multiplying a vector of length 4 by a vector of length 3
a * 1:3
# This returs a warning message
# From R console: longer object length is not a multiple of shorter object length

# Example 2 - multiplying a vector of length 4 by a vector of length 2
a * 1:2
# This recycled the scalar to match the length of the vector
# i.e. a = 1,2,3,4 was multiplied by 1,2,1,2 with the result: 1,4,3,8
# This is equivalent to:
1:4 * c(1,2,1,2)

# B.3.3 Extraction and missing values
# This can be done using 2 methods
# Method 1 - identify rows and columns that you want
Y[1] # this returns the first value of the vector Y
Y[1:3] # this returns the first 3 values of the vector Y

# Method 2 - provide a logical vector (of TRUE's and FALSE's)
Y > mean(Y) # this tells which values of the vector are greater (TRUE) or smaller (FALSE) than the mean
Y[Y > mean(Y)] # this lists all values greater than the mean

# Missing values in R
# Here, I create a vector a with one missing value
a <- c(4, 2, 7, NA)
mean(a) # the result of the mean is "NA"

# Testing which elements are missing with the is.na() function
is.na(a) # this shows which values are missing (TRUE) in the vector
!is.na(a) # this shows which values are NOT missing (TRUE) in the vector
a[!is.na(a)] # this will actually return the numeric values that are not missing

# Some other functions to test missing values
na.exclude(a) # equivalent to the command on the last line above
attr(,"na.action") # not sure what exactly this command does (shows the attributes of an object)
attr(,"class") # same with this one!

# Some functions that allow to remove missing elements 
mean(a) # this will return "NA"because of the missing value

# now this command says that there is a missing value but ask to calculate the mean anyways
mean(a, na.rm =TRUE) 

# another method - create a new vector "d" with all but the missing elements of vector "a"
d <- na.exclude(a)
mean(d) # now get the mean of the new vector

# B.3.4 - Matrices
# A matrix is a two dimensional set of elements, for which all elements are of the same type
# Here is a character matrix
matrix(letters[1:6], ncol = 2)

# Now a numeric matrix
# Data length must be a sub-multiple or multiple of the number of rows
M <- matrix(1:4, nrow = 2)

# The matrix is filled by columns by default
# We could also fill the matrix by rows
M2 <- matrix(1:21, nrow = 3, byrow = TRUE)

# You can also fill a matrix with specified values on the diagonal
I <- diag(2, nrow = 4)

# Creating the identity matrix
Minv <- solve(M)
M %*% Minv

# Extraction in matrices
M[1,2] # returns the value in the first row, second column (rows then columns always!)
M[1, 1:2] # returns the values in row 1, columns 1-2
M[2, 1:2] # returns the values in row 2, columns 1-2

# If we leave rows or columns blank, R returns all rows (or columns)
M[,2] # this returns the values of column 2, all rows
M[,] # this returns all values of the matrix

# September 7, 2015
# Optional sections of Appendix B

# B.4 Functions
# a function is a command that does something
# a function has a name, arguments, and values
help(mean) # this will show us arguments (x, trim, etc.)

# R is an "object-oriented" language
# here are two examples using data in different classes
class(1:5) # the class is integer
class(warpbreaks) # the class is data.frame - this is a built-in data set if R

# let's get their summaries
summary(1:5)
summary(warpbreaks)
# this provided different summaries because the objects belong to different classes

# getting a summary on a linear model
summary(lm(breaks ~ wool, data = warpbreaks)) # this gives the output of the regression

# B.4.1 Writing your own functions
# this is where you can customize functions and how packages are written
# Let's follow example from the book with the unethical boss who wants you to show that
# the average sales are higher than they actually are
MyBogusMean <- function(x, cheat = 0.05) { # x and cheat are arguments, we supplied a default for cheat (0.05)
	SumOfX <- sum(x)
	n <- length(x)
	trueMean <- SumOfX/n
	(1 + cheat) * trueMean
}
RealSales <- c(100, 200, 300)
MyBogusMean(RealSales)

# we can change the default of the function
MyBogusMean(RealSales, cheat = 0.2)
MyBogusMean(RealSales, cheat = 0)

# B.6 Iterated Actions: the "apply" Family and Loops
# used when you want to perform a function again and again and again

# B.6.1 Iteractions of independent actions
# Example: pick a 2 x 5 matrix (2 rowns and 5 columns)
# the rows are the first margin and the columns the second margin
m <- matrix(1:10, nrow = 2)
apply(m, MARGIN = 1, mean) # this returns the mean of values all rows (2 means in this case)
apply(m, MARGIN = 2, mean) # this returns the mean of values all columns (5 means in this case)

# check ?rowMeans for simple, even faster, operations
?rowMeans
rowMeans(m)
colMeans(m)
rowSums(m)
colSums(m)

# the function lapply() applies to all elements of a list and returns a list
# the function sapply() is similar but will simplify the result
sapply(1:10, function(i) mean(rnorm(5))) 
# perform an independent operation 10 times with an on-the-fly function

# B.6.2 Iteractions of dependent actions
# use this when repeated actions depend on previous outcomes (e.g. population growth)
# using "for loops" in R: the computation is faster if we first make a holder for the output
# example from book: simulate a random walk starting with 25 individuals at time = 0
# increase or decrease the number of individuals with amount randomly drawn from normal distribution, with a mean of zero and sd = 2
# round the amount to nearest integer
# output will differ since this is a random process
gens <- 9 # this will create nine more times in addition to time = 0
output <-numeric(gens + 1) # the output is numeric and will build on top of the previous
output[1] <- 25 # the value of the first output is 25
for (t in 1:gens) output[t + 1] <- output[t] + round(rnorm(n = 1, mean = 0, sd = 2), 0)

# September 12, 2015
# Optional sections of Appendix B

# B.13 Graphics

# B.13.1 Creating a simple scatterplot
# this will create figure B.5a
data(trees)
attach(trees)
plot(Girth, Height)

# B.13.2 Addong points, lines and text to a plot
# Example from book - set up a new graph without plotting points, add text at each point, then more points, a line, and some text
par (mar = c(5, 4, 3, 2))
plot(Girth, Volume, type = "n", main = "My Trees")
points(Girth, Volume, type = "h", col = "lightgrey", pch = 19)

# now we add points for these data, change coloring system, make symbols transparent overlapping, and allow size of numbers to vary with height (cex = 0.5 + hts), and add a legend
# this will create figure B.5b
hts <- (Height - min(Height))/max(Height - min(Height))
my.colors <- hcl(h = 30 + 300 * hts, alpha = 0.9)
text(Girth, Volume, Height, col = my.colors, cex = 0.5 + hts)

# B.13.3 More than one response variable
# this shows how to use lines, points, or matplot to plot a matrix of variables against one predictor
# this will create figure B.5c
trees.sort <- trees[order(trees$Girth, trees$Height),]
matplot(trees.sort$Girth, trees.sort[, 2:3], type = "b")
text(18, 40, "Volume", col = "darkred")
text(10, 58, "Height")

# adding a second y-axis to a graph that has a different scale
# this will create figure B.5d
# first, start with jus X and the first Y
quartz(, 4,4) # this changes the size of the graph
par(mar = c(5, 4, 2, 4))
plot(Girth, Volume, main = "My Trees")
# now we draw a new plot as if it was a new graph
par(new = TRUE)
plot(Girth, Height, axes = FALSE, bty = "n", xlab ="", ylab = "", pch = 3)

# B.13.4 Controlling Graphics Devices
# to open a "graphics device" on a Mac, use:
quartz(width = 5, height = 3)

# there are many arguments that can be used with the par () function
# mar this controls the space in the margins default c(5, 4, 4, 2) + 0.1
# mgp controls the spacing of the axis title
# tcl controls the tick length

# we can also build each side of the graph separately
# initiate a graph but not plotting axes plot(..., axes = FALSE)
# then add axes separately. Example: axis(1) adds the X axis
# we can also use layout to make a graph with several smaller subgraphs
# this will create figure B.6
quartz (, 5,5)
layout(matrix(c(1, 2, 3, 3), nrow = 2, byrow = TRUE))
plot (Girth, Height)

# now, let's add a second and third graphs with different settings
par(mar = c(3, 3, 1, 1), mgp = c(1.6, 0.2, 0), tcl = 0.2)
plot (Girth, Height)
par(mar = c(3, 3, 2, 1), mgp = c(1.6, 0.2, 0), tcl = 0.2)
plot (Girth, Height, axes = FALSE, xlim = c(8, 22))
axis(1, tlc = -0.3)
axis(2, tlc = F)
rug(Height, side = 2, col = 2)
title("A Third, Very Wide, Plot")

# B.13.5 Creating a Graphis File
getwd()
quartz(, 5, 5)
plot(Height, Volume, main = "Tree Data")
dev.print(pdf, "MyTree.pdf")
