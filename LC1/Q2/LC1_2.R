encrypt_char <- function(char, shift) {
  if (grepl("[A-Z]", char)) {  
    return(intToUtf8((utf8ToInt(char) - utf8ToInt("A") + shift) %% 26 + utf8ToInt("A")))
  } else if (grepl("[a-z]", char)) {  
    return(intToUtf8((utf8ToInt(char) - utf8ToInt("a") + shift) %% 26 + utf8ToInt("a")))
  } else {
    return(char)
  }
}

cat("Enter a sentence to encrypt:\n")
sentence <- readline()

cat("Enter the shift value (integer):\n")
shift <- as.integer(readline())

encrypted_sentence <- paste0(sapply(strsplit(sentence, NULL)[[1]], encrypt_char, shift = shift), collapse = "")

cat("Encrypted sentence:\n", encrypted_sentence, "\n")
