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
#»èÁ¦ ³»¿ë
#³¯Â¥, µðÅ×ÀÏ ¸µÅ©, Áß°è TV, Áß°è ¶óµð¿À, ºñ°í

notDeleteIndex <- which((baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'µÎ»ê' | 
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'NC' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == '³Ø¼¾' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'LG' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'KIA' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'SK' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'ÇÑÈ­' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == '·Ôµ¥' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == '»ï¼º' |
                          baseballTeamVSTeamDataWithCleaned$ÆÀ1 == 'kt') & 
                          (baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'µÎ»ê' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'NC' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == '³Ø¼¾' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'LG' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'KIA' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'SK' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'ÇÑÈ­' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == '·Ôµ¥' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == '»ï¼º' |
                              baseballTeamVSTeamDataWithCleaned$ÆÀ2 == 'kt'))
head(notDeleteIndex)
str(notDeleteIndex)
str(baseballTeamVSTeamDataWithCleaned)
baseballTeamVSTeamDataWithCleaned <- baseballTeamVSTeamDataWithCleaned[notDeleteIndex, ]
head(baseballTeamVSTeamDataWithCleaned)
str(baseballTeamVSTeamDataWithCleaned)

team1WinIndex <- which(baseballTeamVSTeamDataWithCleaned$ÆÀ1.Á¡¼ö > baseballTeamVSTeamDataWithCleaned$ÆÀ2.Á¡¼ö & 
                         baseballTeamVSTeamDataWithCleaned$ÆÀ1.Á¡¼ö != -1 & baseballTeamVSTeamDataWithCleaned$ÆÀ2 != -1)
teamDrawIndex <- which(baseballTeamVSTeamDataWithCleaned$ÆÀ1.Á¡¼ö == baseballTeamVSTeamDataWithCleaned$ÆÀ2.Á¡¼ö & 
                         baseballTeamVSTeamDataWithCleaned$ÆÀ1.Á¡¼ö != -1 & baseballTeamVSTeamDataWithCleaned$ÆÀ2 != -1)
teamNotPlayedIndex <- which(baseballTeamVSTeamDataWithCleaned$ÆÀ1.Á¡¼ö == -1 | baseballTeamVSTeamDataWithCleaned$ÆÀ2.Á¡¼ö == -1)

head(team1WinIndex)
head(teamDrawIndex)
head(teamNotPlayedIndex)

baseballTeamVSTeamWithWinOrLoseData <- baseballTeamVSTeamDataWithCleaned[, -c(3:4)]
#»èÁ¦ ³»¿ë
#°¢ ÆÀÀÌ ¾òÀº Á¡¼ö
head(baseballTeamVSTeamWithWinOrLoseData)
str(baseballTeamVSTeamWithWinOrLoseData)
dim(baseballTeamVSTeamWithWinOrLoseData)[1]

baseballWinOrLoseDummyData <- rep("lose", dim(baseballTeamVSTeamWithWinOrLoseData)[1])
baseballWinOrLoseDummyData[team1WinIndex] <- "win"
baseballWinOrLoseDummyData[teamDrawIndex] <- "draw"
head(baseballWinOrLoseDummyData)

baseballWinOrLoseDummyData <- data.frame(baseballWinOrLoseDummyData)
names(baseballWinOrLoseDummyData) <- "½ÂÆÐ¿©ºÎ"
str(baseballWinOrLoseDummyData)
head(baseballWinOrLoseDummyData)

baseballWinOrLoseDummyData$½ÂÆÐ¿©ºÎ <- as.factor(baseballWinOrLoseDummyData$½ÂÆÐ¿©ºÎ)
str(baseballWinOrLoseDummyData)

baseballTeamVSTeamDataWithCleaned <- cbind(baseballTeamVSTeamWithWinOrLoseData, baseballWinOrLoseDummyData)
baseballTeamVSTeamDataWithCleaned <- baseballTeamVSTeamDataWithCleaned[-teamNotPlayedIndex, ]
str(baseballTeamVSTeamDataWithCleaned)
dim(baseballTeamVSTeamDataWithCleaned)
baseballTeamVSTeamDataWithCleaned$ÆÀ1 <- factor(baseballTeamVSTeamDataWithCleaned$ÆÀ1)
baseballTeamVSTeamDataWithCleaned$ÆÀ2 <- factor(baseballTeamVSTeamDataWithCleaned$ÆÀ2)
baseballTeamVSTeamDataWithCleaned$Àå¼Ò <- factor(baseballTeamVSTeamDataWithCleaned$Àå¼Ò)
baseballTeamVSTeamDataWithCleaned$½ÂÆÐ¿©ºÎ <- factor(baseballTeamVSTeamDataWithCleaned$½ÂÆÐ¿©ºÎ)
str(baseballTeamVSTeamDataWithCleaned)

baseballRules <- apriori(baseballTeamVSTeamDataWithCleaned)
inspect(baseballRules)

plot(baseballRules, method="scatterplot")
plot(baseballRules, method="graph", control=list(type = "items", alpha = 1))

baseballRules <- apriori(baseballTeamVSTeamDataWithCleaned, parameter = list(minlen = 3, support = 0.1, conf = 0.0), 
                         appearance = list(rhs = c("½ÂÆÐ¿©ºÎ=win", "½ÂÆÐ¿©ºÎ=draw", "½ÂÆÐ¿©ºÎ=lose"), default="lhs"))
inspect(baseballRules)

plot(baseballRules, method="scatterplot")
plot(baseballRules, method="graph", control=list(type = "items", alpha = 1))
