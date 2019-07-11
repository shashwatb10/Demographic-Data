#Set the Working Directory
getwd()

#Import the csv dataset
data <- read.csv("P2-Section5-Homework-Data.csv")

#Explore the data
data
head(data,6)      #check top 6 rows
tail(data,7) #check bottom 7 rows
str(data)      #check the structure of the data frame
summary(data)      #check the summary of the data

#Filter the dataframes
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

#Check row counts
nrow(data1960) 
nrow(data2013) 

#Create the additional dataframes
add1960 <- cbind(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- cbind(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

#Check summaries
summary(add1960)
summary(add2013)

#Merge the pairs of dataframes  
merged1960 <- merge(data1960, add1960,by.x = "Country.Code",by.y="Code")
merged2013 <- merge(data1960, add1960,by.x = "Country.Code",by.y="Code")

merged1960$Year <- NULL
merged2013$Year <- NULL

#Check structures again
head(merged1960)
head(merged2013)

library(ggplot2)

#Visualize the 1960 dataset
p<-ggplot(data=merged1960, aes(x=Fertility.Rate, y=Life.Exp,
      colour=Region,                               #colour
      size=Fertility.Rate, 
      alpha=0.3 ))                    #transparency
p+geom_point()+ggtitle("Life Expectancy v/s Fertility Rate")+xlab("Fertility Rate")+ylab("Life Expectancy")+theme(axis.text.y=element_text(size=0))




