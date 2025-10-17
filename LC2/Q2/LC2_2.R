data(mtcars)

plot(mtcars$disp, mtcars$mpg,
     xlab = "Displacement (disp)",
     ylab = "Miles per Gallon (mpg)",
     main = "Scatterplot of mpg vs disp",
     col = mtcars$cyl,      
     pch = 16,              
     cex = 1,                
     xaxt = "n")            

lines(lowess(mtcars$disp, mtcars$mpg), col = "blue", lwd = 2)

axis(1, at = seq(min(mtcars$disp), max(mtcars$disp), by = 50))

legend("topright",
       legend = paste("Cylinders:", unique(mtcars$cyl)),
       col = unique(mtcars$cyl),                      
       pch = 16,                                          
       title = "Number of Cylinders",                    
       cex = 0.8) 