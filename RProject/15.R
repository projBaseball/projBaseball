
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

#두산 OB
#삼성 SS
#NC NC
#넥센 WO
#SK SK
#한화 HH
#KIA HT
#롯데 LT
#LG LG
#kt KT

setwd("./data")

obPitchersData <- read.csv("ds_pitchers.csv", stringsAsFactors = FALSE)
obHittersData <- read.csv("ds_batters.csv", stringsAsFactors = FALSE)

ssPitchersData <- read.csv("ss_pitchers.csv", stringsAsFactors = FALSE)
ssHittersData <- read.csv("ss_batters.csv", stringsAsFactors = FALSE)

ncPitchersData <- read.csv("nc_pitchers.csv", stringsAsFactors = FALSE)
ncHittersData <- read.csv("nc_batters.csv", stringsAsFactors = FALSE)

woPitchersData <- read.csv("nx_pitchers.csv", stringsAsFactors = FALSE)
woHittersData <- read.csv("nx_batters.csv", stringsAsFactors = FALSE)

skPitchersData <- read.csv("sk_pitchers.csv", stringsAsFactors = FALSE)
skHittersData <- read.csv("sk_batters.csv", stringsAsFactors = FALSE)

hhPitchersData <- read.csv("hh_pitchers.csv", stringsAsFactors = FALSE)
hhHittersData <- read.csv("hh_batters.csv", stringsAsFactors = FALSE)

htPitchersData <- read.csv("ht_pitchers.csv", stringsAsFactors = FALSE)
htHittersData <- read.csv("ht_batters.csv", stringsAsFactors = FALSE)

ltPitchersData <- read.csv("lt_pitchers.csv", stringsAsFactors = FALSE)
ltHittersData <- read.csv("lt_batters.csv", stringsAsFactors = FALSE)

lgPitchersData <- read.csv("lg_pitchers.csv", stringsAsFactors = FALSE)
lgHittersData <- read.csv("lg_batters.csv", stringsAsFactors = FALSE)

#망할 반대로 썼었음
ktHittersData <- read.csv("kt_batters.csv", stringsAsFactors = FALSE)
ktPitchersData <- read.csv("kt_pitchers.csv", stringsAsFactors = FALSE)


str(obHittersData)
str(obPitchersData)

CalculateCleandDataMean <- function(data)
{
  meanData <- c()
  colLength <- length(data)
  for(index in 1:colLength)
  {
    meanCalc <- mean(data[, index])
    if(is.na(meanCalc)) 
    {
      meanCalc <- c(0)
    }
    meanData <- c(meanData, meanCalc)
  }
  return (meanData)
}

GetPitchersMeanData <- function(data)
{
  data <- data[, c(1:3, 5:10, 13:15, 17:23, 25, 27:29, 31:32, 34:40)]
  return (CalculateCleandDataMean(data))
}

GetHittersMeanData <- function(data)
{
  data <- data[, c(1:3, 5:18, 22:25, 27, 29:34, 37:39)]
  return (CalculateCleandDataMean(data))
}

#두산 OB
obPlayersMeanData <- c(GetPitchersMeanData(obPitchersData), GetHittersMeanData(obHittersData))

#삼성 SS
ssPlayersMeanData <- c(GetPitchersMeanData(ssPitchersData), GetHittersMeanData(ssHittersData))

#NC NC
ncPlayersMeanData <- c(GetPitchersMeanData(ncPitchersData), GetHittersMeanData(ncHittersData))

#넥센 WO
woPlayersMeanData <- c(GetPitchersMeanData(woPitchersData), GetHittersMeanData(woHittersData))

#SK SK
skPlayersMeanData <- c(GetPitchersMeanData(skPitchersData), GetHittersMeanData(skHittersData))

#한화 HH
hhPlayersMeanData <- c(GetPitchersMeanData(hhPitchersData), GetHittersMeanData(hhHittersData))

