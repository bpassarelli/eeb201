# Bruno Passarelli
# 17 September 2015
# this script is for Lohmueller's in class exercises

rm(list=ls())

setwd("/Users/bpassarelli/Documents/Bruno/UCLA/Fall 2015/EEB201/eeb201/Lohmueller")
getwd()

library(ape)
library(geiger)
library(ggplot2)

# Histogram with two data sets in one plot
s1<-rnorm(1000,mean=0,sd=1)
s3<-rnorm(1000,mean=0,sd=3)

# check the data
head(s1)
head(s3)

# plot histograms of both in the same panel and save it to a file
# create the pdf file
pdf(file="Normal_hist.pdf", width=4, height=7);

# open the file

par(mfrow= c(2,1), mar=c(4, 4, 3, 2)) # this sets the plotting area and margins

hist(s1,col=2,xlab="Value",main="Sigma1") # makes first histogram

hist(s3,col=4,xlab="Value",main="Sigma3") # makes second histogram

dev.off() # shuts off current output device
quartz
    2

# let's get a little fancier
# plot histograms of both on same panel and save to a file
pdf(file="Normal_hist_fancy.pdf",width=4,height=7);

# open the file

par(mfrow=c(2,1), mar=c(4, 4, 3, 2)) # sets plotting area and margins

hist(s1,col=2,xlab="Value",main=expression(paste(sigma,"=1")))
# the above was used to make the first hist

hist(s3,col=4,xlab="Value",main=expression(paste(sigma,"=3")))
# the above was used to make the second hist

dev.off()
pdf
  2

# make a smooth density plot
pdf(file="Normal_density.pdf", width=6,height=6) # this opens the file

par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) # set plotting area and margins

plot(density(s1),col=2,lwd=4,xlab="Value",xlim=c(-15,15),main="Normal distribution")

lines(density(s3),col=4,lwd=4) # add the SD=3 values

legend(-15,0.4,c("sigma=1","sigma=3"),lwd=4,col=c(2,4),cex=1.5)
# put a legend on
# we can highlight the upper 10% of each distribution with a vertical line:
abline(v=quantile(s1,0.9),lty=2,lwd=3,col=2) #puts a vertical line onto the plot for s1
abline(v=quantile(s3,0.9),lty=2,lwd=3,col=4) #puts a vertical line onto the plot for s3
dev.off()
quartz
     2

# more on "quantile"
# quantile take a vector of stuff, and returns the value q such that p%
# of your distribution is less than q

# for example, find the 75th percentile of the standard normal distribution:
quantile(s1,0.75)

# quantile with just a vector gives some interesting stuff
quantile(s1)

# Boxplot
# boxplot:
pdf(file="Normal_boxplot.pdf", width=6,height=6); # open the file

par(mfrow=c(1,1),mar=c(4, 4, 3, 2)) # sets plotting area and margins

boxplot(cbind(s1,s3),names=c("Sigma=1","Sigma=3"), main="Draws from a normal distribution",col=c(2,4))

dev.off()
quartz
     2

# Histogram with both sets of data on same axes
# let's make a histogram of these values, but putting both on the same axes
# But, we need to have the same bin widths for both data sets

bins <- seq(-11, 11, by=1)
hist(s1, breaks = bins)$breaks

bins <- seq(-11, 11, by=1) # there is a value of s3 < -10 so had to increase range
hist(s3, breaks = bins)$breaks

counts_s1 <- hist(s1, breaks = bins)$counts
counts_s3 <- hist(s3, breaks = bins)$counts

# now for the plot
pdf(file="Normal_barplot.pdf",width=6,height=6) # open the file

par(mfrow=c(1,1), mar=c(3, 3, 3, 4)) # sets plotting area and margins

# now create the plot using barplot
barplot(rbind(counts_s1,counts_s3),col=c(2,4),beside=T,names.arg=seq(-11,10.5,by=1),xlab="Value",ylab="Count")

legend(6,340,c(expression(paste(sigma,"=3")),expression(paste(sigma,"=6"))),col=c(2,4),lwd=4)

dev.off()
pdf
  2

# Finding extreme values
# we can find the % values in s1 that are >3:
mean(s1>3) # only one of the 1000 values in s1 is >3
mean(s3>3) # 15.2% of the values in s3 are >3

