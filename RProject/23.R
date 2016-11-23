library(C50)
library(caret)

setwd("C:/Users/stories2/Desktop/DATA")

baseballTeamData <- read.csv("all.csv")
head(baseballTeamData)
str(baseballTeamData)

baseballTeamData <- baseballTeamData[, -c(1, 3, 5, 11)]
head(baseballTeamData)

trainIndex <- createDataPartition(y = baseballTeamData$종합순위,  )