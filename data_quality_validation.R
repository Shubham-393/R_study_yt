# Load data from your local data file of your R project
getwd()
setwd("D:/PYTHON")
file <- read.csv("Online_Retail.csv")
head(file,n = 5)

summary(file)
str(file)
dim(file)
class(file)

mean(file$Quantity)
min(file$Quantity)
unique_countries <- unique(file$Country)
print(duplicated(file$CustomerID))


#Creat an empty list to store dataframe
my_dfs <- list()

for (country in unique_countries){
  dfs <- file[file$Country==country , ]
  my_dfs[[country]] <- dfs 
  
}
  unique_countries
  
UK <- my_dfs[["United Kingdom"]]
Canada <- my_dfs[["Canada"]]
Usa <- my_dfs[["USA"]]
final_df<-data.frame(rbind(UK, Canada, Usa))
head(final_df)
unique(final_df$Country)

?duplicated
duplicates <- file[duplicated(file$CustomerID, fromLast = TRUE) | duplicated(file$CustomerID), ]
duplicates


