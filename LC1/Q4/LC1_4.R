generate_password <- function(length) {
  if (length < 4) {
    stop("Password length should be at least 4 to include all character types.")
  }

  upper <- LETTERS          # A-Z
  lower <- letters          # a-z
  digits <- 0:9             # 0-9
  special <- c("!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "-", "=")

  password <- c(
    sample(upper, 1),
    sample(lower, 1),
    sample(digits, 1),
    sample(special, 1)
  )
  
  all_chars <- c(upper, lower, digits, special)
  password <- c(password, sample(all_chars, length - 4, replace = TRUE))
  
  password <- sample(password)
  
  paste(password, collapse = "")
}

cat("Enter desired password length:\n")
length <- as.integer(readline())

password <- generate_password(length)
cat("Generated password:\n", password, "\n")
