baseballAnnualIncome <- read.csv("C:/Users/stories2/Documents/RProject/baseball.csv")
head(baseballAnnualIncome)

baseballAnnualIncomeWithNoCharacter <- baseballAnnualIncome[, -c(1:3)]
head(baseballAnnualIncomeWithNoCharacter)
summary(baseballAnnualIncomeWithNoCharacter)
dim(baseballAnnualIncomeWithNoCharacter)

trainDataIndex <- sample(1:dim(baseballAnnualIncomeWithNoCharacter)[1], 0.7 * dim(baseballAnnualIncomeWithNoCharacter)[1])
trainDataIndex
trainDataSet <- baseballAnnualIncomeWithNoCharacter[trainDataIndex, ]
testDataSet <- baseballAnnualIncomeWithNoCharacter[-trainDataIndex, ]
head(trainDataSet)
head(testDataSet)

head(trainDataSet$����)
class(trainDataSet$����)
str(trainDataSet)

trainDataSet$���� <- as.numeric(trainDataSet$����)

fullModel <- lm(���� ~ ., data = trainDataSet)
fullModel
summary(fullModel)

plot(trainDataSet$����, fitted(fullModel))
abline(0, 1, lty = 3)

