# 2.5 Exercises

# 1. Why does this code not work?

my_variable <- 10
my_varıable
#> Error in eval(expr, envir, enclos): object 'my_varıable' not founds

# Answer wrong veriable name we are calling.

# 2. Tweak each of the following R commands so that they run correctly:

#libary(todyverse)

#ggplot(dTA = mpg) + 
#  geom_point(maping = aes(x = displ y = hwy)) +
#  geom_smooth(method = "lm)

libary(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(aes(x = displ, y = hwy),method = "lm")

# Answer: fixed but the aes inside the geom_smooth took me a while to understand.
"
Error in `geom_smooth()`:
! Problem while computing stat.
ℹ Error occurred in the 2nd layer.
Caused by error in `compute_layer()`:
! `stat_smooth()` requires the following missing aesthetics: x and y.
Run `rlang::last_trace()` to see where the error occurred.
"

# 3. Press Option + Shift + K / Alt + Shift + K. What happens? How can you get to the same place using the menus?

# Answer: shows keybindings

# 4. Let’s revisit an exercise from the Section 1.6. Run the following lines of code. Which of the two plots is saved as mpg-plot.png? Why?

my_bar_plot <- ggplot(mpg, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)

# Answer: Since the second plot (geom_point()) is the last plot generated, it is the one that gets saved when ggsave() is called.