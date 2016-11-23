install.packages("nnet")

library(nnet)
m <- multinom(Species ~ ., data = iris)

head(fitted(m))

predict(m, newdata = iris[c(1, 51, 100), ], type = "class")

predict(m, newdata = iris, type = "probs")

predicted <- predict(m, newdata = iris)
sum(predicted == iris$Species) / NROW(iris)

xtabs(~ predicted + iris$Species)
