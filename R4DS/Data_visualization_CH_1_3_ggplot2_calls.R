"
As we move on from these introductory sections, 
we’ll transition to a more concise expression of ggplot2 code. 
So far we’ve been very explicit, which is helpful when you are learning:
"

library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()

# could written like this aswell 

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()

# In the future, you’ll also learn about the pipe, |>, which will allow you to create that plot with: "used in chapter 3"

penguins |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point()
´


