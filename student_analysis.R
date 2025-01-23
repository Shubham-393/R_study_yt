###checking current WD
getwd()
setwd("D:/PYTHON")
file1<- read.csv("Student_data.csv",
                 header =T,
                 sep=',')
                 #row.names = 1)

#to get row of files
#row.names(file1) 
file1

#Understanding Data
str(file1)  #structure of data
dim(file1)
head(file1)
length(file1)

### subsetting dataframe
### divide acc. department

IT = file1[file1$Department == "IT", ]
head(IT)
AIDS = file1[file1$Department=="AIDS",]
CS = file1[file1$Department=="CS",] 

###Average according to each departmenyt
CS_mean_age <- mean(CS$Age)
CS_mean_age
AIDS_mean_age <- mean(AIDS$Age)
AIDS_mean_age
IT_mean_age <- mean(IT$Age)
IT_mean_age

IT_sum_age <- sum(IT$Age)
IT_sum_age

summary(IT)

##Replacing data
IT$Name[IT$Name == "Bob Smith"] <- "More Mohit"

hist(IT$Age)
file1


###Adding column to dataframe , random values
subjects_no <- sample(x = 4:10, size = 52, replace = TRUE)
file1$Subjects <- subjects_no
file1
hist(file1$Subjects)

##visualisation

hist(file1$Age)


##Replacing data
file1$Department[file1$Department == "IT "] <- "IT"
file1$Department[file1$Department == "CS "] <- "CS"
file1$Department[file1$Department == "AIDS "] <- "AIDS"

#Facet - separating acc cyl
library(ggplot2)

file1$Department <- as.factor(file1$Department)
plt<-ggplot(file1,
            aes(x=Age,y=Subjects,color=Department,shape = Department))+
  geom_point(size=3)+
 geom_smooth(method = "lm", aes(fill=Department))
plt+facet_wrap(~Department)


#box plot
library(ggplot2)

file1$Department <- as.factor(file1$Department)
plt<-ggplot(file1,
            aes(x=Age,y=Subjects,color=Department,shape = Department))+
  geom_boxplot()+
  geom_smooth(method = "lm", aes(fill=Department))
plt+facet_wrap(~Department)

  
  #Pie Chart 
  total_rows <- nrow(file1)
  total_rows
  file1$Department <- as.factor(file1$Department)
  
  # Total count where Department is 'IT'
  total_IT <- sum(file1$Department == "IT")
  total_IT
  total_cs <- sum(file1$Department == "CS")
  total_cs
  total_AIDS <- sum(file1$Department == "AIDS")
  total_AIDS
  per_IT <- (total_IT/total_rows)*100
  per_IT
  per_CS <- (total_cs/total_rows)*100
  per_CS
  per_AIDS <- (total_AIDS/total_rows)*100
  per_AIDS
  sizes<- c(as.integer(round(per_IT)),as.integer(round(per_AIDS)),as.integer(round(per_CS)))
  colors<- c("red", "blue", "green")
  labels<- c("IT","AIDS","CS")
  data <- c( 25, 21, 54)
  plt <- pie(sizes, main = "Pie Chart", labels = labels, col =  colors, clockwise = TRUE  )
  plt