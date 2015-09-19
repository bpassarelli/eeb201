# Bruno Passarelli
# 17 September 2015
# This script has the bootcamp exercises

# Exercise 1
# method 1
for(ii in 1:9){
  if(ii<9){
    cat("\n")
  }
  else{
  cat("*")
  }
}

# method 2
for(ii in 1:9){
  cat("\n");
  if(ii == 9){
    cat("*\n")
  }
}

# Exercise 2
for (ii in 1:10){
  cat("*&")
}

# Exercise 3
# done by hand
# dogs: initial value 10, value at start of iteraction 11, value at the end 15
# meatloaf: initial value 0, value at start of iteraction -4, value at the end -8
# bubbles: initial value 12, value at start of iteraction -1, value at the end -4

# Exercise 4
years <- c(2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], "Hooray, congressional elections", sep = "\t", fill = T)
  }
  else{
    cat(years[ii], "Oh yeah! Let's vote for president", sep = "\t", fill = T)
  }
}
  
# Exercise 5
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5)
interestRate <- 0.0125
compounded <- interestRate*bankAccounts + bankAccounts # must initialize variable first
for(i in 1:length(bankAccounts)){
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; 
}
# a simpler method using the rep function
rep(bankAccounts + bankAccounts*interestRate)
