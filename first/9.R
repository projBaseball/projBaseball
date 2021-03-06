#install.packages("arules")
#install.packages("arulesViz")
#install.packages("wordcloud")

library(arules)
library(arulesViz)
library(wordcloud)

baseballTeamVSTeamData <- read.csv("C:/Users/stories2/Documents/RProject/TeamVSTeam2.csv")
head(baseballTeamVSTeamData)
str(baseballTeamVSTeamData)

baseballTeamVSTeamDataWithCleaned <- baseballTeamVSTeamData[, -c(1, 6:8, 10)]
#���� ����
#��¥, ������ ��ũ, �߰� TV, �߰� ����, ���

notDeleteIndex <- which((baseballTeamVSTeamDataWithCleaned$��1 == '�λ�' | 
                          baseballTeamVSTeamDataWithCleaned$��1 == 'NC' |
                          baseballTeamVSTeamDataWithCleaned$��1 == '�ؼ�' |
                          baseballTeamVSTeamDataWithCleaned$��1 == 'LG' |
                          baseballTeamVSTeamDataWithCleaned$��1 == 'KIA' |
                          baseballTeamVSTeamDataWithCleaned$��1 == 'SK' |
                          baseballTeamVSTeamDataWithCleaned$��1 == '��ȭ' |
                          baseballTeamVSTeamDataWithCleaned$��1 == '�Ե�' |
                          baseballTeamVSTeamDataWithCleaned$��1 == '�Ｚ' |
                          baseballTeamVSTeamDataWithCleaned$��1 == 'kt') & 
                          (baseballTeamVSTeamDataWithCleaned$��2 == '�λ�' |
                              baseballTeamVSTeamDataWithCleaned$��2 == 'NC' |
                              baseballTeamVSTeamDataWithCleaned$��2 == '�ؼ�' |
                              baseballTeamVSTeamDataWithCleaned$��2 == 'LG' |
                              baseballTeamVSTeamDataWithCleaned$��2 == 'KIA' |
                              baseballTeamVSTeamDataWithCleaned$��2 == 'SK' |
                              baseballTeamVSTeamDataWithCleaned$��2 == '��ȭ' |
                              baseballTeamVSTeamDataWithCleaned$��2 == '�Ե�' |
                              baseballTeamVSTeamDataWithCleaned$��2 == '�Ｚ' |
                              baseballTeamVSTeamDataWithCleaned$��2 == 'kt'))
head(notDeleteIndex)
str(notDeleteIndex)
str(baseballTeamVSTeamDataWithCleaned)
baseballTeamVSTeamDataWithCleaned <- baseballTeamVSTeamDataWithCleaned[notDeleteIndex, ]
head(baseballTeamVSTeamDataWithCleaned)
str(baseballTeamVSTeamDataWithCleaned)

team1WinIndex <- which(baseballTeamVSTeamDataWithCleaned$��1.���� > baseballTeamVSTeamDataWithCleaned$��2.���� & 
                         baseballTeamVSTeamDataWithCleaned$��1.���� != -1 & baseballTeamVSTeamDataWithCleaned$��2 != -1)
teamDrawIndex <- which(baseballTeamVSTeamDataWithCleaned$��1.���� == baseballTeamVSTeamDataWithCleaned$��2.���� & 
                         baseballTeamVSTeamDataWithCleaned$��1.���� != -1 & baseballTeamVSTeamDataWithCleaned$��2 != -1)
teamNotPlayedIndex <- which(baseballTeamVSTeamDataWithCleaned$��1.���� == -1 | baseballTeamVSTeamDataWithCleaned$��2.���� == -1)

head(team1WinIndex)
head(teamDrawIndex)
head(teamNotPlayedIndex)

baseballTeamVSTeamWithWinOrLoseData <- baseballTeamVSTeamDataWithCleaned[, -c(3:4)]
#���� ����
#�� ���� ���� ����
head(baseballTeamVSTeamWithWinOrLoseData)
str(baseballTeamVSTeamWithWinOrLoseData)
dim(baseballTeamVSTeamWithWinOrLoseData)[1]

baseballWinOrLoseDummyData <- rep("lose", dim(baseballTeamVSTeamWithWinOrLoseData)[1])
baseballWinOrLoseDummyData[team1WinIndex] <- "win"
baseballWinOrLoseDummyData[teamDrawIndex] <- "draw"
head(baseballWinOrLoseDummyData)

baseballWinOrLoseDummyData <- data.frame(baseballWinOrLoseDummyData)
names(baseballWinOrLoseDummyData) <- "���п���"
str(baseballWinOrLoseDummyData)
head(baseballWinOrLoseDummyData)

baseballWinOrLoseDummyData$���п��� <- as.factor(baseballWinOrLoseDummyData$���п���)
str(baseballWinOrLoseDummyData)

baseballTeamVSTeamDataWithCleaned <- cbind(baseballTeamVSTeamWithWinOrLoseData, baseballWinOrLoseDummyData)
baseballTeamVSTeamDataWithCleaned <- baseballTeamVSTeamDataWithCleaned[-teamNotPlayedIndex, ]
str(baseballTeamVSTeamDataWithCleaned)
dim(baseballTeamVSTeamDataWithCleaned)
baseballTeamVSTeamDataWithCleaned$��1 <- factor(baseballTeamVSTeamDataWithCleaned$��1)
baseballTeamVSTeamDataWithCleaned$��2 <- factor(baseballTeamVSTeamDataWithCleaned$��2)
baseballTeamVSTeamDataWithCleaned$��� <- factor(baseballTeamVSTeamDataWithCleaned$���)
baseballTeamVSTeamDataWithCleaned$���п��� <- factor(baseballTeamVSTeamDataWithCleaned$���п���)
str(baseballTeamVSTeamDataWithCleaned)

baseballRules <- apriori(baseballTeamVSTeamDataWithCleaned)
inspect(baseballRules)

plot(baseballRules, method="scatterplot")
plot(baseballRules, method="graph", control=list(type = "items", alpha = 1))

baseballRules <- apriori(baseballTeamVSTeamDataWithCleaned, parameter = list(minlen = 3, support = 0.1, conf = 0.0), 
                         appearance = list(rhs = c("���п���=win", "���п���=draw", "���п���=lose"), default="lhs"))
inspect(baseballRules)

plot(baseballRules, method="scatterplot")
plot(baseballRules, method="graph", control=list(type = "items", alpha = 1))
