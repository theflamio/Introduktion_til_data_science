library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)
library(forcats)

"
1.5.1 A numerical and a categorical variable

To visualize a relationship we need to have at least two variables mapped to aesthetics of a plot. 
In the following sections you will learn about commonly used plots for visualizing relationships 
between two or more variables and the geoms used for creating them.
"

"
A box that indicates the range of the middle half of the data, 
a distance known as the interquartile range (IQR), stretching from the 25th percentile of the distribution to the 75th percentile. In the middle of the box is a line that displays the median, i.e. 50th percentile, of the distribution. These three lines give you a sense of the spread of the distribution and whether or not the distribution is symmetric about the median or skewed to one side.

Visual points that display observations that fall more than 1.5 times the IQR from either edge of the box. 
These outlying points are unusual so are plotted individually.

A line (or whisker) that extends from each end of the box 
and goes to the farthest non-outlier point in the distribution.
"

ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

# Alternatively, we can make density plots with geom_density().

ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75)

"
Additionally, we can map species to both color and fill aesthetics 
and use the alpha aesthetic to add transparency to the filled density curves.
"

ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)


# 1.5.2 Two categorical variables

# example island and species is categorical variables

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

# The second plot, a relative frequency plot created by setting position = "fill" in the geom, 
# is more useful for comparing species distributions across islands since it’s not affected by the unequal 
# numbers of penguins across the islands.

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")+
  labs(title = "comparing species distributions across islands")

# 1.5.3 Two numerical variables

# A scatterplot is probably the most commonly used plot for visualizing the relationship between two numerical variables.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# 1.5.4 Three or more variables

# we can incorporate more variables into a plot by mapping them to additional aesthetics.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

# However adding too many aesthetic mappings to a plot makes it cluttered and difficult to make sense of. 
# Another way, which is particularly useful for categorical variables, is to split your plot into facets, 
# subplots that each display one subset of the data.

# facet_wrap splits the plot by the input data into subplots. in this exampe it is on islands.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

# 1.5.5 Exercises



