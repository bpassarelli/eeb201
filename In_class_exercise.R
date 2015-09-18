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

# always assign short, very descriptive names to variables
# \n tells R that there is a new line

# Common control statements
# "For" commands
# whatever is inside the braces will be performed for each of the elements
# in the parantheses
notfish <- c("bat", "dolphin", "toad", "soldier")
for(animal in notfish){
  cat(animal, "fish\n", sep="")
}
# cat puts together whatever element is in our loop plus the word fish

for(animal in notfish)
  {cat(animal, "fish", " are tasty\n", sep="")}

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

# "If" statements
xx <- 1
while(xx < 10){
  cat("value of xx", xx, "\n")
  xx <- xx+1;
  if( xx == 7){
    cat("lucky number" , xx, "\n")}
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
  
  
   

