library(Matrix)

setwd('/Applications/XCodeProjects/RecommendingWeb/DataCreator') # à modifier selon la machine
u.data <- read.csv(file='data.csv', sep=',', header=T)

#m.sparse <- sparseMatrix(u.data[,1],u.data[,2],x=u.data[,3])
#rownames(m) <- paste('u', 1:nrow(m), sep='')
#colnames(m) <- paste('i', 1:ncol(m), sep='')
#m <- as.matrix(m.sparse)
#m[m==0] <- NA


