# Bruno Passarelli
# 17 September 2015
# this script is for Lohmueller's in class exercises

# Histogram with two data sets in one plot
s1<-rnorm(1000,mean=0,sd=1)
s3<-rnorm(1000,mean=0,sd=1)

# check the data
head(s1)
head(s3)

# create the pdf file
pdf(file="normal_barplot.pdf", width=6, height=6)

# determine the breaks
bins<-seq(-10,10,by=1)
hist(s1,breaks=bins)$breaks
hist(s3,breaks=bins)$breaks

dev.off()

# we can get the counts for each bin
counts_s1<-hist(s1,breaks=bins)$counts
counts_s3<-hist(s3,breaks=bins)$counts

# set plot are and margins
par(mfrow=c(1,1), mar=c(4, 4, 3, 2))

# now create the plot using barplot
barplot(rbind(counts_s1,counts_s3),col=c(2,4),beside=T, 
names.arg=seq(-10,9.5,by=1),xlab="Value",ylab="Count")

dev.off()


