data(mtcars)

mpg_mean <- mean(mtcars$mpg)
mpg_sd <- sd(mtcars$mpg)

hist(
  mtcars$mpg,
  breaks = 10,
  col = colorRampPalette(c("lightblue", "blue"))(10),  
  main = "Histogram of Miles per Gallon (mpg)",
  xlab = "Miles per Gallon (mpg)",
  ylab = "Frequency",
  border = "white"
)

abline(v = mpg_mean, col = "darkred", lwd = 2, lty = 2)

text(
  x = mpg_mean + 2,
  y = max(hist(mtcars$mpg, plot = FALSE)$counts) - 1,
  labels = paste0("Mean = ", round(mpg_mean, 2), 
                  "\nSD = ", round(mpg_sd, 2)),
  col = "darkred",
  adj = 0
)
