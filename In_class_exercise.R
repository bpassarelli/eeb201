# Bruno Passarelli 
# 16 September 2015
# this script is for Alfaro's in class exercises

# when using help, you can copy examples to the script and send it to console to see 
# how a certain function works

source("source.example.R")
source
all.I.know.about.life.I.learned.in.grad.school()

library(ape)

# read in tree
tt <- read.tree("tree.tre")
tt
attributes(tt)
head(tt$tip.label)

# read in data
# header indicates that there is a header line in the data (TRUE or T works)
dd <- read.table("data.txt", header = T, as.is = T, sep = "\t")
str(dd) # this shows the structure of an object
attributes(dd)
head(dd) # this shows the first six elements of the object
dim(dd) # this returns the dimensions of an object (92 rows by 2 columns in this example)
dim(dd)[1] # dimensions of the rows
dflength <- dim(dd)[1] # this assigns the dimensions of rows to the object dflength
dim(dd)[2]
runif(1) # generates random uniform distribution

# generate some random size data
size <- runif(dflength) # get 92 random variables (dflength = 92), generate random size data

# use cbind to add this column to the exisitng data frame
head(dd) # use this to check data frame; it will return the first 6 values
head(cbind(dd, size)) # this will add a column "size" to the data frame

# make a new variable and give it a name
newdd <- cbind(dd, size) # use this if you want to keep the original variable dd unaltered

# if you want to overwrite dd to include a variable with a new column, use this:
dd <- cbind(dd, size)
head(dd) # check new variable, you will see the size column added

# acessing data frame elements
names(dd) # this gives you the names of the columns
dd$species # this returns all species 
head(dd$species) # check the species column first six values
tail(dd$species) # check the species column last six values
head(dd$size) # check the size column first six values

# use [] after a data frame to access specific cells, rows, and columns
dd[1,] # look at row 1, all columns
dd[,1] # look at all rows, column 1
dd[1:10,] # look at rows 1-10, all columns
dd[5:10,] # rows5-10, all columns
dd[1:10,2] # rows 1-10, column 2
dd[,1] # all rows, column 1
dd[,2] # all rows, column 2

# the which() function does queries with your data
# this one is telling you to look at the mode column and find values equal to MPF
which(dd$mode == 'MPF') # this will list every row number that has MPF in the mode column

# two equal signs (==) is asking if two things are equal
dd$mode == "MPF" 
# the above returns T or F values for each value (the ones that equal MPF are TRUE)
dd[which(dd$mode == 'MPF'),] 
# the above is more complete, it shows all the data for rows with MPF

# next, we assign the above to a variable called just_mpf
just_mpf <- dd[which(dd$mode == 'MPF'),]
head(just_mpf) # check the data

# R challenge
# make a new data frame with large species only (let's define "large" as > 0.8 )
which(dd$size > 0.8) # this will tell you which rows have the large species
large.spp <- dd[which(dd$size > 0.8),] # this makes the new data frame
head(large.spp) # check the data, it worked!

# checking for NAs
head(dd) # we can see that there is an NA in row 2, column 2

# removing NAs
# one way to get only complete cases
cleaned_1 <- dd[complete.cases(dd),]
head(cleaned_1) # you can see the row 2 was removed

# another method
cleaned_2 <- na.omit(dd)
head(cleaned_2) # same effect as above

dd <- cleaned_1 # reassigned dd to only have complete cases

# renaming data frame entries and matching data objects
# using setdiff
setdiff(dd$species, tt$tip.label) # shows which species in dataset don't match the ones in the tree
# this returned 17 species that didn't match
# sometimes this happens because of mispellings
# here is one way to fix this
dd$species[which(dd$species == "Chaetodon_plebius")]<-"Chaetodon_plebeius"
# if we rerun setdiff only 16 species won't match this time

# matching rest of data to tree
del_from_data <- setdiff(dd$species, tt$tip.label)
match(del_from_data, rownames(dd)) # this will show the row numbers in dd that don't match in tt
# * this returned the values (all NA), instead of row numbers in slide

