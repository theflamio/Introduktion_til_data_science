library(dplyr)
library(tidyverse)

flights = nycflights13::flights

airlines = nycflights13::airlines



# 3.3.5 Exercises ---------------------------------------------------------


# 1: Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?

# Answer: sched_dep_time as baseline then dep_time as the real department time.
#         dep_delay the time delayed from the schedule department time.
  
# 2: Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.

# 1 using select() from dplyr
flights |> 
  select(dep_time, dep_delay, arr_time, arr_delay)

# 2 using select() with column indices
flights |> 
  select(4, 6, 7, 9) 

# 3 using Base R with Column Names:
flights[, c("dep_time", "dep_delay", "arr_time", "arr_delay")]

# 4 using Base R with column indices
flights[, c(4, 6, 7, 9)]  # Replace with actual column indices


# 3: What happens if you specify the name of the same variable multiple times in a select() call?
flights |> 
  select(dep_time, dep_time)

# Answer: returns only 1 instance of that name since we "selected it"
  
# 4: What does the any_of() function do? Why might it be helpful in conjunction with this vector?

  
variables <- c("year", "month", "day", "dep_delay", "arr_delay")

# Example of using any_of() with select()
selected_data <- flights |> 
  select(any_of(variables))

# Display the selected data
head(selected_data)

# Answer: This function is particularly useful because it allows you to select columns that exist in the data frame 
# without causing errors if some of the column names in the vector do not exist in the data frame.


# 5: Does the result of running the following code surprise you? How do the select helpers deal with upper and lower case by default? How can you change that default?
  
flights |> 
  select(contains("TIME"))

# No we ask if flights contains the string "TIME" which most of the column names "observation names" dose 


# 6: Rename air_time to air_time_min to indicate units of measurement and move it to the beginning of the data frame.

# Rename air_time to air_time_min and move it to the beginning of the DataFrame
flights |>
  rename(air_time_min = air_time) |> 
  relocate(air_time_min, .before = year)

 
# 7: Why doesn’t the following work, and what does the error mean?

#   flights |> 
#   select(tailnum) |> 
#   arrange(arr_delay)
# #> Error in `arrange()`:
# #> ℹ In argument: `..1 = arr_delay`.
# #> Caused by error:
# #> ! object 'arr_delay' not found

# Answer: we only selected tailnum from the data set so we don't know tailnum

# fixed version down below

flights |> 
    select(tailnum, arr_delay) |>
    arrange(arr_delay)