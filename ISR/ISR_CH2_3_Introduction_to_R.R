### Vectors, data, matrices, subsetting


### ISL 2.3.1 Basic commands 
x = c(2, 7, 5)
x

y=seq(from=4,length=3,by=3)
# ask for help for a function use ?
?seq
x+y
x*y
x/y
x^y
x[2]
x[2:3]
# remove element 2 from the matrix
x[-2]
# create a 4 by 3 matrix with the numbers 1 - 12
z=matrix(seq(1,12),4,3)
z

# see the dimension of a matrix
dim(z)

# type ls() shows you what is available in your working directory
ls()

### ISL 2.3.2 Graphics
x=runif(50)
y=rnorm(50)
plot(x,y)

par(mfrow=c(2,1))
plot(x,y)
hist(y)