# create new variable dd.prunned
dd.prunned <- dd[-match(del_from_data, rownames(dd)),] # now let's check again for overlap
setdiff(dd.prunned$species, tt$tip.label) # this should return 0 (or NA) mismatches

# matching tree to data
# use setdiff again but switch the arguments
not.in.dd <- setdiff(tt$tip.label, dd.prunned$species)
length(not.in.dd) # will return a large number *this was different than example in slide
head(not.in.dd) # at least head matches

# now need to use drop.tip()
?drop.tip

# always assign short, very descriptive names to variables
# \n tells R that there is a new line

# Common control statements
# "for" commands
# whatever is inside the braces will be performed for each of the elements
# in the parantheses

# below is an example from slide show
for(ii in 1:5){
  cat("\nthe number is", ii)
}

# you can also loop over all items in a vector
notfish <- c("bat", "dolphin", "toad", "soldier")
for(animal in notfish){
  cat(animal, "fish\n", sep="")
}
# cat puts together whatever element is in our loop plus the word fish

for(animal in notfish){
  cat(animal, "fish", " are tasty\n", sep="")
}

# while statements - same general structures as "for" statements
# as long as the condition is true it keeps doing something
xx <- 1
while(xx < 5){
  xx <- xx+1;
  cat("value of xx", xx, "\n")
}
print(xx)

xx <- 1
while(xx < 5){
  xx <- xx+1;
  cat("value of xx", xx, "\n")
  if( xx == 3){
    break; }
  }
print(xx)

# "if" statements
# allow your code to diverge depending on conditions
# if(condition is true){do something}
for(ii in 1:6){
  if(ii %% 2){
    cat(ii, "is odd\n")
  }
  else{
    cat(ii, "is even\n")
  }
}

# a few more examples
xx <- 1
while(xx < 10){
  cat("value of xx", xx, "\n")
  xx <- xx+1;
  if(xx == 7){
    cat("lucky number", xx, "\n")}
  else
  {cat("not excited about the number", xx, "\n")
  }
}
print(xx)

# if you want the number 1 to be included, place xx <- xx+1; under else
xx <- 1
while(xx < 10){
  cat("value of xx", xx, "\n")
  if( xx == 7){
    cat("lucky number" , xx, "\n")}
  else
  {cat("not excited about the number", xx, "\n")}
   xx <- xx+1;
}
print(xx)
  
# Pseudocode
# plan out structure and flow of your program
# syntax is not important, think about VARIABLES AND CONTROL STRUCTURE
# can be translated across languages

# pseudocode example from slide
# script that prints a number and its square over a given range of integers and then
# sum all squares

# 1. set upper and lower range values
# 2. setsquaresum to 0
# 3. loop over the range and for each value print currentvalue and currentvalueˆ2 and
# add currentvalueˆ2 to squaresum
# print "here is the sum of it all"m squaresum

lower <- 1
upper <- 5
squaresum <- 0   

for(ii in lower:upper){
  cat(ii, ii^2, "\n")
  squaresum <- squaresum + ii^2
}
cat("the sum of it all is", squaresum)

# Functions
# self-contained bit of code that performs a task
# example from Alfaro's slide show
doubler <- function(num){
  doubled <- 2 * num
  cat("witness the awesome power of the doubler\n")
  cat("I changed", num, "to", doubled, "\n")
  cat("you're welcome!\n")
  return(doubled)
}
doubler(3)
doubler(8)

# another example
greeter <- function(name){
  cat("Hello,", name, "\n")
}
greeter("Bob")
greeter() # if you forget the name, you get an error message
# if you type the name of the function without parenthesis you get a description of the function

# let's try another function
reminder <- function(name){
  cat("Keep coding,", name, "\n")
  cat("Don't stop until you are done,", name, "\n")
  cat("It's worth the trouble,", name, "!\n")
}
reminder("Bruno")
