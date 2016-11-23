A <- c(1, 2, 3)
B <- c(1, "A", 0.5)

//해당 백터의 타입
mode(A)
mode(B)

A[1]
A[2:3]
A[c(2, 3)]

B[1]
B[2:3]
B[c(2, 3, 2)]

names(A)
names(B)

names(A) <- c("a", "b", "c")
names(A)

A[1]
A["a"]

B <- c(2, 4, 6, 8)
names(B) <- c("Kim", "Jin", "Jun", "Im")
B["Im"]

listA <- list(1, 2, "a")
print(listA)
listA[[1]]
listA[[2]]
listA[c(1, 2)]

names(listA)
names(listA) <- c("A", "B", "C")
listA
listA$A
listA[["A"]]


A <- 1:6
A
dim(A)
print(A)

dim(A) <- c(2, 3) #2행 3열로 바꾸겠다 
A
B <- list(1, 2, 3, 4, 5, 6)
print(B)
dim(B)
dim(B) <- c(2, 3) # 채우는건 세로로
print(B)
dim(B)

D <- 1:12
dim(D) <- c(2, 3, 2)
print(D)

A <- c("c", "k", "a")
B <- as.factor(A)
print (A)
print (B)

mode(A)
mode(B)

A[1] + A[2]#문자형이니까 당연 실패
B[1] + B[2]#레벨을 더할 순 없음

A <- c(1, 2, 3)
D <- c("a", "b", "c")
C <- data.frame(A, D)
C

C[[1]]
C[[2]]
C[1, 2]
C$D[2]

C <- data.frame(A, D, stringsAsFactors = FALSE)
C
C[[1]]
C[[2]]
C[1, 2]
C$D[2]
