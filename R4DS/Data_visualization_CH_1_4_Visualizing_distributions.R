"
How you visualize the distribution of a variable depends on the type of variable: categorical or numerical.
"

library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)
library(forcats)


# 1.4.1 A categorical variable --------------------------------------------


# A variable is categorical if it can only take one of a small set of values. 

ggplot(penguins, aes(x = species)) +
  geom_bar()

"
In bar plots of categorical variables with non-ordered levels, 
like the penguin species above, 
it’s often preferable to reorder the bars based on their frequencies.
"

# fct_inorder(): by the order in which they first appear.

# fct_infreq(): by number of observations with each level (largest first)

# fct_inseq(): by numeric value of level.

ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()


# 1.4.2 A numerical variable ----------------------------------------------


"
A variable is numerical (or quantitative) if it can take on a wide range of numerical values, 
and it is sensible to add, subtract, or take averages with those values. 
Numerical variables can be continuous or discrete.
"

ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)


# An alternative visualization for distributions of numerical variables is a density plot.

ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()
#> Warning: Removed 2 rows containing non-finite outside the scale range
#> (`stat_density()`).


# 1.4.3 Exercises ---------------------------------------------------------


# 1 Make a bar plot of species of penguins, where you assign species to the y aesthetic. How is this plot different?

ggplot(penguins, aes(y = species)) +
  geom_bar()

# Answer: it tilts it side ways and is harder to read compared to the first example.

# 2 How are the following two plots different? 
#   Which aesthetic, color or fill, is more useful for changing the color of bars?

ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

# Answer: gives a red line around the bar

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

# Answer: fills the bar with the color red

# 3 What does the bins argument in geom_histogram() do?

# Answer the bins argument desides how "big" each bin is " be wise to chose the correct size"

# 4 Make a histogram of the carat variable in the diamonds dataset 
#   that is available when you load the tidyverse package. 
#   Experiment with different binwidths. What binwidth reveals the most interesting patterns?

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.3)

# around 0.3 gives a nice histogram were it is possible to read x amount of diamons with a given carat.
