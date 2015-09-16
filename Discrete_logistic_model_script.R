# Bruno Passarelli
# 16 September 2015
# this is a script to simulate and plot the discrete logisitc model

# set initial conditions and parameter values
N0 <- 100
RR <- 1.05
ttMax <- 10

# initialize variable to a vector of NA values
# note that I adjusted the values because I already set the first value of the vector
NN <- rep(NA, 11)
NN[1]<-N0
for(tt in 2:(ttMax+1)){
  NN[tt] <- RR*NN[tt-1]
}
print(NN)
  
# changing the parameters a little
N0 <- 100
RR <- 0.95
ttMax <- 15

NN <- rep(NA, 16)
NN[1]<-N0
for(tt in 2:(ttMax+1)){
  NN[tt] <- RR*NN[tt-1]
}
print(NN)
years <- c(0:15)
length(years)

plot(years,NN)

# Mini exercise 3.2.1
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
