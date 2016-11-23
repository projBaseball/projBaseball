library(e1071)
data(iris)
m <- naiveBayes(Species ~ ., data = iris)
m
plot(m)

m <- naiveBayes(Species ~ ., data = iris, usekernel = TRUE)
plot(m)
m
