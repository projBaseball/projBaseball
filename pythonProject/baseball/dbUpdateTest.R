library(RMySQL)
library(C50)
library(caret)

args = commandArgs(trailingOnly = FALSE)
args

parameterStartPoint = 0
index = 0
for(index in 1:length(args))
{
  if(args[index] == "ok")
  {
    parameterStartPoint = index
  }
}
#query = "insert into baseballModelLog(orderUniqueKey, orderResult, team1, team2) value('"
#query = paste(query, args[parameterStartPoint + 1], sep = "")
#query = paste(query, "','", sep = "")
#query = paste(query, args[parameterStartPoint + 2], sep = "")
#query = paste(query, "','", sep = "")
#query = paste(query, args[parameterStartPoint + 3], sep = "")
#query = paste(query, "','", sep = "")
#query = paste(query, args[parameterStartPoint + 4], sep = "")
#query = paste(query, "');")

#str(args)

targetProcessUniqueKey <- args[parameterStartPoint + 1]
#targetProcessUniqueKey

targetModelingYear <- args[parameterStartPoint + 2]
targetModelingYear <- as.integer(targetModelingYear)
#str(targetModelingYear)


setwd("C:/Users/stories2/Desktop/DATA")

baseballTeamData <- read.csv("all2.csv", stringsAsFactors = FALSE)
#head(baseballTeamData)
#str(baseballTeamData)

IndexOf2016Year <- which(baseballTeamData$YEAR == targetModelingYear)
#IndexOf2003to2002Years <- which(baseballTeamData$YEAR <= 2001)

baseballTeamNameData <- baseballTeamData[, c(2:3)]
baseballTeamNameDataIndex <- which(baseballTeamData$YEAR == targetModelingYear)
baseballTeamNameData <- baseballTeamNameData[baseballTeamNameDataIndex, ]

baseballTeamData <- baseballTeamData[, -c(1:3, 6:8, 11:12)]
#baseballTeamData <- baseballTeamData[-IndexOf2003to2002Years, ]
#str(baseballTeamData)
#head(baseballTeamData)

#trainIndex <- createDataPartition(y = baseballTeamData$醫낇빀?닚?쐞, p = 0.7, list = FALSE)
#trainData <- baseballTeamData[trainIndex, ]
#testData <- baseballTeamData[-trainIndex, ]

trainData <- baseballTeamData[-IndexOf2016Year, ]
testData <- baseballTeamData[IndexOf2016Year, ]

dataColNum <- dim(baseballTeamData)[2]

trainDataX <- trainData[, 2:dataColNum]
trainDataY <- as.factor(trainData[, 1])

c50Model <- C5.0(trainDataX, trainDataY)
#summary(c50Model)
#c50Model
#plot(c50Model)

testDataX <- testData[, 2:dataColNum]
testDataY <- testData[, 1]

c50ModelPred <- predict(c50Model, newdata = testDataX, type = "class")
c50ModelPred
summary(c50ModelPred)

sum(c50ModelPred == testDataY) / length(c50ModelPred)

#dim(c50ModelPred)
#length(c50ModelPred)
#c50ModelPred
query = "insert into baseballModelLog(orderUniqueKey, order1, order2, order3, order4, order5, order6, order7, order8, order9, order10, team1, team2, team3, team4, team5, team6, team7, team8, team9, team10) values('"
query <- paste(query, targetProcessUniqueKey, "'," , sep = "")
for (sortOfTeamRank in 1:(length(c50ModelPred) - 1))
{
  query <- paste(query, c50ModelPred[sortOfTeamRank], ",", sep = "")
  #print(query)
}
query <- paste(query, c50ModelPred[length(c50ModelPred)], ",'", sep = "")
#baseballTeamNameData
for (sortOfTeamRank in 1:(length(c50ModelPred) - 1))
{
  query <- paste(query, baseballTeamNameData[sortOfTeamRank, 1], "','", sep = "")
 # print(query)
}
query <- paste(query, baseballTeamNameData[length(c50ModelPred), 1], "');", sep = "")
#query
query <- iconv(query, to = "UTF-8")
query

#plot(c50ModelPred)
#plot(testDataY)

#plot(c50Model, type = "simple")


dbConnection = dbConnect(dbDriver("MySQL"), host = "lamb.kangnam.ac.kr", dbname = "stories2", user = "stories2", password = "toortoor%^%")
dbGetQuery(dbConnection, "SET NAMES utf8")
dbResult <- dbGetQuery(dbConnection, query)
dbDisconnect(dbConnection)
