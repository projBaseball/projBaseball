#자료 제공 
#https://data.kma.go.kr/data/grnd/selectAsosList.do?pgmNo=34
#https://ko.wikipedia.org/wiki/대한민국의_야구장_목록

setwd("C:/Users/stories2/Documents/RProject/")
getwd()

gwangjuWeather <- read.csv("광주/SURFACE_ASOS_156_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(gwangjuWeather)

daeguWeather <- read.csv("대구/SURFACE_ASOS_281_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(daeguWeather)

daejeonWeather <- read.csv("대전/SURFACE_ASOS_133_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(daejeonWeather)

busanWeather <- read.csv("부산/SURFACE_ASOS_159_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(busanWeather)

seoulWeather <- read.csv("서울/SURFACE_ASOS_108_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(seoulWeather)

suwonWeather <- read.csv("수원/SURFACE_ASOS_119_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(suwonWeather)

incheonWeather <- read.csv("인천/SURFACE_ASOS_112_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(incheonWeather)

changwonWeather <- read.csv("창원/SURFACE_ASOS_155_DAY_2010_2016_2016.csv", stringsAsFactors = FALSE)
str(changwonWeather)

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

teamNO1WinIndex <- which(baseballTeamVSTeamData$팀1.점수 > baseballTeamVSTeamData$팀2.점수 & 
                           (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNO1LoseIndex <- which(baseballTeamVSTeamData$팀1.점수 < baseballTeamVSTeamData$팀2.점수& 
                            (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNO1DrawIndex <- which(baseballTeamVSTeamData$팀1.점수 == baseballTeamVSTeamData$팀2.점수& 
                            (baseballTeamVSTeamData$팀1.점수 >= 0 & baseballTeamVSTeamData$팀2.점수 >= 0))
teamNotPlayedIndex <- which(baseballTeamVSTeamData$팀1.점수 < 0 & baseballTeamVSTeamData$팀2.점수 < 0)
str(baseballTeamVSTeamData)

splitedDate <- (strsplit(baseballTeamVSTeamData$날짜, "[ ]"))
str(splitedDate)
head(splitedDate[[2]][1])
