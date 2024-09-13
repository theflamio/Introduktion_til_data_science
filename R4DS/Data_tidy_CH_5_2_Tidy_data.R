library(tidyverse)
library(dplyr)



# 5.2.1 Exercisis ---------------------------------------------------------

table1

table2

table3

# 1: For each of the sample tables, describe what each observation and each column represents.

# table1 country year cases population

# table2 country year type count

# table3 country year rate

# 2: Sketch out the process you’d use to calculate the rate for table2 and table3. You will need to perform four operations:

# first I need to Tidy both table2 and 3. !!!

#   a: Extract the number of TB cases per country per year.
#   b: Extract the matching population per country per year.

tidyTable2 <- table2 |> 
  pivot_wider(
    names_from = type,
    values_from = count
  )

tidyTable3 <- table3 |> 
  separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE)

#   c: Divide cases by population, and multiply by 10000.

rateTable2 <-tidyTable2 |> 
  # Extract the rate from table2
  mutate(rate = cases/population * 10000)

rateTable3 <- tidyTable3 |> 
  # Extract the rate from table3
  mutate(rate = cases/population * 10000)

#   d: Store back in the appropriate place.

rateTable2
rateTable3


# You haven’t yet learned all the functions you’d need to actually perform these operations, 
# but you should still be able to think through the transformations you’d need.
