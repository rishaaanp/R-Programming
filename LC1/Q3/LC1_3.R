valid_names <- c()
valid_ages <- c()
valid_grades <- c()

is_valid_age <- function(age) {
  return(!is.na(age) && age > 0 && age == as.integer(age))
}

is_valid_grade <- function(grade) {
  return(toupper(grade) %in% c("A", "B", "C", "D", "F"))
}

cat("Enter the number of students:\n")
num_students <- as.integer(readline())

for (i in 1:num_students) {
  cat(paste0("\nStudent ", i, ":\n"))

  cat("Name: ")
  name <- readline()
  cat("Age: ")
  age <- as.integer(readline())
  cat("Grade (A/B/C/D/F): ")
  grade <- readline()
  
  if (!is_valid_age(age)) {
    cat("Invalid age! Record skipped.\n")
    next
  }
  if (!is_valid_grade(grade)) {
    cat("Invalid grade! Record skipped.\n")
    next
  }

  valid_names <- c(valid_names, name)
  valid_ages <- c(valid_ages, age)
  valid_grades <- c(valid_grades, toupper(grade))
}

cat("\nValid Student Records:\n")
if (length(valid_names) > 0) {
  for (i in 1:length(valid_names)) {
    cat(paste(valid_names[i], "-", valid_ages[i], "years old,", "Grade:", valid_grades[i], "\n"))
  }
  avg_age <- mean(valid_ages)
  cat("\nAverage age of valid students:", round(avg_age, 2), "\n")
} else {
  cat("No valid student records entered.\n")
}
