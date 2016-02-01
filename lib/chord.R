# setwd("../Downloads/pums")
# 
a <- readRDS("pa.rds")
b <- readRDS("pb.rds")
# 
colsToKeep <- c("FOD1P", "OCCP")
a <- a[colsToKeep]
b <- b[colsToKeep]
# 
c <- rbind(a,b)
rm(a,b)
saveRDS(c,"pop_degree_occp.rds")
c <- readRDS("pop_degree_occp.rds")
d <- na.omit(c)
rm(c)
# turns it into a table with columns being the Industry 
# and the rows being the Field of Degree.
# The cross between the two is the the "count". 
# For example, there are 230 people who had a Degree in 1100 and work in industry 0170.


# Recode(x,"10:430='MAN'; 500:950='BUS'; 1000:1240='COMP'; 1300:1560='ENG'; 1600:1965='SOCSci'; 2000:2060='SOCServ'; 2100:2160='LEGAL'; 2200:2550='EDU'; 2600:2960='ArtEnt'; 3000:3540='HEALTH';" )
d$OCCPcl<- Recode(d$OCCP,"10:430='MAN'; 500:950='BUS'; 1000:1240='COMP'; 1300:1560='ENG'; 1600:1965='SOCSci'; 2000:2060='SOCServ'; 2100:2160='LEGAL'; 2200:2550='EDU'; 2600:2960='ArtEnt'; 3000:3540='HEALTH'; 3600:4650='SERV'; 4700:4965='SALES'; 5000:5940='ADMIN'; 6000:7630='CONST'; 7700:9750='TRANS'; 9800:9999='MILT'")
d1 <- d[c("FOD1P","OCCPcl")]

e <- table(d1$FOD1P,d1$OCCPcl)
g <- as.data.frame(e)
# Turns e into a data frame that looks like:
# Industry    Degree    Count
#   0170        1100    230
#   0180        1101    83
h <- g[g$Freq != 0,]
write.csv(h,"bip_data.csv",row.names = F)
x = h$Var2

