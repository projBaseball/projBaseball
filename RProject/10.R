baseballTeamVSTeamData <- read.csv("C:/Users/stories2/Documents/RProject/TeamVSTeam2.csv")
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

teamNO1WinIndex <- which(baseballTeamVSTeamData$팀1.점수 > baseballTeamVSTeamData$팀2.점수 & 
                           (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNO1LoseIndex <- which(baseballTeamVSTeamData$팀1.점수 < baseballTeamVSTeamData$팀2.점수& 
                            (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNO1DrawIndex <- which(baseballTeamVSTeamData$팀1.점수 == baseballTeamVSTeamData$팀2.점수& 
                            (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNotPlayedIndex <- which(baseballTeamVSTeamData$팀1.점수 < 0 & baseballTeamVSTeamData$팀2.점수 < 0)

dim(baseballTeamVSTeamData)
allDataLength <- dim(baseballTeamVSTeamData)[1]
allDataLength

winDumpData <- rep(0, allDataLength)
drawDumpData <- rep(0, allDataLength)
loseDumpData <- rep(0, allDataLength)

winDumpData[teamNO1WinIndex] <- 1
drawDumpData[teamNO1DrawIndex] <- 1
loseDumpData[teamNO1LoseIndex] <- 1

winDrawLoseCol <- data.frame(winDumpData, drawDumpData, loseDumpData)
names(winDrawLoseCol) <- c("win", "draw", "lose")
head(winDrawLoseCol)

baseballTeamVSTeamData <- cbind(baseballTeamVSTeamData, winDrawLoseCol)
head(baseballTeamVSTeamData)

baseballTeamVSTeamData <- baseballTeamVSTeamData[-teamNotPlayedIndex, ]
head(baseballTeamVSTeamData)
tail(baseballTeamVSTeamData)
dim(baseballTeamVSTeamData)
str(baseballTeamVSTeamData)

#dataTest <- as.factor(baseballTeamVSTeamData$장소)
#str(dataTest)
#dataTest <- as.character(dataTest)
#head(dataTest)
#check <- which(dataTest == "AT&T")
#check
#dataTest <- as.factor(dataTest)
#str(dataTest)

baseballTeamVSTeamData <- baseballTeamVSTeamData[, -c(1, 4:8, 10)]
str(baseballTeamVSTeamData)

names(baseballTeamVSTeamData) <- c("team1", "team2", "place", "win", "draw", "lose")
str(baseballTeamVSTeamData)
baseballTeamVSTeamDataBak <- baseballTeamVSTeamData

baseballTeamVSTeamData$team1 <- as.character(baseballTeamVSTeamData$team1)
baseballTeamVSTeamData$team2 <- as.character(baseballTeamVSTeamData$team2)
baseballTeamVSTeamData$place <- as.character(baseballTeamVSTeamData$place)
baseballTeamVSTeamData$team1 <- as.factor(baseballTeamVSTeamData$team1)
baseballTeamVSTeamData$team2 <- as.factor(baseballTeamVSTeamData$team2)
baseballTeamVSTeamData$place <- as.factor(baseballTeamVSTeamData$place)
baseballTeamVSTeamData$win <- as.integer(baseballTeamVSTeamData$win)
baseballTeamVSTeamData$draw <- as.integer(baseballTeamVSTeamData$draw)
baseballTeamVSTeamData$lose <- as.integer(baseballTeamVSTeamData$lose)
baseballTeamVSTeamData$team1 <- as.integer(baseballTeamVSTeamData$team1)
baseballTeamVSTeamData$team2 <- as.integer(baseballTeamVSTeamData$team2)
baseballTeamVSTeamData$place <- as.integer(baseballTeamVSTeamData$place)
str(baseballTeamVSTeamData)
teamNameList <- sapply(baseballTeamVSTeamData[1, ], levels)
teamNameList$team1
teamNameList$place

dataLength <- dim(baseballTeamVSTeamData)[1]
dataLength
trainDataIndex <- sample(1:dataLength, round(0.7 * dataLength))
head(trainDataIndex)

baseballTrainData <- baseballTeamVSTeamData[trainDataIndex, ]
baseballTestData <- baseballTeamVSTeamData[-trainDataIndex, ]
str(baseballTrainData)
str(baseballTestData)

linearFullModel <- lm(team2 ~ ., data = baseballTrainData)
linearFullModel
summary(linearFullModel)

str(baseballTrainData)
xyForwardModelOption <- paste(colnames(baseballTrainData[-2]), collapse = " + ")
xyForwardModelOption
xyForwardModelOption <- paste("team2 ~ ", xyForwardModelOption, collapse = "")
xyForwardModelOption

baseballForwardModel <- step(lm(team2 ~ 1, data = baseballTrainData), 
                             scope = list(upper = as.formula(xyForwardModelOption), lower = team2 ~ 1), direction = "forward", trace = 1)
summary(baseballForwardModel)
anova(baseballForwardModel)

baseballBackwardModel <- step(lm(linearFullModel, data = baseballTrainData),
                              scope = list(upper = as.formula(xyForwardModelOption), lower = team2 ~ 1), direction = "backward", trace = 1)
summary(baseballBackwardModel)
anova(baseballBackwardModel)
