# Bruno Passarelli
# 20 September 2015
# this is script to write a differential equation model in R

rm(list=ls())
library(deSolve)

# 4.1 A first example of an ODE model: exponential growth
expGrowthODE <- function(tt, yy, pars){ 
  derivs <- pars["rr"] * yy
  return(list(derivs))
}

# arguments must always be the same, in this specific order
## tt is the time
## yy is the state variable
## pars is a vector of parameters
## the names don't matter, as long as they are consistently used

# generic syntax for the model
# output <- lsoda(init, tseq, ODEfunction, pars)
# init is the initial value of the state variable
# tseq is a vector of the time points where the model will be evaluated
# ODEfunction is a placeholder for the name of the function holding the model equations
# pars is a vector containing any parameters used in the model

# let's load some appropriate values into these variables
init <- 1
tseq <- seq(0, 20, by = 0.01)
pars <- c(rr = 0.1)

# let's run the model
expGrowthOutput <- lsoda(init, tseq, expGrowthODE, pars)

head(expGrowthOutput)

par(mfrow = c(1,1))

plot(expGrowthOutput[,1], expGrowthOutput[,2], col = "blue", type = "l")

# 4.1.1 Mini-exercise
# make a script that brings together the commands to make and run this model
# setup statements
library(deSolve)

# setup function
expGrowthODE <- function(tt, yy, pars){ 
  derivs <- pars["rr"] * yy
  return(list(derivs))
}

# set parameter values and initial conditions
init <- 1
tseq <- seq(0, 20, by = 0.01)
pars <- c(rr = 0.1)

# set calculations
expGrowthOutput <- lsoda(init, tseq, expGrowthODE, pars)

# display the results
plot(expGrowthOutput[,1], expGrowthOutput[,2], col = "blue", type = "l")

# 4.2.1 Mini-exercise
logGrowthODE <- function(tt, yy, pars){
  derivs <- pars["rr"] * yy*(1-yy/pars["KK"])
  return(list(derivs))
}

init <- 1
tseq <- seq(0, 20, by = 0.01)
pars <- c(rr = 0.1, KK = 100)
logGrowthOutput <- lsoda(init, tseq, logGrowthODE, pars)
head(logGrowthOutput)
plot(logGrowthOutput[,1], logGrowthOutput[,2], col = "blue", type = "l")
