library(C50)
library(caret)

setwd("C:/Users/stories2/Desktop/DATA")

baseballTeamData <- read.csv("all.csv")
head(baseballTeamData)
str(baseballTeamData)

baseballTeamData <- baseballTeamData[, -c(1, 3, 5:7, 10:11)]
head(baseballTeamData)

trainIndex <- createDataPartition(y = baseballTeamData$종합순위, p = 0.7, list = FALSE)
trainData <- baseballTeamData[trainIndex, ]
testData <- baseballTeamData[-trainIndex, ]

dataColNum <- dim(baseballTeamData)[2]

trainDataX <- trainData[, 2:dataColNum]
trainDataY <- as.factor(trainData[, 1])

c50Model <- C5.0(trainDataX, trainDataY)
summary(c50Model)
c50Model
plot(c50Model)

testDataX <- testData[, 2:dataColNum]
testDataY <- testData[, 1]

c50ModelPred <- predict(c50Model, newdata = testDataX, type = "class")
c50ModelPred
summary(c50ModelPred)

sum(c50ModelPred == testDataY) / length(c50ModelPred)


plot(c50ModelPred)
plot(testDataY)
