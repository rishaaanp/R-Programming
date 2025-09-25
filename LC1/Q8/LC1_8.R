library(dplyr)

is_palindrome <- function(text) {
  clean_text <- tolower(gsub("[^A-Za-z0-9]", "", text))
  return(clean_text == rev(strsplit(clean_text, NULL)[[1]]) %>% paste(collapse=""))
}

cat("Enter a string to check if it's a palindrome:\n")
input_text <- readline()

if (is_palindrome(input_text)) {
  cat("The string is a palindrome.\n")
} else {
  cat("The string is NOT a palindrome.\n")
}
