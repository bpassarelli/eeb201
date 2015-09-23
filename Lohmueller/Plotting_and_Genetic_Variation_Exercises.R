# Bruno Passarelli
# 23 September 2015
# this script has the plotting and genetic variation data analyzes exercises - Lohmueller

rm(list=ls())

setwd("/Users/bpassarelli/Documents/Bruno/UCLA/Fall 2015/EEB201/eeb201/Lohmueller")
getwd()

library(ape)
library(geiger)
library(ggplot2)

# Exercise 1A
# Load a data set
snpsDataFrame=read.table('/Users/bpassarelli/Documents/Bruno/UCLA/Fall 2015/EEB201/eeb201/Lohmueller/Data_Lohmueller/hapmap_CEU_r23a_chr2_ld-1.txt',header=TRUE)
head(snpsDataFrame)

# Convert the dataframe to a matrix
snps=as.matrix(snpsDataFrame)

## APPYLING A CHI-SQUARE TEST TO EACH SNP TO FORMALLY LOOK FOR DEPARTURES FROM HARDY-WEINBERG EXPECTATIONS ###

compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}

# perform chi-square test on all snps
chisq=apply(snps,1,compute_chisquare)

# check first few values 
head(chisq)

# Compute p-values for each chi-square value using the pchisq function
pvals=pchisq(chisq,1,lower.tail=FALSE)

# check the first few values
head(pvals)

# Exercise 1B
# Count the number of pvals smaller than the significance threshold
signifthres<-0.05 # this sets the significance threshold 
mean(pvals<signifthres) 
mean(pvals<signifthres)*100 # you can do this to get an actual % of pvals smaller that tje sig. threshold

signifthres<-0.01 # this sets the significance threshold 
mean(pvals<signifthres) 

signifthres<-0.001 # this sets the significance threshold
mean(pvals<signifthres) # still found a small percentage here!

# Exercise 1C
length(pvals) # check how many p-values are returned
num_pval <- length(pvals) # saves the number of p-values as the variable "num-pval"

# Exercise 1D
exp_pvals <- (1:num_pval)/num_pval # create a vector with the expected p-values
head(exp_pvals) # checking the expected p-values
length(exp_pvals) # double-checking to see if they match length of pvals

# Exercise 1E
sort_pvals <- sort(pvals) # this sorts values from smallest to greatest (default)
head(sort_pvals)

# Exercise 1F
log_sort_pvals <- -(log10(sort_pvals))
log_exp_pvals <- -(log10(exp_pvals))
head(log_sort_pvals)
head(log_exp_pvals)

# Exercise 1G
plot(log_exp_pvals, log_sort_pvals, xlab="-log10(expected p-values)", ylab="-log10(observed p-values)", pch = 19, cex = .5)
# pch = 19 sets the symbols in the scatter plot as a closed circle
# cex changes the size of the symbol

# Exercise 1H
# add diagonal line
lines(log_exp_pvals, log_exp_pvals, type = "l", col = "red", lwd = 2)
# this creates a line of the expected p-values for the Hardy-Weinberg model, this will provide
# a quick visual reference of how well the data fit the model

# Exercise 1I
save and export the plot to repository

#######################################

# Exercise 2 - Testing allele frequency

# Exercise 2A
# set up, load the file that you will use
# Read in phenotype data file
# make that you use "header=T" (or "TRUE") in the read.table command
zz <- read.table('/Users/bpassarelli/Documents/Bruno/UCLA/Fall 2015/EEB201/eeb201/Lohmueller/Data_Lohmueller/pheno.sim.2014-1.txt', header=TRUE)
head(zz)

#####

# Exercise 2B
# find the value of the phenotype such that 25% of individuals have a phenotype below this value
pheno25percentbelow <- quantile(zz[,2],0.25) # this returned a value of 4.768
print(pheno25percentbelow)

# extract row number of individuals fulfilling this criterion
# store row numbers in a vector called "controls"
controls <- which(zz[,2]<pheno25percentbelow)
print(controls)

#####

# Exercise 2C
# find the value of the phenotype such that 25% of individuals have a phenotype greater than this value
pheno25percentabove <- quantile(zz[,2],0.75) # this returned a value of 7.355
print(pheno25percentabove)

# extract row number of individuals fulfilling this criterion
# store row numbers in a vector called "controls"
cases <- which(zz[,2]>pheno25percentabove) # make sure that the sign is switched (">" instead of "<")
print(cases)

#####

# Exercise 2D
# Make a density plot of the distribution of the phenotypes
plot(density(zz[,2]),col=4, lwd=4, xlab="Glucose level", main="Phenotype distribution")

# Add vertical lines to the plot to denote the 25% and 75% tails of the distribution
abline(v=quantile(zz[,2],0.25), lty=2,lwd=3,col=2)
abline(v=quantile(zz[,2],0.75), lty=2,lwd=3,col=2)

#####

# Exercise 2E
# extract the case genotypes from the “snpsDataFrame”forSNP “rs7584086_T"
# store these genotypes in the vector “case_genotypes”
case_genotypes <- snps["rs7584086_T",cases] # must assign the column for "cases", indiv. with top 25%
head(case_genotypes)
length(case_genotypes)

#####

# Exercise 2F
# extract the control genotypes from the “snpsDataFrame” for “rs7584086_T" 
# store these genotypes in the vector “control_genotypes”
control_genotypes <- snps["rs7584086_T",controls]
head(control_genotypes)
length(control_genotypes)

#####

# Exercise 2G
# For the SNPrs7584086_T", find the number of case individuals who have each genotype (0, 1, and 2)
# Hint: use the “table” function
table(case_genotypes)
# 12 individuals with genotype 1
# 3 individuals with genotype 2

# Exercise 2H
# For the SNPrs7584086_T", find the number of control individuals who have each genotype (0, 1, and 2)
# Hint: use the “table” function
table(control_genotypes)
# 14 individuals with genotype 0 (1 individual is missing, there is a total of 15)
print(control_genotypes)
# checking the control genotypes shows that "Indiv16" has a "NA" value for genotype