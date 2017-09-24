library(pander)
library(tidyverse)
chess <- read.csv("https://raw.githubusercontent.com/TheFedExpress/Data/master/chess.txt", sep= "|", stringsAsFactors = FALSE, header = FALSE)
colnames(chess) <- c("Pairnum", "playerinfo", "total", "r1", "r2", "r3", "r4", "r5", "r6", "r7")
chess <- chess[,1:10]
class(chess)

chess_new <- chess[grepl(".+---.+",chess$Pairnum)==FALSE, 1:10]
rows <-nrow(chess_new)
chess_new$index <- 1:nrow(chess_new)
for (col in seq(1,10)){ 
  for (row in seq(2,rows,2)){ 
      chess_new[row,col] <-paste(chess_new[row-1, col], chess_new[row,col], sep = " ")
      }
  }
chess_new <- chess_new[chess_new$index%%2 == 0 & chess_new$index != 2,]
chess_new[,4:10] <- unlist(lapply(chess_new[,4:10], function(x) str_extract(x, "\\d{1,2}")))
chess_new$name <- unlist(lapply(chess_new$playerinfo, function(x) str_extract(x, "[[:alpha:]\\s\\-]+")))
chess_new$temp <- unlist(lapply(chess_new$playerinfo, function(x) str_replace_all(x, ' ', '')))
chess_new$rating_start <- unlist(lapply(chess_new$temp, function(x)  str_sub (str_extract(x, "R:\\d{1,}"),3)))
chess_new$rating_end <- unlist(lapply(chess_new$temp, function(x)  str_sub (str_extract(x, "->\\d{1,}"),3)))
chess_new[,4:10] <- lapply(chess_new[,4:10], function(x) as.integer(x))
chess_new[,4:10] <- lapply(chess_new[,4:10], function(x) chess_new$rating_start[x])
chess_new[,4:10] <- lapply(chess_new[,4:10], as.numeric)
chess_new$avg_opponent <- round(rowMeans(chess_new[,4:10], na.rm = TRUE))
chess_new$state <- unlist(lapply(chess_new$Pairnum, function(x) str_extract(x, "[[:alpha:]]+")))
chess_new$points <- as.numeric(unlist(lapply(chess_new$total, function(x) str_extract(x, "\\d+\\.\\d+"))))
chess_final <- chess_new[, c("name", "state", "points", "rating_start", "avg_opponent")]
row.names(chess_final) <- 1:nrow(chess_final)