library(tidyverse)
library(readxl)
# Load data from your local data file of your R project
getwd()
setwd("D:/PYTHON")
data <- read.csv("Online_Retail.csv")
head(data)

summary(data)
length(data)
dim(data)
#Unique Countries
data$Country <- as.factor(data$Country)
unique_values <- c(data$Country)
unique_values

head(IT)

uk <- data[data$Country == "United Kingdom", ]
france <- data[data$Country == "France", ]
australia <- data[data$Country == "Australia", ]
usa <- data[data$Country == "USA", ]
japan <- data[data$Country == "Japan", ]

summary(uk)
summary(france)
summary(australia)
summary(usa)
summary(japan)
  
  mean_uk<- mean(uk$UnitPrice)
  mean_france<- mean(france$UnitPrice)
  mean_australia<-mean(australia$UnitPrice)
  mean_usa<-mean(usa$UnitPrice)
  mean_japan<-mean(japan$UnitPrice)
  
  mean_uk2<- mean(uk$Quantity)
  mean_france2<- mean(france$Quantity)
  mean_australia2<-mean(australia$Quantity)
  mean_usa2<-mean(usa$Quantity)
  mean_japan2<-mean(japan$Quantity)

data[!duplicated(data$CustomerID),]

dim(data)

hist(usa$Quantity)
hist(japan$Quantity)
hist(data$Quantity)



#Facet - separating acc cyl
library(ggplot2)
file1 <- read.csv("Online_Retail.csv")
class(file1)
# Combine dataframes row-wise
file2 <- do.call(rbind, list(usa, uk, france, japan, australia))
head(file2)

file2$Country <- as.factor(file2$Country)
plt<-ggplot(file2,
            aes(x=Quantity,y=UnitPrice,color=Country,shape = Country))+
  geom_point(size=3)+
  geom_smooth(method = "lm", aes(fill=Country))
plt+facet_wrap(~Country)


#box plot
getwd()
setwd("D:/PYTHON")
library(ggplot2)
file1 <- read.csv("Online_Retail.csv")
file2 <- do.call(rbind, list(usa, france, japan, australia))
head(file2)

file2$Country <- as.factor(file2$Country)
plt<-ggplot(file2,
            aes(x=Country,y=Quantity,color=Country,shape = Country))+
  geom_boxplot()
  
plt

#barplot country vs UnitPrice
library(ggplot2)
file2$Country <- as.factor(file2$Country)
plt<-ggplot(file2,
            aes(x=Country,y=UnitPrice,fill=Country))+
  geom_bar(stat="identity")
plt 

#Pie Chart 
file1 <- read.csv("Online_Retail.csv")
file2 <- do.call(rbind, list(usa, uk, france, japan, australia))
head(file2)

file2$Country <- as.factor(file2$Country)

total_rows <- nrow(file2)
total_rows

# Total count where Department is 'IT'
total_usa <- sum(file2$Country == "USA")
total_usa
total_uk <- sum(file2$Country == "United Kingdom")
total_uk
total_france <- sum(file2$Country == "France")
total_france
total_japan <- sum(file2$Country == "Japan")
total_japan
total_australia <- sum(file2$Country == "Australia")
total_australia

# Combine the counts into a vector
country_counts <- c(total_usa, total_uk, total_france, total_japan, total_australia)

# Define the corresponding country labels
countries <- c("USA", "United Kingdom", "France", "Japan", "Australia")
# Create a pie chart
pie(country_counts, labels = countries, main = "Customer Distribution by Country",
    col = rainbow(length(countries)))
# Calculate percentages
percentages <- round(country_counts / sum(country_counts) * 100, 1)

# Create labels with percentages
labels <- paste(countries, "-", percentages, "%")

# Create a pie chart with percentage labels
pie(country_counts, labels = labels, main = "Customer Distribution by Country",
    col = rainbow(length(countries)))
