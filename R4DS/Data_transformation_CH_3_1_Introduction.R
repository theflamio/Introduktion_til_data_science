### Chapter 3 Data transform using the dplyr, ggplot2 and nycflights14

# The goal of this chapter is to give you an overview of all the key tools for transforming a data frame.

library(dplyr)
library(tidyverse)

flights = nycflights13::flights

#show all columns of flights
glimpse(flights) #shows variable types and column names

# 3.1.3 dplyr basic

# 1. The first argument is always a data frame.

# 2. The subsequent arguments typically describe which columns to operate on, using the variable names (without quotes).

# 3. The output is always a new data frame.

# Pipes |> etc f(x,y) = x |> f(y)

flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