#KIA HT
htPlayersMeanData <- c(GetPitchersMeanData(htPitchersData), GetHittersMeanData(htHittersData))

#롯데 LT
ltPlayersMeanData <- c(GetPitchersMeanData(ltPitchersData), GetHittersMeanData(ltHittersData))

#LG LG
lgPlayersMeanData <- c(GetPitchersMeanData(lgPitchersData), GetHittersMeanData(lgHittersData))

#kt KT
ktPlayersMeanData <- c(GetPitchersMeanData(ktPitchersData), GetHittersMeanData(ktHittersData))

str(baseballTeamVSTeamData)

#두산 OB
#삼성 SS
#NC NC
#넥센 WO
#SK SK
#한화 HH
#KIA HT
#롯데 LT
#LG LG
#kt KT
team1OBPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "두산")
team2OBPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "두산")

team1SSPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "삼성")
team2SSPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "삼성")

team1NCPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "NC")
team2NCPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "NC")

team1WOPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "넥센")
team2WOPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "넥센")

team1SKPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "SK")
team2SKPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "SK")

team1HHPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "한화")
team2HHPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "한화")

team1HTPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "KIA")
team2HTPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "KIA")

team1LTPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "롯데")
team2LTPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "롯데")

team1LGPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "LG")
team2LGPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "LG")

team1KTPlayedIndex <- which(baseballTeamVSTeamData$팀1 == "kt")
team2KTPlayedIndex <- which(baseballTeamVSTeamData$팀2 == "kt")

baseballTeamVSTeamDataFiltered <- baseballTeamVSTeamData[, c(2:3, 9)]
baseballTeam1WinGameIndex <- which(baseballTeamVSTeamData$팀1.점수 > baseballTeamVSTeamData$팀2.점수)
baseballTeam2WinGameIndex <- which(baseballTeamVSTeamData$팀1.점수 < baseballTeamVSTeamData$팀2.점수)
baseballNotPlayedOrDrawIndex <- which(baseballTeamVSTeamData$팀1.점수 == -1
                                      | baseballTeamVSTeamData$팀2.점수 == -1
                                      | baseballTeamVSTeamData$팀1.점수 == baseballTeamVSTeamData$팀2.점수)

dim(baseballTeamVSTeamData)
baseballDataLength <- dim(baseballTeamVSTeamData)[1]
baseballColLength <- dim(baseballTeamVSTeamData)[2]

baseballWinDummyData <- rep(0, baseballDataLength)
baseballWinDummyData[baseballTeam1WinGameIndex] <- 1
baseballWinDummyData[baseballTeam2WinGameIndex] <- 0
#baseballWinDummyData[baseballNotPlayedOrDrawIndex] <- -1

baseballTeamVSTeamDataFiltered <- cbind(baseballTeamVSTeamDataFiltered, baseballWinDummyData)
str(baseballTeamVSTeamDataFiltered)
dim(baseballTeamVSTeamDataFiltered)
baseballDataLength <- dim(baseballTeamVSTeamDataFiltered)[1]
baseballColLength <- dim(baseballTeamVSTeamDataFiltered)[2]

teamMeansDataLength <- length(obPlayersMeanData)

baseballPlayAndPlayersData <- array(data = 0, dim = c(baseballDataLength, baseballColLength + 63 + 63))
str(baseballPlayAndPlayersData)

for(row in 1:baseballDataLength)
{
  for(col in 1:baseballColLength)
  {
    baseballPlayAndPlayersData[row, col] <- baseballTeamVSTeamDataFiltered[row, col]
  }
}
#플레이한 팀들과 경기장, 승패 여부를 저장

insertDataIntoMainArray <- function(srcArry, playedIndex, playerData, teamVarious = 1)
{
  insertStartPoint = 5
  if(teamVarious == 2)
  {
    insertStartPoint = insertStartPoint + 63
  }
  
  i <- 1
  for(row in playedIndex)
  {
    t <- 0
    for(col in 1:63)
    {
      srcArry[row, t + insertStartPoint] <- playerData[col]
      t <- t + 1
    }
    i <- i + 1
  }
  return (srcArry)
}

