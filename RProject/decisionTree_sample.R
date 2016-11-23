install.packages("party")
library(party)
data(iris)
summary(iris)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7,0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]
head(trainData)
head(testData)

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
myFormula
iris_ctree <- ctree(myFormula, data=trainData)
iris_ctree
table(predict(iris_ctree), trainData$Species)

print(iris_ctree)

plot(iris_ctree)

plot(iris_ctree, type="simple")
testPred <- predict(iris_ctree, newdata=testData)
table(testPred, testData$Species)

confusionMatrix(testPred, testData$Species)
