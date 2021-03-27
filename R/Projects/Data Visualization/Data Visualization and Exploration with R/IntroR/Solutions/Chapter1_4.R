#working with matrices
matrx <- matrix(c(2,4,3,1,5,7), nrow=2, ncol=3, byrow=TRUE)
matrx
colnames(matrx) <- c("POP2000", "POP2005", "POP2010")
matrx[2,3]
matrx[2,]
matrx[,3]
matrx[,c(1,3)]
matrx[, "POP2005"]
colSums(matrx)
colMeans(matrx)

#working with data frames
data()
data("USArrests")
USArrests
USArrests$Assault
USArrests[50,2]
USArrests[50,]