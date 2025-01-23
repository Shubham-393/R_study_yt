# library(ggplot2)
# data <- data.frame(x = 1:10, y = rnorm(10))
# ggplot(data, aes(x = x, y = y)) +
#   geom_point() +
#   geom_smooth(method = "lm") +
#   labs(title = "Scatter Plot with Linear Fit")
# 
# ctrl + shift + c  
# 
# m = c(1,2,3)
# n = c(4,5,6)
# 
# data <- data.frame(m,n)
# data
# category = c("red","blue","green")
# data$category <- category
# 
# 
# my_plot <- ggplot(data=data,aes(x=m,y=n, color = category))+
#     geom_point() +
#     #geom_smooth(method = "lm") +
#     labs(title = "Scatter Plot with Linear Fit")
# 
#   
# my_plot


#TASKS- 
# Color plot the points
# a= blue , b=  red 
# Try change shape 
#mtcars dataset - plot and understabnd data

http://127.0.0.1:28487/graphics/299bbe04-789b-442a-905f-e2b51bcb997e.png
# Define data
m = c(1, 2, 3)
n = c(4, 5, 6)


# Create a data frame
data <- data.frame(m, n)

# Create the plot
my_plot <- ggplot(data = data, aes(x = m, y = n)) +
  geom_point(col= "green") +
  #scale_shape_manual(values = c("red" = 16, "blue" = 16, "green" = 15)) +
  labs(title = "Scatter Plot with Color Categories")

# Display the plot
my_plot

my_plot_2 <- ggplot(data = data, aes(x = m, y = n, color = "red")) +
  geom_point(size=4, shape= 17) +  # Adjust point size
  scale_shape_manual(values = c("red" = 16, "blue" = 17, "green" = 15)) +  # Assign specific shapes
  labs(title = "Scatter Plot with Custom Shapes and Colors")

# Display the plot
my_plot_2


# Define vectors
a = c(10, 20, 30, 40)
b = c(5, 15, 25,35)

# Create a data frame
data = data.frame(a, b)

# Plot using ggplot
my_plot = ggplot() +
  geom_point(data = data, aes(x = seq_along(a), y = a), col = "blue") + # Plot 'a' in blue
  geom_point(data = data, aes(x = seq_along(b), y = b), col = "red") + # Plot 'b' in red
  labs(title = "Scatter Plot of a (Blue) and b (Red)", x = "Index", y = "Values") +
  theme_minimal()

my_plot


# Create the plot
my_plot <- ggplot(data = data, aes(x = m, y = n, col = "red")) +
  geom_point(size=4, shape= 15) +
  #scale_shape_manual(values = c("red" = 16, "blue" = 16, "green" = 15)) +
  labs(title = "Scatter Plot with Color Categories")

# Display the plot
my_plot


# Create a bar plot


library(ggplot2)
data(mtcars)  # Load the mtcars dataset
plot = ggplot(mtcars, aes(x = factor(cyl))) + 
  geom_bar(fill = "cyan", color = "green") +
  labs(title = "Number of Cars by Cylinders", x = "Cylinders", y = "Count") +
  theme_minimal()
plot




library(ggplot2)

data <- data.frame(a = c(1,2,3,4,5), b = c(2,3,5,7,11))
data
myplot <- ggplot(data= data) +
  geom_point(aes(x=a, y=b), color = "red") +
  geom_point(aes(x=b, y=a), color = "blue") +
  labs(title = "Scatter Plot", x= "X-axis", y= "Y-axis")
myplot


library(ggplot2)
data <- c(2,3,4,
          5,6,7,8,2,3,3,4,4,4,5,5,5,5, 8,8,8,8,8,8,8,8,8,8,8)
my_hist<- hist(data, main="my_hist",breaks= 10,ol= "pink")
my_hist
hist


#PieChart
sizes<- c(20,30,50)
colors<- c("red", "blue", "green")
labels<- c("A", "B", "C")
data <- c( 25, 50, 25)
pie(x= data, main = "Pie Chart", labels = labels, col =  colors, clockwise = TRUE  )
pie

data <- c(10,20,15,30,40,50,100)
my_box<- boxplot(data, col = "yellow",ylab = "Values")
my_box
mean(c(10,20,15,30,40,50,100))

