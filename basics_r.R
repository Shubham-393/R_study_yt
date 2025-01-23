library(ggplot2)

data = c(10,20,30,40,50)

mean_value <- mean(data)
mean_value

x= c(2,4,6)
y = c(3,8,5)
plot(x,y)

Name <- c("Raj", "Om", "Jay")
Age <- c(40, 15, 25)

df <- data.frame(Name, Age)
print(df)
typeof(df)
mean_age  <- mean(df$Age)
print(paste("Average age ", mean_age))

# Plotting with base R

values <- c(5, 10, 15)
labels <- c("a", "b", "c")

#barplot 
my_plot <- barplot(values, names.arg = labels,
        main = "Bar plot Ex",
        xlab = "Categories",
        ylab = "values",
        col= "green")
#explore other plots also.

#




