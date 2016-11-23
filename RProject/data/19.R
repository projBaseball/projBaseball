library(party)

setwd("C:/Users/stories2/Documents/RProject")

baseballTeamVSTeamData <- read.csv("TeamVSTeam2.csv", stringsAsFactors = FALSE)
notDeleteIndex <- which((baseballTeamVSTeamData$팀1 == '두산' | 
                           baseballTeamVSTeamData$팀1 == 'NC' |
                           baseballTeamVSTeamData$팀1 == '넥센' |
                           baseballTeamVSTeamData$팀1 == 'LG' |
                           baseballTeamVSTeamData$팀1 == 'KIA' |
                           baseballTeamVSTeamData$팀1 == 'SK' |
                           baseballTeamVSTeamData$팀1 == '한화' |
                           baseballTeamVSTeamData$팀1 == '롯데' |
                           baseballTeamVSTeamData$팀1 == '삼성' |
                           baseballTeamVSTeamData$팀1 == 'kt') & 
                          (baseballTeamVSTeamData$팀2 == '두산' |
                             baseballTeamVSTeamData$팀2 == 'NC' |
                             baseballTeamVSTeamData$팀2 == '넥센' |
                             baseballTeamVSTeamData$팀2 == 'LG' |
                             baseballTeamVSTeamData$팀2 == 'KIA' |
                             baseballTeamVSTeamData$팀2 == 'SK' |
                             baseballTeamVSTeamData$팀2 == '한화' |
                             baseballTeamVSTeamData$팀2 == '롯데' |
                             baseballTeamVSTeamData$팀2 == '삼성' |
                             baseballTeamVSTeamData$팀2 == 'kt'))
baseballTeamVSTeamData <- baseballTeamVSTeamData[notDeleteIndex, ]
str(baseballTeamVSTeamData)

baseballTeamVSTeamDataFiltered <- baseballTeamVSTeamData[, c(2:5, 9)]
baseballTeam1WinGameIndex <- which(baseballTeamVSTeamData$팀1.점수 > baseballTeamVSTeamData$팀2.점수)
baseballTeam2WinGameIndex <- which(baseballTeamVSTeamData$팀1.점수 < baseballTeamVSTeamData$팀2.점수)
baseballNotPlayedOrDrawIndex <- which(baseballTeamVSTeamData$팀1.점수 == -1
                                      | baseballTeamVSTeamData$팀2.점수 == -1
                                      | baseballTeamVSTeamData$팀1.점수 == baseballTeamVSTeamData$팀2.점수)
baseballRowLength = dim(baseballTeamVSTeamDataFiltered)[1]
baseballWinOrLoseDummyData = rep(0, baseballRowLength)

baseballWinOrLoseDummyData[baseballTeam1WinGameIndex] <- 1

baseballTeamVSTeamDataFiltered <- cbind(baseballTeamVSTeamDataFiltered, baseballWinOrLoseDummyData)
baseballTeamVSTeamDataFiltered <- baseballTeamVSTeamDataFiltered[-baseballNotPlayedOrDrawIndex, ]

str(baseballTeamVSTeamDataFiltered)

baseballTeamVSTeamDataFiltered$팀1 <- as.factor(baseballTeamVSTeamDataFiltered$팀1)
baseballTeamVSTeamDataFiltered$팀2 <- as.factor(baseballTeamVSTeamDataFiltered$팀2)
baseballTeamVSTeamDataFiltered$장소 <- as.factor(baseballTeamVSTeamDataFiltered$장소)
str(baseballTeamVSTeamDataFiltered)

baseballTeamVSTeamDataFiltered$팀1 <- as.numeric(baseballTeamVSTeamDataFiltered$팀1)
baseballTeamVSTeamDataFiltered$팀2 <- as.numeric(baseballTeamVSTeamDataFiltered$팀2)
baseballTeamVSTeamDataFiltered$장소 <- as.numeric(baseballTeamVSTeamDataFiltered$장소)

baseballSampleIndex <- sample(1:baseballRowLength, round(0.7 * baseballRowLength))

baseballTrainData <- baseballTeamVSTeamDataFiltered[baseballSampleIndex, ]
baseballTestData <- baseballTeamVSTeamDataFiltered[-baseballSampleIndex, ]

missingIndex <- which(is.na(baseballTrainData$baseballWinOrLoseDummyData))
missingIndex

baseballTrainData <- baseballTrainData[-missingIndex, ]
str(baseballTrainData)

decisionTreeModel <- ctree(팀1.점수 ~ ., data = baseballTrainData)

plot(decisionTreeModel)
decisionTreeModel

str(baseballTrainData)

table(predict(decisionTreeModel), baseballTrainData$팀1.점수)

plot(decisionTreeModel, type = "simple")
