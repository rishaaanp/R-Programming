data(iris)

png("sepal_petal_scatterplot.png", width = 1600, height = 1200, res = 300)
plot(iris$Sepal.Length, iris$Petal.Length,
     xlab = "Sepal Length",
     ylab = "Petal Length",
     main = "Scatterplot of Sepal Length vs Petal Length",
     col = iris$Species,      
     pch = 16,              
     cex = 1)              

legend("bottomright", legend = levels(iris$Species),
       col = 1:3, pch = 16, title = "Species")

dev.off()