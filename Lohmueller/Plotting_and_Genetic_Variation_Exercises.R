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

# check fist few values
head(chisq)

# Compute p-values for each chi-square value using the pchisq function
pvals=pchisq(chisq,1,lower.tail=FALSE)

# check the first few values
head(pvals)
