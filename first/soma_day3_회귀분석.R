# Working directory ì§€? •
getwd()
setwd("C:/?˜?¬ë¬¸ì„œ/SWë©˜í† ë§?/ê°•ì˜?ë£?")

# ?‹¤?Šµ 1: ? „ì§„ì„ ?ƒ/?›„ì§„ì†Œê±?/?‹¨ê³„ì ?„ ?ƒ ------------------------------------
# ë¶„ì„?— ?•„?š”?•œ ?Œ¨?‚¤ì§€ ?„¤ì¹? ë°? ë¶ˆëŸ¬?˜¤ê¸?
# Multivariate linear regression
corolla <- read.csv("C:/Users/stories2/Documents/RProject/ToyotaCorolla.csv")
head(corolla)
tail(corolla)
class(corolla)
dim(corolla)
summary(corolla)

# Indices for the activated input variables
dim(corolla)[1]
dim(corolla)[2]
nCar <- dim(corolla)[1]
nVar <- dim(corolla)[2]

id_idx <- c(1,2)
category_idx <- 8

# ë²”ì£¼?˜• ë³€?ˆ˜ë¥? ?´ì§„í˜• ë³€?ˆ˜ë¡? ë³€?™˜
dummy_p <- rep(0,nCar)
dummy_d <- rep(0,nCar)
dummy_c <- rep(0,nCar)

p_idx <- which(corolla$Fuel_Type == "Petrol")
d_idx <- which(corolla$Fuel_Type == "Diesel")
c_idx <- which(corolla$Fuel_Type == "CNG")

dim(p_idx)
head(p_idx)

dummy_p[p_idx] <- 1
dummy_d[d_idx] <- 1
dummy_c[c_idx] <- 1

Fuel <- data.frame(dummy_p, dummy_d, dummy_c)
names(Fuel) <- c("Petrol","Diesel","CNG")

# Prepare the data for
head(corolla[,-c(id_idx, category_idx)])
mlr_data <- cbind(corolla[,-c(id_idx, category_idx)], Fuel)
head(mlr_data)

# Split the data into the training/validation sets
trn_idx <- sample(1:nCar, round(0.7*nCar))

trn_data <- mlr_data[trn_idx,]
val_data <- mlr_data[-trn_idx,]

str(trn_data)

# Train the MLR
full_model <- lm(Price ~ ., data = trn_data)
full_model
summary(full_model)

full_model <- lm(Price ~ KM+HP, data = trn_data)
full_model
summary(full_model)

# Plot the result
plot(trn_data$Price, fitted(full_model), xlim = c(4000,35000), ylim = c(4000,35000))
abline(0,1,lty=3)


# ë³€?ˆ˜?„ ?ƒ 1: ? „ì§„ì„ ?ƒë²?
# Upperbound formula ë§Œë“¤ê¸?
help(step)
tmp_x <- paste(colnames(trn_data)[-1], collapse=" + ")
tmp_x
tmp_xy <- paste("Price ~ ", tmp_x, collapse = "")
tmp_xy
as.formula(tmp_xy)


forward_model <- step(lm(Price ~ 1, data = trn_data), 
                      scope = list(upper = as.formula(tmp_xy), lower = Price ~ 1), direction="forward", trace=1)
summary(forward_model)
anova(forward_model)

# ê°? ?‹¨ê³„ì—?„œ ?„ ?ƒ?œ ë³€?ˆ˜ ?‘œ?‹œ
forward_model$anova$Step
forward_model$anova$AIC


# ë³€?ˆ˜?„ ?ƒ 2: ?›„ì§„ì†Œê±°ë²•
backward_model <- step(full_model, scope = list(upper = as.formula(tmp_xy), lower = Price ~ 1), direction="backward", trace=1)
summary(backward_model)
anova(backward_model)

# ê°? ?‹¨ê³„ì—?„œ ? œê±°ëœ ë³€?ˆ˜ ?‘œ?‹œ
backward_model$anova$Step
backward_model$anova$AIC


# ë³€?ˆ˜?„ ?ƒ 3: ?‹¨ê³„ì  ?„ ?ƒë²?
stepwise_model <- step(lm(Price ~ 1, data = trn_data), 
                       scope = list(upper = as.formula(tmp_xy), lower = Price ~ 1), direction="both", trace=1)
summary(stepwise_model)
anova(stepwise_model)


# ê°? ?‹¨ê³„ì—?„œ ?„ ?ƒ/? œê±°ëœ ë³€?ˆ˜ ?‘œ?‹œ
stepwise_model$anova$Step
stepwise_model$anova$AIC


# ê²€ì¦? ?°?´?„°?— ??€?•œ ê°? ë³€?ˆ˜?„ ?ƒ ê²°ê³¼?˜ ?˜ˆì¸? ? •?™•?„ ë¹„êµ
full_haty <- predict(full_model, newdata = val_data)
forward_haty <- predict(forward_model, newdata = val_data)
backward_haty <- predict(backward_model, newdata = val_data)
stepwise_haty <- predict(stepwise_model, newdata = val_data)

# ?šŒê·€ë¶„ì„ ?˜ˆì¸¡ì„±?Š¥ ?‰ê°€ì§€?‘œ
# 1: Mean squared error (MSE)
perf_mat <- matrix(0,4,4)
perf_mat[1,1] <- mean((val_data$Price-full_haty)^2)
perf_mat[1,2] <- mean((val_data$Price-forward_haty)^2)
perf_mat[1,3] <- mean((val_data$Price-backward_haty)^2)
perf_mat[1,4] <- mean((val_data$Price-stepwise_haty)^2)

# 2: Root mean squared error (RMSE)
perf_mat[2,1] <- sqrt(mean((val_data$Price-full_haty)^2))
perf_mat[2,2] <- sqrt(mean((val_data$Price-forward_haty)^2))
perf_mat[2,3] <- sqrt(mean((val_data$Price-backward_haty)^2))
perf_mat[2,4] <- sqrt(mean((val_data$Price-stepwise_haty)^2))

# 3: Mean absolute error (MAE)
perf_mat[3,1] <- mean(abs(val_data$Price-full_haty))
perf_mat[3,2] <- mean(abs(val_data$Price-forward_haty))
perf_mat[3,3] <- mean(abs(val_data$Price-backward_haty))
perf_mat[3,4] <- mean(abs(val_data$Price-stepwise_haty))

# 4: Mean absolute percentage error (MAPE)
perf_mat[4,1] <- mean(abs((val_data$Price-full_haty)/val_data$Price))*100
perf_mat[4,2] <- mean(abs((val_data$Price-forward_haty)/val_data$Price))*100
perf_mat[4,3] <- mean(abs((val_data$Price-backward_haty)/val_data$Price))*100
perf_mat[4,4] <- mean(abs((val_data$Price-stepwise_haty)/val_data$Price))*100

# ë³€?ˆ˜?„ ?ƒ ê¸°ë²• ê²°ê³¼ ë¹„êµ
rownames(perf_mat) <- c("MSE", "RMSE", "MAE", "MAPE")
colnames(perf_mat) <- c("All", "Forward", "Backward", "Stepwise")
perf_mat

