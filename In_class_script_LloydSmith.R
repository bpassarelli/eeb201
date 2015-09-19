# Bruno Passarelli
# 19 September 2015
# this script follows the "R programming" PDF by Lloyd-Smith

# Reset R's brain
rm(list=ls())

library(ape)
library(geiger)
library(ggplot2)

xx <- seq(0, 100, by = 0.1)
yy <- 3*xx^2 - xx + 2
plot(xx, yy, type = "l", col = "red", main = "Myplot")

# Flow control - conditional execution
# execute part of a program under certain conditions
# use if statement
# example -  a script to show how a geometric growth model will act.
RR <- 1.2 # value of annual growth rate - can change this to see how ss will change
if(RR > 1){
  ss <- "The population will grow."
}  else{
  ss <- "The population will shrink or stay the same"
}
ss

# Flow control - looping
# used for tasks that you want to repeat many times
# example - two ways of doing an operation 10 times

# using a for loop
nn <- 10
RR <- 1.1
for(tt in 1:10){
  nn[tt + 1] <- RR*nn[tt]
}
nn

# same example using a for while loop
nn <- 10
RR <- 1.1
tt <- 1
while(tt <= 10){
  nn[tt + 1] <- RR*nn[tt]
  tt <- tt + 1
}
nn

# Pseudo-code exercise
# calculate the sum of all numbers from 1 to 20 
# assign to an object xx a vector with numbers from 1 to 20
xx <- c(1:20) 
# assign to an object yy a vector with the sum of all values in xx
yy <- sum(xx)
# check the result
yy

# the following is a script to simulate and plot the discrete logistic model
N0 <- 100 # define the initial population
RR <- 1.05 # define the growth rate
ttMax <- 10 # define the time range that you want to track population growth



NN <- rep(NA, 11) # initialize variable to a vector of NA values
NN[1]<- N0 # set the first value of the vector to N0 (100 in this example)
for(tt in 2:(ttMax+1)){ # I adjusted the values because already set the first value of the vector
  NN[tt] <- RR*NN[tt-1]
}
print(NN)

# another way of doing it (without adjustments)
NN <- rep (NA, 11)
NN[1] <- N0
for(tt in 1:(ttMax)){
  NN[tt+1] <- RR*NN[tt]
}
print(NN)

# changing the parameters a little
# bonus - modify script to generate plot of population (N) over time (t)
N0 <- 100
RR <- 0.90 # this will result in a decrease in the population (rate < 1.0)
ttMax <- 15 # increased the number of years

NN <- rep(NA, 16) 
NN[1]<-N0
for(tt in 1:(ttMax)){
  NN[tt+1] <- RR*NN[tt]
}
print(NN)

# plotting the model
years <- c(0:15)
length(years)
plot(years, NN, xlab = "time", ylab = "N", col = "blue")

# another way to plot the results (from slideshow)
plot(1:(ttMax+1), NN, xlab = "time", ylab = "N", col = "blue")

# Programming functions
# 1. choose a name for the fuction
# 2. define the arguments
# 3. define the operations
# 4. set the value the function returns

# example - compute the mean grade for a class, with possible inflation
myMeanGrade <- function(rawGrades, inflate = 1){ # need to assign a default to inflate
  sumGrades <- sum(rawGrades)
  nStudents <- length(rawGrades)
  trueMeanGrade <- sumGrades/nStudents
  return(trueMeanGrade * inflate)
}
myMeanGrade (c(60, 70, 80, 90)) # this returns the true mean (inflate = 1)
myMeanGrade (c(60, 70, 80, 90), 1.1) # sets the argument for inflate at 1.1

# Inputs - optional arguments
# if you pass less values tha arguments, R fills them from left to right
# example
test3 <- function(x = 1, y = 1, z = 1){
  return(x * 100 + y * 10 + z)
}
test3(2, 2) # this will fill the arguments x and y
test3(y = 2, z = 2) # in this case, we specified the arguments, x will equal 1