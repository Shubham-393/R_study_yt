library('dplyr')
library('caret')

library(ggplot2)
mt_data <- data("mtcars")
head(mtcars)
dim(mtcars)
str(mtcars)
hist(mtcars$cyl)
hist(mtcars$gear)

plot(mtcars$mpg, mtcars$cyl)

mtcars$cyl <- as.factor(mtcars$cyl)
plot(mpg~ hp, data = mtcars, col=cyl,pch =c(4,6,8)[mtcars$cyl], cex=1.2)
legend("topright", legend=levels(mtcars$cyl), pch= c(4,6,8), col =levels(mtcars$cyl))
plot

#geom_smooth- regression line draw acc. to cyl column
library(ggplot2)
mtcars$cyl <- as.factor(mtcars$cyl)
ggplot(mtcars,
       aes(x=hp,y=mpg,color=cyl,shape = cyl))+
  geom_point(size=3)+
  geom_smooth(method = "lm", aes(fill=cyl))  #fill to color 3 areas

#Facet - separating acc cyl
library(ggplot2)
mtcars$cyl <- as.factor(mtcars$cyl)
plt<-ggplot(mtcars,
       aes(x=hp,y=mpg,color=cyl,shape = cyl))+
  geom_point(size=3)+
  geom_smooth(method = "lm", aes(fill=cyl))
plt+facet_wrap(~cyl)

#Box_plot of mpg vs hp for each cyl 
library(ggplot2)
mtcars$cyl <- as.factor(mtcars$cyl)
plt<-ggplot(mtcars,
       aes(x=hp,y=mpg,color=cyl,shape = cyl))+
      geom_boxplot() 
plt+facet_wrap(~cyl)
  