#두산 OB
#삼성 SS
#NC NC
#넥센 WO
#SK SK
#한화 HH
#KIA HT
#롯데 LT
#LG LG
#kt KT
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1OBPlayedIndex, obPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1SSPlayedIndex, ssPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1NCPlayedIndex, ncPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1WOPlayedIndex, woPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1SKPlayedIndex, skPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1HHPlayedIndex, hhPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1HTPlayedIndex, htPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1LTPlayedIndex, ltPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1LGPlayedIndex, lgPlayersMeanData, 1)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team1KTPlayedIndex, ktPlayersMeanData, 1)

#두산 OB
#삼성 SS
#NC NC
#넥센 WO
#SK SK
#한화 HH
#KIA HT
#롯데 LT
#LG LG
#kt KT
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2OBPlayedIndex, obPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2SSPlayedIndex, ssPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2NCPlayedIndex, ncPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2WOPlayedIndex, woPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2SKPlayedIndex, skPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2HHPlayedIndex, hhPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2HTPlayedIndex, htPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2LTPlayedIndex, ltPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2LGPlayedIndex, lgPlayersMeanData, 2)
baseballPlayAndPlayersData <- insertDataIntoMainArray(baseballPlayAndPlayersData, team2KTPlayedIndex, ktPlayersMeanData, 2)

#baseballPlayAndPlayersData[, 1:3] <- as.factor(baseballPlayAndPlayersData[, 1:3])
#baseballPlayAndPlayersData[, 1:3] <- as.numeric(baseballPlayAndPlayersData[, 1:3])

baseballPlayAndPlayersData <- as.data.frame(baseballPlayAndPlayersData)

baseballPlayAndPlayersData <- baseballPlayAndPlayersData[-c(baseballNotPlayedOrDrawIndex), ]
str(baseballPlayAndPlayersData)

baseballPlayAndPlayersData.x <- baseballPlayAndPlayersData[, -c(4)]
str(baseballPlayAndPlayersData.x)

baseballPlayAndPlayersData.y <- as.data.frame(as.factor(baseballPlayAndPlayersData[, 4]))

dim(baseballPlayAndPlayersData)
baseballPlayAndPlayersDataLength <- dim(baseballPlayAndPlayersData)[1]
trainIndex <- sample(1:baseballPlayAndPlayersDataLength, round(0.7 * baseballPlayAndPlayersDataLength))

baseballPlayAndPlayersData.train <- cbind(baseballPlayAndPlayersData.x[trainIndex, ], baseballY = baseballPlayAndPlayersData.y[trainIndex, ])
str(baseballPlayAndPlayersData.y)

baseballPlayAndPlayersData.test <- cbind(baseballPlayAndPlayersData.x[-trainIndex, ], baseballY = baseballPlayAndPlayersData.y[-trainIndex, ])

baseballPlayAndPlayersData.all <- rbind(baseballPlayAndPlayersData.train, baseballPlayAndPlayersData.test)

help(matrix)
help("ctree_control")

