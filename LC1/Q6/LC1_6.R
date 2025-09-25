is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  if (n == 2) {
    return(TRUE)
  }
  if (n %% 2 == 0) {
    return(FALSE)
  }
  for (i in 3:floor(sqrt(n))) {  
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

cat("Enter a number to check if it is prime:\n")
num <- as.integer(readline())

if (is_prime(num)) {
  cat(num, "is a prime number.\n")
} else {
  cat(num, "is NOT a prime number.\n")
}

cat("\nEnter the start of the range:\n")
range_start <- as.integer(readline())
cat("Enter the end of the range:\n")
range_end <- as.integer(readline())

if (range_start > range_end) {
  cat("Invalid range! Start should be less than or equal to end.\n")
} else {
  primes_in_range <- c()
  for (i in range_start:range_end) {
    if (is_prime(i)) {
      primes_in_range <- c(primes_in_range, i)
    }
  }
  
  if (length(primes_in_range) > 0) {
    cat("Prime numbers between", range_start, "and", range_end, "are:\n")
    cat(primes_in_range, "\n")
  } else {
    cat("No prime numbers found in the given range.\n")
  }
}
