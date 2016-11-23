x <- c(1, 2, 3, 4)
x
x <- c(x[1:3], 10, x[4])
x
length(x)
structure(x)
class(x)
c(1, 2, 4) + c(10, 11, 12, 13, 14) # 1, 2, 4, 1, 2
x <- matrix(1:6, nrow = 3, ncol = 2)
x
x <- matrix(1:8, 4, 2)
x
x <- matrix(1:8, 2, 4)
x

#x <- matrix(1:9, 4, 2)
x + c(1:2)
x + c(3:5)

x <- matrix(1:9, 3, 3)
x + c(3:5)

x <- c(1, 2, 3)
y <- c(10, 20, 30)

x + y
x * y
x %% y
x / y 

y <- c(10, 20, 30, 40, 50)
y[c(1, 3)]
y[2:3]
v <- 2:3
y[v]
v
y[c(1, 2, 1, 3)]
y[-5]
y[-length(y)]
y[-c(1:2)]

# 
x <- 1:5
y <- 5:1
z <- 2
1:z-1
1:(z-1)

#연속 시킴
seq(from = 12, to = 30, by = 3)
seq(from = 12, to = 30, by = 4)
seq(from = 1.1, to = 2, length = 10)

#각각의 숫자를 반복
rep(10, 5)
rep(c(10, 20, 30), 3)
rep(1:3, 3)
rep(c(10, 20, 30), each = 3)

x <- 1:10
x > 8
any(x > 5)
any(x > 20)
all(x > 5)
all(x > 0)

x <- c(1, 2, NA, 4, 5)
y <- c(1, 2, NULL, 4, 5)
mean(x)
mean(x, na.rm = TRUE)
mean(y)

x <- c(1, 2, NA, 4, 5)
x[x > 2]
subset(x, x > 2)
x <- c(10, 20, NA, 40, 50)
x[x > 20]
subset(x, x > 20)
which(x > 20)

A = matrix(1:15, 5, 3)
A

B = matrix(1:15, nrow = 5, byrow = TRUE)
B

C = matrix(nrow = 2, ncol = 2)
C[1, 1] = 1
C[1, 2] = 2
C[2, 1] = 3
C[2, 2] = 4
C

A = matrix(1:4, nrow = 2, ncol = 2)
B = matrix(seq(from = 2, to = 8, by = 2), nrow = 2, ncol = 2)
A
B
A * B
A %*% B
A * 3
A + B

C = matrix(1:15, nrow = 5, ncol = 3)
C
C[3, 2]
C[2, ]
C[, 3]
C[2:4, 2:3]
C[-1, ]
C[1, ] <- c(10, 20, 30)
C

A <- matrix(c(1:6), nrow = 3, ncol = 2)
apply(A, 1, mean) #행의 평균
apply(A, 2, mean) #열의 평균
apply(A, 1, help(mean))

A <- matrix(c(1:6), nrow = 3, ncol = 2)
B <- matrix(c(7:12), nrow = 3, ncol = 2)
A
B
rbind(A, B)
cbind(A, B)
cbind(A[, 1], B[, 2])

A <- matrix(c(1:6), nrow = 3, ncol = 2)
A
B <- A[1, ]
B
attributes(B)
attributes(A)

C <- A[1, , drop = FALSE]
C
attributes(C)

dim(C)

D <- as.matrix(A[1, ])
D
attributes(D)

A <- matrix(c(1:6), nrow = 3, ncol = 2)
colnames(A)
rownames(A)
colnames(A) <- c("1st", "2nd")
rownames(A) <- c("First", "Second", "Third")
A
A[, "1st", drop = FALSE]

A <- matrix(c(1:15), nrow = 5, ncol = 3)
B <- matrix(c(11:25), nrow = 5, ncol = 3)
A
B
C <- array(data = c(A, B), dim = c(3, 2, 2)) # 3행 2열 2차원 
C

A <- list(name = "kang", salary = 10000, union = TRUE)
A
A$name

B <- list("kang", 10000, TRUE)
B
B[[1]]
B[1]

C <- vector(mode = "list")
C[["name"]] <- "kang"
C[["salary"]] <- 10000
C[["union"]] <- TRUE
C

C$name
C[["name"]]
C[[1]]

C1 <- C[[1]]
class(C1)
C1
C2 <- C[1]
class(C2)
C2

C$office <- "frontier"
C
C$location <- "선릉"
C

C$salary <- NULL
C

tmplist <- list(a = list(1:5, c("a", "b", "c")), b = "z", c = NA)
tmplist
unlist(tmplist)#R이 제공하는 이름으로 재정의
unlist(tmplist, use.names = FALSE)#그 이름도 삭제

A <- list(1:3, 25:29)
A
lapply(A, median)#리스트로 출력
sapply(A, median)#백터로 출력
