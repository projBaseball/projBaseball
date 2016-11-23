#지도학습의 나이브베이지안
performanceTester <- function(confusionMatrix) 
{
  YYNN <- (confusionMatrix[2, 2] + confusionMatrix[1, 1]) / sum(confusionMatrix)
  #정확도
  YYC <- confusionMatrix[2, 2] / sum(confusionMatrix[, 2])
  #정밀도
  YNR <- confusionMatrix[2, 1] / sum(confusionMatrix[1, ])
  #특이도
  YYR <- confusionMatrix[2, 2] / sum(confusionMatrix[2, ])
  #민감도
  
  BCR = sqrt(YYNN * YNR)
  
  return (c(YYNN, YYC, YNR, YYR))
}
library(e1071)


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


