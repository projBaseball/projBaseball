x <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2))
x
unlist(x)
x <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2))
do.call(rbind, x)
y <- list(data.frame(name = "foo", value = 1), data.frame(name = "bar", value = 2))
y
x <- data.frame(name = "foo", value = 1)
x
lapply(iris[, 1:4], mean)
str(iris)
iris
head(iris)
tail(iris)
tail(iris, 10)
class(iris)
lapply(iris[, 1:4], mean)
sapply(iris[, 1:4], mean)
class(sapply(iris[, 1:4], mean))
class(lapply(iris[, 1:4], mean))

x <- sapply(iris[, 1:4], mean)
as.data.frame(x)
as.data.frame(t(x))
help(t)

y <- sapply(iris[, 1:4], function(x) {x > 3})
class(y)
head(y)

kids <- c("jack", "kim")
ages <- c(24, 21)
d <- data.frame(kids, ages, stringsAsFactors = FALSE)
d
class(kids)

d[[1]]
class(d[[1]])
d$kids
d[, 1]
d[1]
class(d[1])

d[, 2]

kids <- c("jack", "jill", "laura")
ages <- c(12, 10, 19)
dfa <- data.frame(kids, ages, stringsAsFactors = FALSE)
kids <- c("alice", "jill", "laura")
state <- c("ma", "ny", "ca")
dfb <- data.frame(kids, state, stringsAsFactors = FALSE)
dfa
dfb

merge(dfa, dfb)#공통된 값들 합치기
merge(dfa, dfb, all = TRUE)#그냥 모든 값들 합치기
merge(dfa, dfb, all.x = TRUE)#왼쪽에 있는 dfa 를 기준으로 모든 값들 합치기
merge(dfa, dfb, all.y = TRUE)#오른쪽에 있는 dfb를 기준으로 모든 값 합치기

firstname <- c("alice", "jill", "laura")
state <- c("ma", "ny", "ca")
dfc <- data.frame(firstname, state, stringsAsFactors = FALSE)
dfc

merge(x = dfa, y = dfc, , "kids", "firstname")

x <- data.frame(name = c("a", "b", "c"), math = c(1, 2, 3))
y <- data.frame(name = c("d", "b", "a"), english = c(4, 5, 6))
merge(x, y)

cbind(x, y)

merge(x, y, all = TRUE)

x <- c(5, 12, 13, 12)
xFactor <- factor(x)
xFactor
str(xFactor)
unclass(xFactor)
length(xFactor)

yFactor <- factor(x, levels = c(5, 12, 13, 88))
yFactor

yFactor[2] <- 88
yFactor

yFactor[2] <- 20
yFactor

ages <- c(25, 26, 55, 37, 21, 42)
affils <- c("r", "d", "d", "r", "u", "d")
tapply(ages, affils, mean)

gender <- c("M", "M", "F", "M", "F", "F")
age <- c(47, 59, 21, 32, 33, 24)
income <- c(55000, 88000, 32450, 76500, 123000, 45650)
temp <- data.frame(gender, age, income)
temp$over25 <- ifelse(temp$age > 25, 1, 0)
temp

tapply(temp$income, list(temp$gender, temp$over25), mean)

tapply(1:10, rep(1, 10), sum)
tapply(iris$Sepal.Length, iris$Species, mean)
