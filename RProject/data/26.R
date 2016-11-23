install.packages("C50")
install.packages("caret")

library(C50)
library(caret)

data(iris)
summary(iris);head(iris)

splitIndex <- createDataPartition(y = iris$Species, p = 0.7, list = FALSE)
trainData <- iris[splitIndex, ]
testData <- iris[-splitIndex, ]

dim(trainData);dim(testData)

trainDataX <- trainData[, 1:4]
trainDataY <- trainData[, 5]
model = C5.0(trainDataX, trainDataY)
model
summary(model)
plot(model)

model = C5.0(trainDataX, trainDataY, trials = 10)
summary(model)
plot(model)

testDataX = testData[, 1:4]
testDataY = testData[, 5]
testResult = predict(model, testDataX, type = "class")
sum(testResult == testDataY) / length(testResult)

rpartModel = train(Species ~ ., method = "rpart", data = trainData)
print(rpartModel$finalModel)

rpartResult = predict(rpartModel, newdata = testData)
sum(rpartResult == testDataY) / length(rpartResult)
