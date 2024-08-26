### Chapter 3 Data transform using the dplyr, ggplot2 and nycflights14

library(dplyr)
library(tidyverse)

flights = nycflights13::flights

#show all columns of flights
glimpse(flights) #shows variable types and column names

# Pipes |> etc f(x,y) = x |> f(y)

flights |>
  filter(dest == "IAH") |>
  group_by(year,month,day) |>
  summarize(arr_delay = mean(arr_delay, na.rm = TRUE))
