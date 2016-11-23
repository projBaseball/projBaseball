split(iris, iris$Species)
subset(iris, Species == "setosa")
subset(iris, Species == "virginica")

r <- 1

#10 % 2
10 %% 3
#if()
#{

#  printf("")
#}

x <- read.table(header = TRUE, text = '
                TEAM HIT
                KIA 202
                LG 197
                NC 210
                SK 179')

x
dim(x)
r <- 1
if(r %% 2 == 1)
{
  print("r is odd")
}else{
  print("r is even")
}

x <- 1:10
y <- ifelse(x %% 2 == 0, "even", "odd")
y


n <- c(5, 10, 15)
for(i in n) {
  print(i^2)
}

i <- 1
while(i <= 10) {
  i <- i + 4
  print(i)
}

i <- 1
repeat {
  i <- i + 4
  print(i)
  if(i > 10) break
}

grid <- matrix(0, nrow = 9, ncol = 9)
for(parentIndex in 1:9) {
  for(sunIndex in 2:9) {
    grid[parentIndex, sunIndex] = parentIndex * sunIndex
  }
}
grid

cnt <- c(0)
sumData <- c(0)
while(cnt < 10) {
  cnt <- cnt + 1
  sumData <- sumData + cnt
}
sumData

a <- c(1, 4, 5, 3, 5, 3, 7)
sort(a)

order(a)

sort(a, decreasing = TRUE)
order(a, decreasing = TRUE)

tmp <- data.frame(AA = c("A", "A", "B", "C", "D"), BB = c(5, 3, 6, 1, 2))
tmp
str(tmp)
tmp[order(tmp$BB), ]
tmp[order(tmp$BB, decreasing = TRUE), ]

A <- data.frame(Team = c("KIA", "LG", "NC", "SK"), HIT = c(202, 197, 210, 179), stringsAsFactors = FALSE)
B <- data.frame(Tm = c("LG", "KIA", "SK", "KT"), HR = c(159, 178, 146, 177), stringsAsFactors = FALSE)

help(merge)
merge(A, B)
A
B
dim(A)
merge(A, B, all = TRUE)
merge(A, B, all.x = TRUE)
merge(A, B, all.y = TRUE)

merge(x = A, y = B, by.x = "Team", by.y = "Tm")

A <- read.table(header = TRUE, text = '
                TEAM HIT
                KIA 202
                LG 197
                NC 210
                SK 179')

B <- read.table(header = TRUE, text = '
                TEAM HR
                LG 159
                KIA 178
                SK 146
                KT 177')

install.packages("arules")
install.packages("arulesViz")
install.packages("wordcloud")

library(arules)
library(arulesViz)
library(wordcloud)

titanic <- read.delim("C:\\Users/stories2/Documents/RProject/titanic.txt", dec = ",")
titanic

str(titanic)
head(titanic)
tail(titanic)

titanicExceptName <- titanic[, 2:5]

str(titanicExceptName)

titanicExceptName$Age <- as.character(titanicExceptName$Age)
