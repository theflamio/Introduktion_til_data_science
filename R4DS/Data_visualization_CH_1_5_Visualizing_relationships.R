library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)
library(forcats)


# 1.5.1 A numerical and a categorical variable ----------------------------

"
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


# 1.5.2 Two categorical variables -----------------------------------------

# example island and species is categorical variables

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

# The second plot, a relative frequency plot created by setting position = "fill" in the geom, 
# is more useful for comparing species distributions across islands since it’s not affected by the unequal 
# numbers of penguins across the islands.

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")+
  labs(title = "comparing species distributions across islands")


# 1.5.3 Two numerical variables -------------------------------------------


# A scatterplot is probably the most commonly used plot for visualizing the relationship between two numerical variables.

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()


# 1.5.4 Three or more variables -------------------------------------------


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

# 1.5.5 Exercises ---------------------------------------------------------


# 1. The mpg data frame that is bundled with the ggplot2 package contains 234 observations 
# collected by the US Environmental Protection Agency on 38 car models. 
# Which variables in mpg are categorical? Which variables are numerical? 
# (Hint: Type ?mpg to read the documentation for the dataset.) How can you see this information when you run mpg?

??mpg

# Categprical:  manufacturer,  model, year, trans,  drv, fl, class

 
# Numerical:  displ,  cyl,  cty, hwy


# 2. Make a scatterplot of hwy vs. displ using the mpg data frame. 
# Next, map a third, numerical variable to color, then size, then both color and size, then shape. 
# How do these aesthetics behave differently for categorical vs. numerical variables?

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ", x = "Displacement", y = "Highway Mileage")

ggplot(mpg, aes(x = displ, y = hwy, color = cty)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ and cty as color", x = "Displacement", y = "Highway Mileage")

ggplot(mpg, aes(x = displ, y = hwy, size = cty)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ and cty as size", x = "Displacement", y = "Highway Mileage")

ggplot(mpg, aes(x = displ, y = hwy, color = displ, size = displ)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ and cty as size and color", x = "Displacement", y = "Highway Mileage")

ggplot(mpg, aes(x = displ, y = hwy, shape = displ)) + #Error can't use numerical for shape
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ and cty as shaper", x = "Displacement", y = "Highway Mileage")

# Answer: 
"
1: Color:

Numerical Variable: Creates a gradient scale, allowing you to see variations smoothly across a spectrum (e.g., higher values in darker shades).
Categorical Variable: Uses distinct colors for each category, making it easy to differentiate groups.

2: Size:
  
Numerical Variable: Represents data points with varying sizes proportional to the values, effectively showing the magnitude of the data.
Categorical Variable: Not commonly used because size is inherently quantitative and does not represent categories well.

3: Shape:
  
Numerical Variable: Not suitable because shapes are discrete and can’t represent continuous variation effectively.
Categorical Variable: Uses different shapes for each category, making it useful for distinguishing groups without implying order.

4: Combining Color and Size:
  
  Works best with numerical data to display multi-dimensional relationships, but can become confusing with categorical data if too many distinct categories exist.
"

# 3. In the scatterplot of hwy vs. displ, what happens if you map a third variable to linewidth?

ggplot(mpg, aes(x = displ, y = hwy, linewidth = 10)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ", x = "Displacement", y = "Highway Mileage")

# Answer: nothing since there is no line to edit.


# 4. What happens if you map the same variable to multiple aesthetics?

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  labs(title = "Scatterplot of hwy vs. displ", x = "Displacement", y = "Highway Mileage")

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(y = hwy)) +
  labs(title = "Scatterplot of hwy vs. displ", x = "Displacement", y = "Highway Mileage")

# Answer: nothing.


# 5. Make a scatterplot of bill_depth_mm vs. bill_length_mm and color the points by species. 
# What does adding coloring by species reveal about the relationship between these two variables? 
# What about faceting by species?,

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  labs(title = "Scatterplot of bill_depth_mm vs. bill_length_mm", x = "bill_length_mm", y = "bill_depth_mm")

# Answer: we see a grouping of species that are related to that of bill depth and length

# 6. Why does the following yield two separate legends? How would you fix it to combine the two legends?

ggplot(penguins,aes(x = bill_length_mm, y = bill_depth_mm,color = species, shape = species)) +
  geom_point() +
  labs(color = "Species")

# Answer: ggplot treats each aesthetic mapping independently unless explicitly told to combine them.

ggplot(penguins,aes(x = bill_length_mm, y = bill_depth_mm,color = species, shape = species)) +
  geom_point() +
  labs(color = "Species", shape = "Species") +
  guides(color = guide_legend("Species"), shape = guide_legend("Species"))

# Answer:
# 
# 1. labs() Adjustment: Both color and shape are given the same label ("Species") in the labs() function to ensure consistency.
# guides() Function: This function is used to explicitly control the appearance of the legends. 
# By setting both color and shape guides to guide_legend("Species"), 
# ggplot2 is instructed to combine them into a single legend labeled "Species".

# 7. Create the two following stacked bar plots. 
# Which question can you answer with the first one? 
# Which question can you answer with the second one?

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")

# Answer: the question about the distribution of penguin species on each island.

ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")

# Answer: the question about the distribution of islands within each penguin species.
