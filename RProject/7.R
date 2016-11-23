library(arules)
library(arulesViz)
library(wordcloud)

titanicData <- read.delim('C:/Users/stories2/Documents/RProject/titanic.txt', dec = ',')
head(titanicData)

titanicDataWithNoNames <- titanicData[, 2:5]
head(titanicDataWithNoNames)
str(titanicDataWithNoNames)

titanicDataInChildIndex <- which(as.numeric(titanicDataWithNoNames$Age) < 15)
titanicDataInYoungIndex <- which(as.numeric(titanicDataWithNoNames$Age) >= 15 & as.numeric(titanicDataWithNoNames$Age) < 30)
titanicDataInAdultIndex <- which(as.numeric(titanicDataWithNoNames$Age) >= 30 & as.numeric(titanicDataWithNoNames$Age) < 50)
titanicDataInSeniorIndex <- which(as.numeric(titanicDataWithNoNames$Age) >= 50)
titanicDataInNaIndex <- which(is.na(titanicDataWithNoNames$Age))

head(titanicDataInChildIndex)
head(titanicDataInYoungIndex)
head(titanicDataInAdultIndex)
head(titanicDataInSeniorIndex)
head(titanicDataInNaIndex)

titanicDataWithNoNames$Age <- as.character(titanicDataWithNoNames$Age)
str(titanicDataWithNoNames)

titanicDataWithNoNames$Age[titanicDataInChildIndex] <- "Child"
titanicDataWithNoNames$Age[titanicDataInYoungIndex] <- "Young"
titanicDataWithNoNames$Age[titanicDataInAdultIndex] <- "Adult"
titanicDataWithNoNames$Age[titanicDataInSeniorIndex] <- "Senior"
titanicDataWithNoNames$Age[titanicDataInNaIndex] <- "Unknown"

head(titanicDataWithNoNames)
tail(titanicDataWithNoNames)

titanicDataWithNoNames$Age <- as.factor(titanicDataWithNoNames$Age)
titanicDataWithNoNames$Survived <- as.factor(titanicDataWithNoNames$Survived)
str(titanicDataWithNoNames)

help("apriori")
aprioriRules <- apriori(titanicDataWithNoNames, parameter = list(support = 0.5, conf = 0.6), 
                        appearance = list(rhs = c("Survived=0", "Survived=1"), default = "lhs"))

inspect(aprioriRules)

plot(aprioriRules, method = "scatterplot")
plot(aprioriRules, method = "graph", control = list(type = "items", alpha = 1))
plot(aprioriRules, method = "group")
