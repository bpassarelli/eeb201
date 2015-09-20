# Bruno Passarelli
# 19 September 2015
# this script simulates and plots the discrete logistic model 
# it follows the 'Introduction to Dynamic Models in R' handout by Lloyd-Smith
# it repeats parts of in-class exercises from 16 Sep 15

# 3.2 Writing your first model: Geometric growth
# the following is a script to simulate and plot the discrete logistic model
N0 <- 25 # define the initial population
RR <- 1.05 # define the growth rate
ttMax <- 100 # define the time range that you want to track population growth

NN <- matrix(NA, nrow=1, ncol=ttMax+1) # initialize variable to a vector of NA values
NN[1] <- N0 # set first value to initial condition

# loop over ttMax timesteps, using the model equation to update NN
for(tt in 1:ttMax) {
  NN[tt+1] <- RR*NN[tt]
}

# plot the results
plot(1:(ttMax+1), NN, xlab="time", ylab="n", type="b", col="blue")

# 3.2.1 Mini-exercise
# Set parameter values and initial conditions, and initialize variables for output
N0 <- 50
RR <- 0.95
ttMax <- 100 

NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
NN[1] <- N0 

for (tt in 1:ttMax) {
  NN[tt+1] <- RR*NN[tt]
}

plot(1:(ttMax+1),NN, xlab="time", ylab="N", type="b", col='blue')


# Exercise 3.2.2
GeometricGrowthFun <- function (RR, N0, ttMax){
  NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
  NN[1] <- N0 
  
  for (tt in 1:ttMax) {
    NN[tt+1] <- RR*NN[tt]
  }
  
  plot(1:(ttMax+1),NN, xlab="time", ylab="N", type="b", col='blue')
}

GeometricGrowthFun (RR = 0.95, N0 = 10, ttMax = 50)