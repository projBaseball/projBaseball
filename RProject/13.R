#지도학습의 나이브베이지안
performanceTester <- function(confusionMatrix) 
{
  YYNN <- (confusionMatrix[2, 2] + confusionMatrix[1, 1]) / sum(confusionMatrix)
  #정확도
  YYC <- confusionMatrix[2, 2] / sum(confusionMatrix[, 2])
  #정밀도
  YNR <- confusionMatrix[2, 1] / sum(confusionMatrix[1, ])
  #특이도
  YYR <- confusionMatrix[2, 2] / sum(confusionMatrix[2, ])
  #민감도
  
  BCR = sqrt(YYNN * YNR)
  
  return (c(YYNN, YYC, YNR, YYR))
}

library(e1071)

baseballScout <- read.csv("C:/Users/stories2/Documents/RProject/프로야구 나이브베이지안분류.csv")

trainIndex <- c(6:9)
targetIndex <- 14
baseballInputData <- baseballScout[, trainIndex]
baseballTargetData <- as.factor(baseballScout[, targetIndex])

baseballBeforeNavie <- data.frame(baseballInputData, baseballTargetData)
head(baseballBeforeNavie)

dataLength <- dim(baseballBeforeNavie)[1]
trainSampleIndex <- sample(1:dataLength, round(0.7 * dataLength))

baseballTrainData <- baseballBeforeNavie[trainSampleIndex, ]
baseballTestData <- baseballBeforeNavie[-trainSampleIndex, ]

nbModel <- naiveBayes(baseballTrainData$baseballTargetData ~ ., data = baseballTrainData)
nbModel
nbModel$apriori
nbModel$tables

plot(nbModel)

baseballAfterNavie <- predict(nbModel, baseballTestData, type = "raw")
baseballAfterNavie

nbPrey <- predict(nbModel, baseballTestData, type = "class")
nbPrey

cfMatrix <- table(baseballTestData$baseballTargetData, nbPrey)

performanceTester(cfMatrix)

#plot(nbPrey)