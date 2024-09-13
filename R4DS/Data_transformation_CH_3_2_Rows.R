library(dplyr)
library(tidyverse)

flights = nycflights13::flights

airlines = nycflights13::airlines

glimpse(flights)

glimpse(airlines)

"
The most important verbs that operate on rows of a dataset are filter(), 
which changes which rows are present without changing their order, and arrange(), 
which changes the order of the rows without changing which are present.

Both functions only affect the rows, and the columns are left unchanged.

We’ll also discuss distinct() which finds rows with unique values but unlike arrange() and filter() 
it can also optionally modify the columns.
"



# 3.2.1 filter() ----------------------------------------------------------


# filter() allows you to keep rows based on the values of the columns1. 
# The first argument is the data frame. 
# The second and subsequent arguments are the conditions that must be true to keep the row.


# All departures that are delay with more than 120 minutes

flights |> filter(dep_delay > 120) 

# Flights that departed on January 1

flights |> filter(month == 1 & day == 1)

# Flights that departed in January or February

flights |> filter(month == 1 | month == 2)

# A shorter way to select flights that departed in January or February

flights |> filter(month %in% c(1, 2))

# OBS to save results just like in all other programming lang remember to asign it.

jan1 <- flights |>  filter(month == 1 & day == 1)



# 3.2.2 Common mistakes ---------------------------------------------------


#flights |> filter(month = 1) # use of == instead of = This mean months is equal 1

# Another mistakes is you write “or” statements like you would in English:

flights |> filter(month == 1 | 2) # correct way is filter((month == 1) | (month ==2))


# 3.2.3 arrange() ---------------------------------------------------------


# arrange() changes the order of the rows based on the value of the columns.


flights |> arrange(year, month, day, dep_time)

# You can use desc() on a column inside of arrange() to re-order the data frame based on that column in descending (big-to-small) order.

flights |> arrange(desc(dep_delay))


# 3.2.4 distinct() --------------------------------------------------------


# distinct() finds all the unique rows in a dataset, so in a technical sense, it primarily operates on the rows.

flights |> distinct() # Remove duplicate rows, if any

# Find all unique origin and destination pairs
flights |> distinct(origin, dest)

# Alternatively, if you want to the keep other columns when filtering for unique rows, you can use the .keep_all = TRUE option.

flights |> distinct(origin, dest, .keep_all = TRUE)

# If you want to find the number of occurrences instead, you’re better off swapping distinct() for count(), and with the sort = TRUE 

flights |> count(origin, dest, sort = TRUE)



# 3.2.5 Exercises ---------------------------------------------------------


# 1. In a single pipeline for each condition, find all flights that meet the condition:
  
# Had an arrival delay of two or more hours
# Flew to Houston (IAH or HOU)
# Were operated by United, American, or Delta "can be found in the airlines data set"
# Departed in summer (July, August, and September)
# Arrived more than two hours late, but didn’t leave late
# Were delayed by at least an hour, but made up over 30 minutes in flight

# United = UA
# American = AA
# Delta =

#flights$dep_delay

flights |>
  filter(arr_delay >= 120) 

flights |>
  filter(dest == "IAH" | dest == "HOU")

flights |>
  filter(carrier == "UA" | carrier == "AA" | carrier == "DL")

flights |>
  filter(month %in% c(7, 8, 9))

flights |>
  filter(arr_delay > 120 & dep_delay <= 0)

flights |>
  filter(dep_delay >= 60 & dep_delay - arr_delay > 30)

  



