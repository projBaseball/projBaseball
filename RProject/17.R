install.packages("DBI")
install.packages("RMySQL", type = "source")

library(RMySQL)
R.version

dbConnection <- dbConnect(dbDriver("MySQL"), host = "lamb.kangnam.ac.kr", dbname = "stories2", user = "stories2", password = "toortoor%^%")
testQuery <- dbGetQuery(dbConnection, "show databases;")
testQuery
dbDisconnect(dbConnection)
