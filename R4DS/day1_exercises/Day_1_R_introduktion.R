# tibbles aka dataframe like pandas/polars

head(chickwts)

str(chickwts)

summary(chickwts)

z <- c(1,3,4,2,4,6)

z[1:3]

# få 2 bestemte elementer

z[c(3,4)]

z <= 3

chickwts$feed #removed feed row column in the data frame

x <- c(1, 2, NA)

mean(x)

mean(x, na.rm = TRUE)

x <- c(1, 2, NA)

is.na(x)

mpg_to_kmpl <- function(x){
  x_kmpg <- x*1.609
}


