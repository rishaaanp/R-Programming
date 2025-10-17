data(mtcars)

mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

cyl_am_table <- table(mtcars$cyl, mtcars$am)

barplot(cyl_am_table, beside = TRUE,
        col = c("skyblue", "orange"),  
        xlab = "Number of Cylinders",
        ylab = "Count",
        main = "Bar Plot of Cylinders by Transmission Type",
        legend.text = c("Automatic", "Manual"),  
        args.legend = list(title = "Transmission", x = "topright", cex = 0.8),
        border = "white")