series_sum <- function(n) {
  sum <- 0
  series_terms <- c() 
  
  for (i in 1:n) {
    term <- i / (2*i - 1)         
    if (i %% 2 == 0) {           
      term <- -term
      series_terms <- c(series_terms, paste0("-", i, "/", (2*i - 1)))
    } else {
      series_terms <- c(series_terms, paste0(i, "/", (2*i - 1)))
    }
    sum <- sum + term
  }
  
  cat("Series up to", n, "terms:\n")
  cat(paste(series_terms, collapse = " + "), "\n")  
  
  return(sum)
}

cat("Enter the number of terms in the series:\n")
n <- as.integer(readline())

if (n <= 0) {
  cat("Number of terms must be a positive integer.\n")
} else {
  result <- series_sum(n)
  cat("Sum of the series up to", n, "terms is:", result, "\n")
}
