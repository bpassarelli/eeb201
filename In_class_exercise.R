# Bruno Passarelli 
# 16 September 2015
# eeb201

# trying in class exercise

# when using help, you can copy examples to the script and send it to console to see 
# how a certain function works

source("source.example.R")
source
all.I.know.about.life.I.learned.in.grad.school()

library(ape)

# reaad in tree
tt <- read.tree("tree.tre")
tt
head(tt$tiplabel)

# read in data
# header indicates that there is a header line in the data TRUE or T works
dd <- read.table("data.txt", header = T, as.is = T, sep = "\t")
attributes(dd)
head(dd)
dim(dd)
dim(dd)[1]
dflength <- dim(dd)[1]
dflength
dim(dd)[2]
runif(1) # generates random uniform
# generate some random size data
size <- runif(dflength)
size

# use cbind to add this column to the data
head(cbind(dd, size))

# make a new variable and give it a name
newdd <- cbind(dd, size)

# if you want to overwrite it
dd <- cbind(dd, size)

# to access the species column
head(dd$species)
head(dd$size)

# look at specific parts of the data frame
dd[1,]
dd[,1]
dd[1:10,]

# this does queries with your data
# this one is telling you to look at the mode column and find MPF values
which(dd$mode == 'MPF')

# two equal signs (==) is asking if two things are equal
dd$mode == "MPF"
# this returns T or F values for each value (the ones that equal MPF are TRUE)
dd[which(dd$mode == 'MPF'),]

dd[1:10,2] # rows 1-10, column 2
dd[,1] # all rows, column 1
dd[,2] # all rows, column 2

just_mpf <- dd[which(dd$mode == 'MPF'),]
head(just_mpf)

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
  
  
   