# minCriterion <- c(0.90, 0.95, 0.99)
# minSplit <- c(10, 20, 30, 40, 50)
# maxTreeLevel <- c(1, 5, 10)
# evaluationCaseNum <- 10
# 
# decisionTreeResult <- matrix(data = 0, nrow = length(minCriterion) * length(minSplit) * length(maxTreeLevel), evaluationCaseNum)
# 
# resultStoreIndex <- 1
# for(minCriterionIndex in 1:length(minCriterion))
# {
#   for(minSplitIndex in 1:length(minSplit))
#   {
#     for(maxTreeLevelIndex in 1:length(maxTreeLevel))
#     {
#       cat("#", resultStoreIndex, "target min criterion: ", minCriterion[minCriterionIndex], "min split: ", minSplit[minSplitIndex], "limit tree level: ", maxTreeLevel[maxTreeLevelIndex], "\n")
#       
#       decisionTreeModelControl <- ctree_control(mincriterion = minCriterion[minCriterionIndex], minsplit = minSplit[minSplitIndex],
#                                          maxdepth = maxTreeLevel[maxTreeLevelIndex])
#       decisionTreeModel <- ctree(baseballY ~ ., data = baseballPlayAndPlayersData.train, controls = decisionTreeModelControl)
#       
#       decisionTreePrediction <- predict(decisionTreeModel, newdata = baseballPlayAndPlayersData.test)
#       decisionTreeResponse <- treeresponse(decisionTreeModel, newdata = baseballPlayAndPlayersData.test)
#       decisionTreeProb <- 1-unlist(decisionTreeResponse, use.names = FALSE)[seq(1, nrow(baseballPlayAndPlayersData.test) * 1.0)]
#       #str(decisionTreeProb)
#       #head(decisionTreeProb)
#       #str(baseballPlayAndPlayersData.test$baseballY)
#       decisionTreeROCR <- prediction(decisionTreeProb, baseballPlayAndPlayersData.test$baseballY)
#       
#       decisionTreeTestConfusionMatrix <- table(baseballPlayAndPlayersData.test$baseballY, decisionTreePrediction)
#       
#       #사용한 테스트 케이스
#       decisionTreeResult[resultStoreIndex, 1] <- minCriterion[minCriterionIndex]
#       decisionTreeResult[resultStoreIndex, 2] <- minSplit[minSplitIndex]
#       decisionTreeResult[resultStoreIndex, 3] <- maxTreeLevel[maxTreeLevelIndex]
#       
#       #특이도 구하기
#       specificity <- decisionTreeTestConfusionMatrix[2, 2] / sum(decisionTreeTestConfusionMatrix[2, ])
#       decisionTreeResult[resultStoreIndex, 4] <- specificity
#       
#       #정밀도 구하기
#       precision <- decisionTreeTestConfusionMatrix[2, 2] / sum(decisionTreeTestConfusionMatrix[, 2])
#       decisionTreeResult[resultStoreIndex, 5] <- precision
#       
#       #민감도 구하기
#       sensitivity <- decisionTreeTestConfusionMatrix[1, 1] / sum(decisionTreeTestConfusionMatrix[1, ])
#       decisionTreeResult[resultStoreIndex, 6] <- sensitivity
#       
#       #정확도 구하기
#       accuracy <- sum(decisionTreeTestConfusionMatrix[1, 1] + decisionTreeTestConfusionMatrix[2, 2]) / sum(decisionTreeTestConfusionMatrix)
#       decisionTreeResult[resultStoreIndex, 7] <- accuracy
#       
#       #F1 measure 이게 뭐지
#       decisionTreeResult[resultStoreIndex, 8] <- 2 * specificity * precision / (specificity + precision)
#       
#       #AUROC
#       decisionTreeResult[resultStoreIndex, 9] <- unlist(performance(decisionTreeROCR, "auc")@y.values)
#       
#       #종단 노드
#       decisionTreeResult[resultStoreIndex, 10] <- length(nodes(decisionTreeModel, unique(where(decisionTreeModel))))
#       
#       resultStoreIndex <- resultStoreIndex + 1
#     }
#   }
# }
# 
# head(decisionTreeResult)
# decisionTreeResultData <- decisionTreeResult[order(decisionTreeResult[, 9], decreasing = TRUE), ]
# head(decisionTreeResultData)

# decisionTreeModel <- ctree(baseballY ~ ., data = baseballPlayAndPlayersData.train)
# decisionTreeModel
# table(predict(decisionTreeModel), baseballPlayAndPlayersData.train$baseballY)
# 
# plot(decisionTreeModel)

#nbModel <- naiveBayes()