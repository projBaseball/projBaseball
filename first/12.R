perfEval <- function(cm) 
{
  TPR = cm[2, 2] / sum(cm[2, ])
  TNR = cm[1, 1] / sum(cm[1, ])#confusion matrix
  ACC = (cm[1, 1] + cm[2, 2]) / sum(cm)
  BCR = sqrt(TPR * TNR)
  return (c(TPR, TNR, ACC, BCR))
}

#install.packages("e1071", dependencies = TRUE)
library(e1071)

setwd("C:/Users/stories2/Documents/RProject")
ploan <- read.csv("Personal Loan.csv")
head(ploan)
str(ploan)
class(ploan)
summary(ploan)

inputIndex <- c(2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14)
targetIndex <- 10

ploanInputData <- ploan[, inputIndex]
ploanTargetData <- as.factor(ploan[, targetIndex])
ploanData <- data.frame(ploanInputData, ploanTargetData)
dim(ploanData)
head(ploanData)

dataLength = dim(ploanData)[1]
trainIndex <- sample(1:dataLength, round(0.7 * dataLength))
ploanTrainData <- ploanData[trainIndex, ]
ploanTestData <- ploanData[-trainIndex, ]

nbModel <- naiveBayes(ploanTargetData ~ ., data = ploanTrainData)
nbModel$apriori
nbModel$tables

posterior <- predict(nbModel, ploanTestData, type = "raw")
posterior
str(posterior)
ploanTestData

nbPrey <- predict(nbModel, ploanTestData, type = "class")
nbPrey

cfmatrix <- table(ploanTestData$ploanTargetData, nbPrey)
len(nbPrey)
perfEval(cfmatrix)
