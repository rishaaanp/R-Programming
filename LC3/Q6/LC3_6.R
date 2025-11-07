library(ggplot2)
library(dplyr)
library(corrplot)
library(caret)
library(MASS)  # for the Boston dataset

# (a) Data Exploration and Visualization

data("Boston")
boston <- Boston

str(boston)
head(boston)

summary(boston)

sum(is.na(boston))

corr_matrix <- cor(boston)
corrplot(corr_matrix, method = "color", tl.cex = 0.8)

pairs(~ medv + lstat + rm + crim + dis, data = boston,
      main = "Pair Plot of Key Variables in Boston Dataset")

ggplot(boston, aes(y = medv)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot of Median Value (medv)",
       y = "Median Value of Owner-Occupied Homes ($1000s)") +
  theme_minimal()

# (b) Regression Analysis

model <- lm(medv ~ ., data = boston)

summary(model)

par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

# (c) Prediction

set.seed(123)
train_index <- createDataPartition(boston$medv, p = 0.8, list = FALSE)
train_data <- boston[train_index, ]
test_data  <- boston[-train_index, ]

model_final <- lm(medv ~ ., data = train_data)

predictions <- predict(model_final, newdata = test_data)

comparison <- data.frame(Actual = test_data$medv, Predicted = predictions)
head(comparison)

rmse <- sqrt(mean((predictions - test_data$medv)^2))
cat("Root Mean Square Error (RMSE):", rmse, "\n")

new_data <- data.frame(
  crim = 0.1, zn = 18, indus = 2.3, chas = 0, nox = 0.5, rm = 6.5,
  age = 45, dis = 5.0, rad = 4, tax = 300, ptratio = 17, black = 390, lstat = 6
)
predicted_value <- predict(model_final, new_data)
cat("Predicted Median Value (in $1000s):", predicted_value, "\n")
