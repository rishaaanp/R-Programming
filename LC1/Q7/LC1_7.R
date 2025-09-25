cat("Enter the number of terms for the series:\n")
n <- as.integer(readline())

if (n <= 0) {
  cat("Number of terms must be a positive integer.\n")
} else {
  if (n == 1) {
    series <- 0
  } else if (n == 2) {
    series <- c(0, 1)
  } else {
    series <- c(0, 1, 1)
  }
  
  if (n > 3) {
    for (i in 4:n) {
      next_term <- series[i-1] + series[i-2] + series[i-3]
      series <- c(series, next_term)
    }
  }
  
  cat("Twisted Fibonacci series with", n, "terms:\n")
  cat(series, "\n")
}
