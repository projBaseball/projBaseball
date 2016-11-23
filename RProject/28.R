library(C50)
library(caret)

setwd("C:/Users/stories2/Desktop/DATA")

baseballTeamData <- read.csv("all2.csv", stringsAsFactors = FALSE)
head(baseballTeamData)
str(baseballTeamData)

IndexOf2016Year <- which(baseballTeamData$YEAR == 2016)
IndexOf2003to2002Years <- which(baseballTeamData$YEAR <= 2001)

baseballTeamData <- baseballTeamData[, -c(1:3, 6:8, 11:12)]
#baseballTeamData <- baseballTeamData[-IndexOf2003to2002Years, ]
str(baseballTeamData)
head(baseballTeamData)

#trainIndex <- createDataPartition(y = baseballTeamData$ì¢…í•©?ˆœ?œ„, p = 0.7, list = FALSE)
#trainData <- baseballTeamData[trainIndex, ]
#testData <- baseballTeamData[-trainIndex, ]

trainData <- baseballTeamData[-IndexOf2016Year, ]
testData <- baseballTeamData[IndexOf2016Year, ]

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

plot(c50Model, type = "simple")
