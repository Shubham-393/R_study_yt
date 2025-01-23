
getwd()
setwd("D:/PYTHON/R_study")
file <- read.csv("crude_oil.csv")
head(file,n = 5)
str(file)
dim(file)

duplicates <- file[duplicated(file$OIL.COMPANIES, fromLast = TRUE) | duplicated(file$OIL.COMPANIES), ]
duplicates

hist(file$Quantity..000.Metric.Tonnes., col = "orange")
length
length(unique(file$Month))
unique(file$OIL.COMPANIES)
summary(file)

hist(file$Year, col= "skyblue")

df_2020 = file[ file$Year == 2020,]
df_2020


##Replacing data
df_2020$Month[df_2020$Month == "January"] <- 1
df_2020$Month[df_2020$Month == "February"] <- 2
df_2020$Month[df_2020$Month == "March"] <- 3
df_2020$Month[df_2020$Month == "April"] <- 4
df_2020$Month[df_2020$Month == "May"] <- 5
df_2020$Month[df_2020$Month == "June"] <- 6
df_2020$Month[df_2020$Month == "July"] <- 7
df_2020$Month[df_2020$Month == "August"] <-8
df_2020$Month[df_2020$Month == "September"] <- 9
df_2020$Month[df_2020$Month == "October"] <- 10
df_2020$Month[df_2020$Month == "November"] <- 11
df_2020$Month[df_2020$Month == "December"] <- 12

df_2020$Month<- as.integer(df_2020$Month)

str(df_2020)

hist(df_2020$Month, col= "skyblue")



#Facet - separating acc cyl
library(ggplot2)

file$Month <- as.factor(file$Month)
plt<-ggplot(file,
            aes(x=Year, y =Quantity..000.Metric.Tonnes.,color=Month,shape = Month))+
  geom_point(size=3)
 # geom_smooth(method = "lm", aes(fill=Department))
plt+facet_wrap(~Month)


#Facet - separating acc cyl
library(ggplot2)

file$Month <- as.factor(file$Month)
plt<-ggplot(file,
            aes(x=Year, y =Quantity..000.Metric.Tonnes.,fill= Month,shape = Month))+
  geom_bar(stat = "identity"
           )
# geom_smooth(method = "lm", aes(fill=Department))
plt+facet_wrap(~Month)


#Facet - separating acc cyl
library(ggplot2)

file$Month <- as.factor(file$Month)
plt<-ggplot(file,
            aes(x=Year, y =Quantity..000.Metric.Tonnes.))+
  geom_line(  )+ 
  labs( title = "Oil Production Trends by Company",
        x ="Date",
        y= "Quantity (000 metric tones")
  
# geom_smooth(method = "lm", aes(fill=Department))
plt+facet_wrap(~OIL.COMPANIES)


library(ggplot2)
library(ggridges)
plt<-ggplot(file,
            aes(x=Quantity..000.Metric.Tonnes., y =OIL.COMPANIES, fill=Month))+
  geom_density_ridges(alpha=0.5)+ 
  labs( title = "Oil Production Trends by Company",
        x ="Quantity (000 metric tones)",
        y= "company")
plt
# geom_smooth(method = "lm", aes(fill=Department))
plts







