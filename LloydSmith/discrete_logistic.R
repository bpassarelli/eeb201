# Bruno Passarelli
# 19 September 2015
# this script simulates and plots the discrete logistic growth model 
# it follows the 'Introduction to Dynamic Models in R' handout by Lloyd-Smith

# 3.3 Logistic growth in discrete time
# start the same way as the previous model (changed the parameters!)
N0 <- 50 
rr <- .1 
ttMax <- 75 
KK <- 1000 # this is the carrying capacity

# initialize variable to a vector of NA values
NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
NN[1] <- N0 
# loop over ttMax timesteps, using the updated model equation to update NN
for(tt in 1:ttMax) {
  NN[tt+1] <- NN[tt]*(1+rr*(1-NN[tt]/KK)) # this is using the new formula
}

# plot the results
plot(1:(ttMax+1), NN, xlab="time", ylab="n", type="l", col="blue")

# 3.3.1 Mini-exercise
# convert the script into a function

discreteLogisticFun <- function(N0, rr, KK) {
  NN <- matrix(NA, nrow=1, ncol=ttMax+1) 
  NN[1] <- N0 
  for(tt in 1:ttMax) {
    NN[tt+1] <- NN[tt]*(1+rr*(1-NN[tt]/KK)) # this is using the new formula
  }
  plot(1:(ttMax+1), NN, xlab="time", ylab="n", type="l", col="blue")
}

discreteLogisticFun (N0=10, rr=0.5, KK=100)
