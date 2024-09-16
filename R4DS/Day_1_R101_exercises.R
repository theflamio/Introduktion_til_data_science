# Day 1 - R intro exercises


v1 <- c(1, -5, 3, -7, 12, -9)
v2 <- c(30, 50, 10)


# A: Simple arithmetic ----------------------------------------------------

v1 + 10

v1 * 10

v2 + v1 # adds the 3 element vector v2 twich on the 6 element vector V1

# B: Vector operations ----------------------------------------------------

v1[c(2,5)] # only element 2 and 5

v1[-c(2,5)] # all except 2 and 5

ww <- v1 >= 3

print(ww)

v12 <- c(v1, v2) # combine two vectors

v12

?any()

any(v12 > 2 | v12 < 4)

sum(v12 < 0)

# Generate the vector g
g <- c(rep('weak', 3), rep('strong', 2))

# Print the result
print(g)

# C: Basic statistics -----------------------------------------------------

# Run the following commands:
  set.seed(1234)
x <- round(runif(100, 0, 10))
y <- round(runif(100, 0, 10))

min(x)

max(x)

range(x)

sum(x)

mean(x) #  Find the mean of all the elements in x. (Does it seem reasonable?)

sd(x) #  Find the standard deviation of all the elements in x. (Does it seem reasonable?)




