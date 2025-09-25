cat("Enter a paragraph of text:\n")
paragraph <- readline()

clean_paragraph <- gsub("[[:punct:]]", "", paragraph)

words <- unlist(strsplit(clean_paragraph, "\\s+"))

total_words <- length(words)
cat("Total number of words:", total_words, "\n")

word_lengths <- nchar(words)
avg_word_length <- mean(word_lengths)
cat("Average word length:", round(avg_word_length, 2), "\n")

longest_word <- words[which.max(word_lengths)]
cat("Longest word:", longest_word, "\n")

cat("Enter the word to replace:\n")
old_word <- readline()
cat("Enter the new word:\n")
new_word <- readline()

pattern <- paste0("(?i)\\b", old_word, "\\b")  # match whole word, ignore case
paragraph_updated <- gsub(pattern, new_word, paragraph, perl = TRUE)

cat("Updated paragraph:\n", paragraph_updated, "\n")
