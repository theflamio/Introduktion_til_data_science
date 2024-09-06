"
Once you’ve made a plot, you might want to get it out of R by saving it as an image that you can use elsewhere. 
That’s the job of ggsave(), which will save the plot most recently created to disk:
"

library(tidyverse)
library(palmerpenguins)
library(ggthemes)
library(ggplot2)
library(forcats)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")


# 1.6.1 Exercises  --------------------------------------------------------

 
# 1. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why?

ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")

# Answer: Since the second plot (geom_point()) is the last plot generated, it is the one that gets saved when ggsave() is called.