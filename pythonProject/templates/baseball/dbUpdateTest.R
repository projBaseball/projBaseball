library(RMySQL)

args = commandArgs(trailingOnly = FALSE)
args

parameterStartPoint = 0
index = 0
for(index in 1:length(args))
{
  if(args[index] == "ok")
  {
    parameterStartPoint = index
  }
}
query = "insert into baseballModelLog(orderUniqueKey, orderResult) value('"
query = paste(query, args[parameterStartPoint + 1], sep = "")
query = paste(query, "','", sep = "")
query = paste(query, args[parameterStartPoint + 2], sep = "")
query = paste(query, "');")
dbConnection = dbConnect(dbDriver("MySQL"), host = "lamb.kangnam.ac.kr", dbname = "stories2", user = "stories2", password = "toortoor%^%")
dbResult <- dbGetQuery(dbConnection, query)
dbDisconnect(dbConnection)
