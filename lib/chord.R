# setwd("../Downloads/pums")
# 
# a <- readRDS("pa.rds")
# b <- readRDS("pb.rds")
# 
# colsToKeep <- c("FOD1P", "INDP")
# a <- a[colsToKeep]
# b <- b[colsToKeep]
# 
# c <- rbind(a,b)
# rm(a,b)
# saveRDS(c,"pop_degree_ind.rds")
c <- readRDS("pop_degree_ind.rds")
d <- na.omit(c)
rm(c)
# turns it into a table with columns being the Industry 
# and the rows being the Field of Degree.
# The cross between the two is the the "count". 
# For example, there are 230 people who had a Degree in 1100 and work in industry 0170.
e <- table(d$FOD1P,d$INDP)



g <- as.data.frame(e)
# Turns e into a data frame that looks like:
# Industry    Degree    Count
#   0170        1100    230
#   0180        1101    83


