reverse_list <- function(lst) {
  if (length(lst) <= 1) {
    return(lst) 
  } else {
    return(c(reverse_list(lst[-1]), lst[1]))  # recursive call
  }
}

cat("Enter elements of the list separated by space:\n")
input <- readline()
lst <- strsplit(input, " ")[[1]] 

reversed <- reverse_list(lst)

cat("Original list:\n")
print(lst)
cat("Reversed list:\n")
print(reversed)
