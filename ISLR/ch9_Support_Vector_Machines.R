# Lab: Support Vector Machines


## Support Vector Classifier


# Linear SVM classifier
###
# Lets generate some data in two dimensions, and make them a little separated.

set.seed(10111)
x <- matrix(rnorm(20 * 2), ncol = 2)
y=rep(c(-1,1),c(10,10))
x[y==1,]=x[y==1,]+1
plot(x,col = y+3,pch = 19)

# Now we will load the package 'e1071' which contains the svm function.
# We compute the fit. Notice that we have to specify a 'cost' parameter, which is a tuning parameter.

library(e1071)
dat=data.frame(x,y=as.factor(y))
svmfit=svm(y~.,data = dat,kernel = "linear",cost = 10, scale = FALSE)
print(svmfit)
plot(svmfit,dat)


# Non linear SVM

###
# Instaed we will run the SVM on some data where a non-linear boundary is called for.
# We will use the mixture data from ESL

