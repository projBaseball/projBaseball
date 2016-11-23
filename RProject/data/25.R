library(nnet)

data(iris)

m <- multinom(Species ~ ., data = iris)

head(fitted(m))

predict(m, newdata = iris[c(20, 80, 120), ], type = "class")

predict(m, newdata = iris[c(20, 80, 120), ], type = "probs")

predicted <- predict(m, newdata = iris)

print(predicted)

multiTable <- xtabs(~ predicted + iris$Species)

mutliMargin <- margin.table(multiTable)

propTable <- prop.table(multiTable)

propTable
