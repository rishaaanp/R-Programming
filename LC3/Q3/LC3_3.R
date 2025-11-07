data(mtcars)

head(mtcars)

hp <- mtcars$hp    
mpg <- mtcars$mpg 

plot(hp, mpg,
     main = "Scatter Plot of Horsepower vs Miles per Gallon",
     xlab = "Horsepower (hp)",
     ylab = "Miles per Gallon (mpg)",
     col = "blue",
     pch = 19)

abline(lm(mpg ~ hp), col = "red", lwd = 2)

# Perform Pearson correlation test
cor_test_result <- cor.test(hp, mpg, method = "pearson")

print(cor_test_result)
