# Programming exercise
library(doBy)
library(tidyverse)
library(broom)

dat <- doBy::income

print(dat)

# Task 1 Inspired by the work above, create a function, write a function that converts income in USD to DKK (exchange rate:
# 1 USD = 7 DKK), and converts years of education to months of education. ------------------------------------------------------------------
datTransformed <- dat |> mutate(inc = inc  * 7)
datTransformed <- datTransformed |> mutate(educ = educ * 12)

print(head(datTransformed))


# Task 2 What is the correlation between income and years of education before and after the transformation? ------------------------------------------------------------------
cor(dat$inc, dat$educ)

cor(datTransformed$inc, datTransformed$educ)

# same

# Task 3 Fit a linear regression model to predict income from years of education before and after the transformation. Compare
# the coefficients. ------------------------------------------------------------------

# after school !
