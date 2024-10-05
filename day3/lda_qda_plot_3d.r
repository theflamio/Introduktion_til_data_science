library(doBy)

library(plotly)
plot_ly(iris, x=~Sepal.Length, y=~Sepal.Width, z=~Petal.Length, symbol=~Species)



library(plotly)
library(MASS)

# Funktion til at generere punkter på ellipsoiden
generate_ellipsoid_points <- function(center, cov_matrix, n = 100) {
  angles <- expand.grid(seq(0, 2*pi, length.out = n), seq(0, pi, length.out = n))
  
  # Enhedssfære
  sphere <- cbind(
    cos(angles[,1]) * sin(angles[,2]),
    sin(angles[,1]) * sin(angles[,2]),
    cos(angles[,2])
  )
  
  # Skab ellipsoidpunkter ved at multiplicere med Cholesky dekompositionen af kovariansmatrixen
  ellipsoid_points <- sphere %*% chol(cov_matrix) + rep(center, each = n * n)
  
  return(ellipsoid_points)
}

# Farver for hver art
colors <- c("red", "green", "blue")

# Forbered plotly-objektet
fig <- plot_ly(type = "scatter3d", mode = "markers") 

# For hver art tilføjes datapunkter og ellipsoid
for (i in unique(iris$Species)) {
  subset_data <- iris[iris$Species == i,]
  
  # Beregn center og kovariansmatrix for ellipsoiden
  center <- colMeans(subset_data[, c("Sepal.Length", "Sepal.Width", "Petal.Length")])
  cov_matrix <- cov(subset_data[, c("Sepal.Length", "Sepal.Width", "Petal.Length")])
  
  # Generer punkter på ellipsoiden
  ellipsoid_points <- generate_ellipsoid_points(center, 2*cov_matrix, n = 20)
  
  # Tilføj datapunkter
  fig <- fig %>%
    add_trace(
      data = subset_data,
      x = ~Sepal.Length, y = ~Sepal.Width, z = ~Petal.Length,
      name = as.character(i),
      marker = list(size = 3),
      color = ~Species,
      symbol = ~Species
    )
  
  # Tilføj ellipsoid som punkter
  fig <- fig %>%
    add_trace(
      x = ellipsoid_points[, 1],
      y = ellipsoid_points[, 2],
      z = ellipsoid_points[, 3],
      mode = 'markers',
      marker = list(size = 2, opacity = 0.3, color = colors[which(unique(iris$Species) == i)]),
      showlegend = FALSE
    )
}

# Indstil akseetiketter
fig <- fig %>%
  layout(
    scene = list(
      xaxis = list(title = 'Sepal Length'),
      yaxis = list(title = 'Sepal Width'),
      zaxis = list(title = 'Petal Length')
    )
  )

fig

