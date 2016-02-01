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
d$OCCPcl<- Recode(d$OCCP,"10:430='Management'; 500:950='Business and Financial Operations'; 1000:1240='Computer and mathematical occupations'; 1300:1560='Engineering and Architecture'; 1600:1965='Life, Physical, and Social Science Occupations'; 2000:2060='Community and Social Service'; 2100:2160='Legal'; 2200:2550='Education, Training, and Library Occupations'; 2600:2960='Arts, Design, Entertainment, Sports, and Media'; 3000:3540='Healthcare Practitioners and Technical Occupations'; 3600:4650='Service Occupations'; 4700:4965='Sales and Related Occupations'; 5000:5940='Office and Administrative Support'; 6000:7630='Natural Resources, Construction, and Maintenance'; 7700:9750='Production, Transportation, and Material Moving'; 9800:9999='Military Specific'")
d1 <- d[c("FOD1P","OCCPcl")]

d1$FOD1Pcl <- recode(d$FOD1P, "c(2100, 2101, 2102, 2105, 2106, 2107, 3700, 3701, 3702, 4005)='Computers and Math';
c(1100, 1101, 1102, 1103, 1104, 1105, 1106, 1199, 1301, 1302, 1303, 2201, 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3611, 3699, 4002,4006)='Biological Science'; 
                     c(5000, 5001, 5002, 5003, 5004, 5005, 5006, 5007, 5008, 5098, 5102)='Physical Sciences'; 
            c(5200, 5201, 5202, 5203, 5205, 5206, 5299)='Psychology';
                     c(1501, 4001, 4007, 5301, 5500, 5501, 5502, 5503, 5504, 5505, 5506, 5507, 5599)='Social science';
                     c(2400, 2401, 2402, 2403, 2404, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2415, 2416, 2417, 2418, 2419, 2499, 2500, 2501, 2502, 2503, 2504, 2599,5701)='Engineering';
                     c(1401, 6100, 6102, 6103, 6104, 6105, 6106, 6107, 6108, 6109, 6110, 6199)='Science and Engineering related';
                     c(5401, 5402, 5403, 5404, 6200, 6201, 6202, 6203, 6204, 6205, 6206, 6207, 6209, 6210, 6211, 6212, 6299)='Business';
                     c(2300, 2301, 2303, 2304, 2305, 2306, 2307, 2308, 2309, 2310, 2311, 2312, 2313, 2314, 2399)='Education';
                     c(2601, 2602, 2603, 3301, 3302)='Literature';
                     c(3401, 3402, 4801, 4901, 6402, 6403)='Liberal Arts';
                     c(6000, 6001, 6002, 6003, 6004, 6005, 6006, 6007, 6099)='Visual Arts';
                     c(1901, 1902, 1903, 1904, 2001)='Communication';
                     c(4000)='Multidisciplinary studies';
                     c(2901, 3201, 3202, 3501, 3801, 4101, 5601, 5901)='Other fields'")

e <- table(d1$FOD1Pcl,d1$OCCPcl)
g <- as.data.frame(e)
# Turns e into a data frame that looks like:
# Industry    Degree    Count
#   0170        1100    230
#   0180        1101    83
h <- g[g$Freq != 0,]
write.csv(h,"bip_data_occ_deg.csv",row.names = F)
x = h$Var2

