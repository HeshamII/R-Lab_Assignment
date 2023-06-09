install.packages('tidyverse')
library(ggplot2)
library(mice)

setwd("E:/EDU/labs")
getwd()
data=read.csv("G3_sydney_hobart_times.csv")
summary(data)
str(data)

sum(is.na(data))
#Drop the last column which contains only of Nulls

data= data[,-5]

#Converting data$time into numeric
data$Time<-gsub("day","",data$Time)

data$Time=as.numeric(data$Time)
str(data)

#Dealing with the missing vlues in data$time
time_mean=mean(data$Time,na.rm = TRUE)
print(time_mean)

data$Time= ifelse(is.na(data$Time),time_mean,data$Time)

sum(is.na(data)) # 0 Null

data$Time=round(data$Time, digits = 2) #Round the values 

#From Start to end
data$st_to_finish=data$fleet_start-data$fleet_finish

data$category[data$Year<=1999 & data$Year>=1900]="90s"
data$category[data$Year>=2000 & data$Year<=2999]="2000s"

# Scatter plot

plot(data$st_to_finish, data$Time, main="Scatterplot ",
     xlab="From start to finish ", ylab="time ")

#Scatter plot using ggplot
#draw_scatter=ggplot(data)
#draw_scatter+geom_point(aes(x=data$st_to_finish,y=data$Time))+ labs(x="From start to finish "
 #                                                                   , y="time")

barplot(data$st_to_finish,names.arg=data$category,xlab="Category",
        ylab="Start_to_finish",
        main="Barchart",col="blue")

View(data)



