# Function to generate random password
generate_password <- function(length) {
  if (length < 4) {
    stop("Password length should be at least 4 to include all character types.")
  }
  
  # Character sets
  upper <- LETTERS          # A-Z
  lower <- letters          # a-z
  digits <- 0:9             # 0-9
  special <- c("!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "-", "=")
  
  # Ensure at least one character from each type
  password <- c(
    sample(upper, 1),
    sample(lower, 1),
    sample(digits, 1),
    sample(special, 1)
  )
  
  # Fill remaining characters randomly from all sets
  all_chars <- c(upper, lower, digits, special)
  password <- c(password, sample(all_chars, length - 4, replace = TRUE))
  
  # Shuffle the password to mix characters
  password <- sample(password)
  
  # Convert to single string
  paste(password, collapse = "")
}

# Read desired password length from user
cat("Enter desired password length:\n")
length <- as.integer(readline())

# Generate password
password <- generate_password(length)
cat("Generated password:\n", password, "\n")
