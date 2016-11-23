toyotaData<- read.csv("C:/Users/stories2/Documents/RProject/ToyotaCorolla.csv", stringsAsFactors = FALSE)
toyotaData
dim(toyotaData)
class(toyotaData)
head(toyotaData, 10)
summary(toyotaData)

dim(toyotaData)[1]
dim(toyotaData)[2]

dieselTypeIndex <- which(toyotaData$Fuel_Type == "Diesel")
petrolTypeIndex <- which(toyotaData$Fuel_Type == "Petrol")
cngTypeIndex <- which(toyotaData$Fuel_Type == "CNG")

head(dieselTypeIndex)
head(petrolTypeIndex)
head(cngTypeIndex)

dieselDumpCol <- rep(0, dim(toyotaData)[1])
petrolDumpCol <- rep(0, dim(toyotaData)[1])
cngDumpCol <- rep(0, dim(toyotaData)[1])

dieselDumpCol[dieselTypeIndex] <- 1
petrolDumpCol[petrolTypeIndex] <- 1
cngDumpCol[cngTypeIndex] <- 1

toyotaDataWithNoCharacter <- toyotaData[, -c(1:2, 8)]
head(toyotaDataWithNoCharacter)

toyotaDataWithNoCharacter <- cbind(toyotaDataWithNoCharacter, data.frame(dieselDumpCol, petrolDumpCol, cngDumpCol))
head(toyotaDataWithNoCharacter)

trainIndex <- sample(1:dim(toyotaData)[1], round(0.7 * dim(toyotaData)[1]))
head(trainIndex)

trainData <- toyotaDataWithNoCharacter[trainIndex, ]
testData <- toyotaDataWithNoCharacter[-trainIndex, ]
head(trainData)
head(testData)

fullModel <- lm(Price ~ ., data = trainData)
fullModel
summary(fullModel)

someModel <- lm(Price ~ ABS+cc+Automatic, data = trainData)
someModel
summary(someModel)
#R-squared , p-value

