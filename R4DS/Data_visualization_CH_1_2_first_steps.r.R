### Data Visualization

library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)

penguins = palmerpenguins::penguins

"
For an alternative view, where you can see all variables 
And the first few observations of each variable, use glimpse()
"

glimpse(penguins)

ggplot( data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species, shape = species)) + #Each geom function in ggplot2 can also take a mapping argument
  geom_smooth(method = "lm") +  #we will specify that we want to draw the line of best fit based on a linear model with method = "lm"
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind()




# 1.2.5 Exercises ---------------------------------------------------------


# 1. How many rows are in penguins? How many columns?
glimpse(penguins)

# Answer 344 rows and 8 columns



# 2. What does the bill_depth_mm variable in the penguins data frame describe? Read the help for ?penguins to find out.

?penguins

# Answer a number denoting bill depth (millimeters)



# 3. Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
#    That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
#    Describe the relationship between these two variables.

ggplot( data = penguins,
        mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point(mapping = aes(color = species, shape = species))

# Answer bill length and bill depth shows a grouping in the species.



# 4. What happens if you make a scatterplot of species vs. bill_depth_mm? What might be a better choice of geom?

ggplot( data = penguins,
        mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_point(mapping = aes(color = species, shape = species))

# Answer Not really because bill_depth_mm of the Adelie and Chinstrap are very alike compared to previous plot.



# 5. Why does the following give an error and how would you fix it?

#ggplot(data = penguins) + 
#  geom_point()

# Answer missing x and y arguments



# 6. What does the na.rm argument do in geom_point()? What is the default value of the argument? 
#    Create a scatterplot where you successfully use this argument set to TRUE.

# Answer na.rm removing missing values from data



# 7.Add the following caption to the plot you made in the previous exercise: 
#   “Data come from the palmerpenguins package.” Hint: Take a look at the documentation for labs().

ggplot( data = penguins,
        mapping = aes(x = species, y = bill_depth_mm)
) +
  geom_point(mapping = aes(color = species, shape = species)) +
  labs(caption = "(Data come from the palmerpenguins package.)") +
  scale_color_colorblind()

# 8. Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? 
# And should it be mapped at the global level or at the geom level?

# Answer aesthetic bill_depth_mm should be mapped to geom_smooth
# Answer at the geom level

ggplot( data = penguins,
        mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth()


# 9. Run this code in your head and predict what the output will look like. 
# Then, run the code in R and check your predictions.

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# Answer geom_smooth(se = FALSE) = Display confidence interval around smooth? (TRUE by default, see level to control.) 
# Answer color = island shows the color of each of the island's compare the body_mass_G an flipper_length_mm

# 10. Will these two graphs look different? Why/why not?

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

# Answer they use the same global level data from the first in both geom levels