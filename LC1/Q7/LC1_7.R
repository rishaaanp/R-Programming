# Read number of terms from user
cat("Enter the number of terms for the series:\n")
n <- as.integer(readline())

# Validate input
if (n <= 0) {
  cat("Number of terms must be a positive integer.\n")
} else {
  # Initialize the series with the first three terms
  if (n == 1) {
    series <- 0
  } else if (n == 2) {
    series <- c(0, 1)
  } else {
    series <- c(0, 1, 1)
  }
  
  # Generate the series for n > 3
  if (n > 3) {
    for (i in 4:n) {
      next_term <- series[i-1] + series[i-2] + series[i-3]
      series <- c(series, next_term)
    }
  }
  
  # Display the series
  cat("Twisted Fibonacci series with", n, "terms:\n")
  cat(series, "\n")
}
