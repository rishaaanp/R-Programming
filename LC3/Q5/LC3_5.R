library(ggplot2)
library(dplyr)
library(forecast)
library(lubridate)

covid_data <- read.csv("https://raw.githubusercontent.com/datasets/covid-19/master/data/time-series-19-covid-combined.csv")

head(covid_data)

covid_india <- covid_data %>%
  filter(Country.Region == "India" & Date >= "2020-01-22" & Date <= "2020-12-15") %>%
  select(Date, Confirmed, Deaths)

covid_india$Date <- as.Date(covid_india$Date)

# (a) Univariate Time Series Analysis

# i. Create time series object for total positive cases
ts_cases <- ts(covid_india$Confirmed, 
               start = c(2020, 4),  # roughly 4th week of Jan 2020
               frequency = 52)      

# ii. Visualize the time series data
plot(ts_cases,
     main = "Weekly Total Positive COVID-19 Cases in India (2020)",
     xlab = "Week",
     ylab = "Total Confirmed Cases",
     col = "blue",
     lwd = 2)

# (b) Multivariate Time Series Analysis

# i & ii. Create multivariate time series with total cases and deaths
ts_multivariate <- ts(cbind(covid_india$Confirmed, covid_india$Deaths),
                      start = c(2020, 4),
                      frequency = 52)

# iii. Plot both series
matplot(ts_multivariate,
        type = "l",
        col = c("blue", "red"),
        lty = 1,
        xlab = "Week",
        ylab = "Count",
        main = "COVID-19 Cases and Deaths in India (2020)")
legend("topleft", legend = c("Total Cases", "Total Deaths"),
       col = c("blue", "red"), lty = 1, bty = "n")

# (c) Time Series Forecasting

# i. Fit ARIMA model using auto.arima()
arima_model <- auto.arima(ts_cases)

summary(arima_model)

# ii. Forecast next 5 data points (weeks)
forecast_values <- forecast(arima_model, h = 5)

# iii. Plot forecasted values
plot(forecast_values,
     main = "Forecast of COVID-19 Positive Cases (Next 5 Weeks)",
     xlab = "Time (Weeks)",
     ylab = "Total Positive Cases")

print(forecast_values)
