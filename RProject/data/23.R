library(party)

data(iris)
summary(iris)

index <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
trainData <- iris[index == 1, ]
testData <- iris[index == 2, ]

head(trainData)
head(testData)

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width

irisCtree <- ctree(myFormula, data = trainData)
predict(irisCtree)
table(predict(irisCtree), trainData$Species)

print(irisCtree)

plot(irisCtree)

plot(irisCtree, type = "simple")

table(c("a", "b", "c", "d", "d", "c", "a", "a"))

testResult <- predict(irisCtree, newdata = testData)
tableTest <- table(testResult, testData$Species)
tableTest
sumTest <- margin.table(tableTest)
prop.table(tableTest)

d <- data.frame(x = c(1, 2, 2, 1), y = c("a", "b", "a", "b"),
                num = c(3, 5, 7, 8))

d

xt <- xtabs(num ~ ., data = d)
xt

d2 <- data.frame(x = c("a", "a", "a", "b", "b"),
                 result = c(3, 2, 4, 7, 6))

d2
xtabs(~ x, data = d2)

sum(xt)

margin.table(xt, 1)

margin.table(xt, 2)

margin.table(xt)

prop.table(xt, 1)

prop.table(xt, 2)

prop.table(xt)

xt
