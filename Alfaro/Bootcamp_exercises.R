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
# meatloaf: initial value 0, value at start of iteraction -4, value at the end -30
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
compounded <- c(1:6) # must initialize variable first
for(i in 1:length(bankAccounts)){
  compounded[i] <- bankAccounts[i] + interestRate*bankAccounts[i]
}
print(compounded)
# a simpler method using the rep function
rep(bankAccounts + bankAccounts*interestRate)

# Exercise 6
bankAccounts <- c(10, 9.2, 5.6) # define initial balance of bank accounts
interestRate <- 0.0525 # define the interest rate
house <- c(4.8, 3.8, 5.7)
food <- c(3.5, 4.3, 5.0)
fun <- c(7.8, 2.1, 10.5)
income <- c(21, 21, 21)
expenses <- house + food + fun # combined all expenses

for(j in 1:5){
  for(i in 1:length(bankAccounts)){
    bankAccounts[i] <- bankAccounts[i] - expenses[i] + income[i]
    bankAccounts[i] <- bankAccounts[i] + interestRate*bankAccounts[i]
  }
}
print(bankAccounts)

# Exercise 7
bankAccounts <- c(10, 9.2, 5.6) # define bank accounts
interestRate <- 0.0525
house <- c(4.8, 3.8, 5.7) # deduct
food <- c(3.5, 4.3, 5.0) # deduct
fun <- c(7.8, 2.1, 10.5) # deduct
expenses <- house + food + fun # combined all the expensesincome <- c(21, 21, 21) 
income <- c(21, 21, 21) # income through TAships

for(years in 2015:2020){
  for(i in 1:length(bankAccounts)) {
  # update accounts with income and expenses
  bankAccounts[i] <- bankAccounts[i] - expenses[i] + income[i]
  # update trust fund disbursemenst on odd years for students 1 and 3
  if(years %% 2 == 1){ # odd years
    if( i==1 | i ==3){ # students 1 and 3
      bankAccounts[i] <- bankAccounts[i] + 5
  }
}
  bankAccounts[i] <- bankAccounts[i] + bankAccounts[i]*interestRate
  }
}
print(bankAccounts)

# Exercise 8
counter <- 0
total <- 0
while(counter <= 17){
  total <- total + counter
  counter <- counter + 1
}

total == sum(1:17) # can use this to check the results

# Exercise 9
sizeFunction <- function(number) {
  if(number <= -1) {
    print("small")
  } else if (number > -1 & number < 1) {
    print("medium")
  } else {
    print("big")
  }
}
sizeFunction(-1.001) # used this to test the function
sizeFunction(0.753) # used this to test the function
sizeFunction(4.23)# used this to test the function
