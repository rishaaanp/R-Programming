run_length_encode <- function(text) {
  if (nchar(text) == 0) return("")  

  chars <- strsplit(text, NULL)[[1]]
  encoded <- c()
  count <- 1

  for (i in 2:length(chars)) {
    if (chars[i] == chars[i-1]) {
      count <- count + 1
    } else {
      encoded <- c(encoded, paste0(chars[i-1], count))
      count <- 1
    }
  }
  encoded <- c(encoded, paste0(chars[length(chars)], count))
  return(paste(encoded, collapse = ""))
}

cat("Enter a string to compress using Run-Length Encoding:\n")
input_text <- readline()

compressed_text <- run_length_encode(input_text)

cat("Compressed string:\n", compressed_text, "\n")
