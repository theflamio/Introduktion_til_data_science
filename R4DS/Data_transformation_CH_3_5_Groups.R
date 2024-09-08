library(dplyr)
library(tidyverse)
library(ggplot2)

flights = nycflights13::flights

airlines = nycflights13::airlines



# 3.5.7 Exercises Groups --------------------------------------------------


# Which carrier has the worst average delays? Challenge: can you disentangle the effects of bad airports vs. bad carriers? Why/why not? (Hint: think about flights |> group_by(carrier, dest) |> summarize(n()))
flights |> 
  group_by(carrier, dest) |> 
  summarize(count = n(), .groups = "drop") |> 
  arrange(desc(count))

# Find the flights that are most delayed upon departure from each destination.
flights |> 
  group_by(dest) |> 
  slice_max(dep_delay , n = 1) |> 
  arrange(desc(dep_delay))

# How do delays vary over the course of the day? Illustrate your answer with a plot.

# Prepare the data
delays_by_hour <- flights |> 
  # Extract the hour from the departure time
  mutate(dep_hour = floor(dep_time / 100)) |> 
  # Group by the hour of departure
  group_by(dep_hour) |> 
  # Calculate the average departure delay for each hour
  summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) |> 
  # Arrange by hour
  arrange(dep_hour)

head(delays_by_hour)
  
# Create the plot
ggplot(delays_by_hour, aes(x = dep_hour, y = avg_dep_delay)) +
  geom_line() + # Line plot to show trends
  geom_point() + # Points to highlight individual data points
  labs(
    title = "Average Departure Delay by Hour of the Day",
    x = "Hour of the Day",
    y = "Average Departure Delay (minutes)"
  ) +
  scale_x_continuous(limits = c(0, 24), breaks = seq(0, 24, 1)) + # Set x-axis limits and breaks
  theme_minimal()

# What happens if you supply a negative n to slice_min() and friends?

# Sample data frame
df <- tibble(
  x = c(10, 20, 30, 40, 50)
)

# Using slice_min() with positive n
df |> 
  slice_min(order_by = x, n = 2)
# Selects the 2 smallest values: 10 and 20

# Using slice_min() with negative n
df |> 
  slice_min(order_by = x, n = -2)
# Selects the 2 largest values: 40 and 50


# Explain what count() does in terms of the dplyr verbs you just learned. What does the sort argument to count() do?

# Sample data frame
df <- tibble(
  category = c("A", "B", "A", "A", "B", "C"),
  value = c(10, 20, 10, 30, 20, 30)
)

df |> 
  count(category)

df |> 
  count(category, sort = FALSE)


# Answer: The count() function in dplyr is a convenient way to tally occurrences of values within a data frame and then optionally sort those counts.

# Answer; Explanation of sort

# sort = TRUE: Orders the output so that the most frequent categories appear at the top. 
#        This is useful for quickly identifying the most common groups.


# sort = FALSE: Maintains the original order of categories as they appear in the data. 
#        This might be useful if the order of categories is meaningful or if you prefer not to sort the data.
