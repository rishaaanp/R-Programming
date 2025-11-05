library(ggplot2)

# Kaggle dataset link: https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques

house_data <- read.csv("train.csv")

head(house_data)

house_subset <- house_data[, c("GrLivArea", "SalePrice")]
colnames(house_subset) <- c("size", "price")

model <- lm(price ~ size, data = house_subset)

summary(model)

intercept <- coef(model)[1]
slope <- coef(model)[2]

cat("Intercept:", intercept, "\n")
cat("Slope:", slope, "\n")

ggplot(house_subset, aes(x = size, y = price)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Linear Regression: House Price vs Size",
       x = "House Size (sq. ft.)",
       y = "House Price (USD)") +
  theme_minimal()
