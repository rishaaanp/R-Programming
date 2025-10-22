data(mtcars)

mtcars$carb <- as.factor(mtcars$carb)

carb_levels <- levels(mtcars$carb)
colors <- rainbow(length(carb_levels))      
sizes <- seq(1.5, 3, length.out = length(carb_levels)) 

point_colors <- colors[as.numeric(mtcars$carb)]
point_sizes <- sizes[as.numeric(mtcars$carb)]

par(mar = c(5, 6, 4, 7)) 

plot(mtcars$wt, mtcars$disp,
     main = "Displacement vs Weight by Number of Carburetors",
     xlab = "Weight (1000 lbs)",
     ylab = "Displacement (cu.in.)",
     col = point_colors,
     cex = point_sizes,
     pch = 16)

loess_fit <- loess(disp ~ wt, data = mtcars)
wt_seq <- seq(min(mtcars$wt), max(mtcars$wt), length.out = 100)
lines(wt_seq, predict(loess_fit, newdata = data.frame(wt = wt_seq)),
      col = "black", lwd = 2)

legend("topleft", 
       legend = paste("Carb =", carb_levels),
       col = colors,
       pt.cex = sizes,  
       cex = 0.5,             
       pch = 16,
       title = "Number of Carburetors",
       bty = "o")
