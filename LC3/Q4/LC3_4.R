data(mtcars)

head(mtcars)

mtcars$gear <- as.factor(mtcars$gear)

summary(mtcars[, c("disp", "gear")])

boxplot(disp ~ gear, data = mtcars,
        main = "Displacement across Gear Types",
        xlab = "Number of Gears",
        ylab = "Displacement (cu. in.)",
        col = c("skyblue", "lightgreen", "salmon"))

# Perform One-Way ANOVA
anova_result <- aov(disp ~ gear, data = mtcars)

summary(anova_result)

# Post-hoc test (Tukey’s HSD) to see which pairs differ significantly
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
