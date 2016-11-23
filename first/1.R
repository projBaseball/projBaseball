#hello



print ("Hello World")
help(mean)
?mean
help(min)
getwd()
setwd("c:/Rstudy/")
getwd()
baseballData = read.csv("c:/Rstudy/data.csv", stringsAsFactors = FALSE)
baseballData
M <- matrix(1:6, 3, 2)
A <- array(1:12, dim=c(3,2,2))
names <- c("TOM", "John")
ages <- c(23, 19)
combi <- data.frame(names, ages)

#data input
str(baseballData)
head(baseballData, 10)
tail(baseballData, 10)

baseball = baseballData[, -1: -3]#- : data remove, that we can use data
str(baseball)
head(baseball)
tail(baseball)

#요약 통계량(기술통계량)
summary(baseball)
#median : 중앙값, 값의 범위를 넘으면 아웃라이어, 1st q는 1/4지점, mean평균
#avaerg
mean(baseball[,6])
mean(baseball$H)#컬럼 명을 직접 쓸땐 $ 표시

#middle value
median(baseball[,6])

#평균에서 떨어진 정도를 구함 (분산)
var(baseball$PA)

#표준편차
sd(baseball[,6])

install.packages("e1071")
library(e1071)

#왜도
skewness(baseball[,6])
hit = baseball[,6]
skewness(hit)

#첨도
kurtosis(baseball$H)
kurtosis(hit)

#안타에 대한 히스토그램
hist(hit)


install.packages("ggplot2")
library(ggplot2)
ggplot(baseball, aes(x=H)) + geom_histogram(binwidth = 2, colour="orange", fill="green")

#산점도
#흩어진 정도를 그래프로 그리겠다
plot(baseball$G, baseball$H)


#상관계수
cor(baseball$G, baseball$H)

#공분산
cov(baseball$G, baseball$H)

install.packages("caret")
library(caret)

BRG = read.csv("c:/Rstudy/dataRegression.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
BRG
attach(BRG)

head(BRG)
tail(BRG)
summary(BRG)

plot(H, G)
cor(H, G)
cov(H, G)

plot(G, H)
cor(G, H)
cov(G, H)
#회귀직선 리니어 모델
#(종속변수 독립변수, ...)
#(종속변수 , ) : 전체를 독립변수로 ㄷ
model = lm(G ~ H)
model
#intercept 상수, g가 기울기
help(lm)
plot(H,G)
abline(model)

