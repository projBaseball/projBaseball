baseball = read.csv("C:/Users/stories2/Documents/RProject/종합.csv")
baseball
#install.packages("nnet")
#로지스틱회귀분석
library(nnet)
nRows <- dim(baseball)[1]
nVar <- dim(baseball)[2]
dim(baseball)

id_idx <- c(1,3)

baseball_ar <- baseball[,-c(id_idx)]
baseball_ar
dim(baseball_ar)
help(sample)
head(baseball_ar)
str(baseball_ar)

trn_idx <- sample(1:nRows, round(0.7*nRows))

trn_data <- baseball_ar[trn_idx,]
val_data <- baseball_ar[-trn_idx,]
(m <- multinom(trn_data$종합순위 ~ . , data=trn_data, MaxNWts=100000, maxit=1000))

#AIC가 작을수록 좋음
head(fitted(m))

predict(m, newdata = val_data, type = "probs")
predicted <- predict(m, newdata=val_data)
sum(predicted == val_data$종합순위) / NROW(predicted)

xtabs(~predicted+val_data$종합순위)

tmp_table <- xtabs(~predicted + val_data$종합순위)
tmp_table
tmp_margin <- margin.table(tmp_table)
tmp_margin
prop_table <- prop.table(tmp_table)


stepwise_model <- step(multinom(종합순위 ~ 1, data = trn_data, MaxNWts=100000, maxit=1000), 
                       scope = list(upper = as.formula(paste("종합순위 ~ ", paste(colnames(trn_data)[-1], collapse=" + "), collapse = "")), lower = 종합순위 ~ 1), direction="both", trace=1, steps = 10000)
summary(prop_tablestepwise_model)
anova(stepwise_model)


#전진선택법
forward_model <- step(multinom(종합순위 ~ 1, data = trn_data, MaxNWts=100000, maxit=1000), 
                      scope = list(upper = as.formula(paste("종합순위 ~ ", paste(colnames(trn_data)[-1], collapse=" + "), collapse = ""))), direction="forward", trace=1)
summary(forward_model)

# 각 단계에서 선택된 변수 표시
forward_model$anova$Step
forward_model$anova$AIC

# 변수선택 2: 후진소거법
#backward_model <- step(multinom(종합순위 ~ . , data = trn_data, MaxNWts=100000, maxit=1000), 
#                       scope = list(upper = as.formula(paste("종합순위 ~ ", paste(colnames(trn_data)[-1], collapse=" + "), collapse = "")), lower = 종합순위 ~ 1), direction="backward", trace=1)
#summary(backward_model)


plot(val_data$종합순위, predicted , xlim=c(0,10), ylim=c(0,10))
abline(0,1,lyt=3)

length(fitted(m))
length(trn_data$종합순위)
length(m)
length(val_data)
help(plot)
predicted

