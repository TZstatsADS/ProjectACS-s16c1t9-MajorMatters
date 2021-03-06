library(data.table)
library(dplyr)
library(splitstackshape)
library(car)
library(ggplot2)

setwd("~/Columbia University/Spring 2016/Data Science/csv_pus")

#extract necessary columns
colsToKeep <- c("FOD1P", "OCCP", "AGEP", "WAGP", "PWGTP")
data <- fread("ss13pusa.csv", select=colsToKeep )
datb <- fread("ss13pusb.csv", select=colsToKeep )

totaldat <- rbind(data, datb)

totaldat <- na.omit(totaldat)


#test matrix same as totaldat

totaldattest <- totaldat

#recode
cbind("OCC"=0, totaldattest)
totaldattest$OCC<-Recode(totaldattest$OCC,"10:430='MAN'; 500:950='BUS'; 1000:1240='COMP'; 1300:1560='ENG'; 1600:1965='SOCSci'; 2000:2060='SOCServ'; 2100:2160='LEGAL'; 2200:2550='EDU'; 2600:2960='ArtEnt'; 3000:3540='HEALTH'; 3600:4650='SERV'; 4700:4965='SALES'; 5000:5940='ADMIN'; 6000:7630='CONST'; 7700:9750='TRANS'; 9800:9999='MILT'")

cbind("FOD1Pcod"=0, totaldattest)
totaldattest$FOD1Pcod <- recode(totaldattest$FOD1P, "c(2100, 2101, 2102, 2105, 2106, 2107, 3700, 3701, 3702, 4005)='CS-MATH';
c(1100, 1101, 1102, 1103, 1104, 1105, 1106, 1199, 1301, 1302, 1303, 2201, 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3611, 3699, 4002,4006)='BIO-SCI'; 
                     c(5000, 5001, 5002, 5003, 5004, 5005, 5006, 5007, 5008, 5098, 5102)='PHYS-SCI'; 
            c(5200, 5201, 5202, 5203, 5205, 5206, 5299)='PSYCH';
                     c(1501, 4001, 4007, 5301, 5500, 5501, 5502, 5503, 5504, 5505, 5506, 5507, 5599)='SOC-SCI';
                     c(2400, 2401, 2402, 2403, 2404, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2412, 2413, 2414, 2415, 2416, 2417, 2418, 2419, 2499, 2500, 2501, 2502, 2503, 2504, 2599,5701)='ENG';
                     c(1401, 6100, 6102, 6103, 6104, 6105, 6106, 6107, 6108, 6109, 6110, 6199)='SCI-ENG';
                     c(5401, 5402, 5403, 5404, 6200, 6201, 6202, 6203, 6204, 6205, 6206, 6207, 6209, 6210, 6211, 6212, 6299)='BUS';
                     c(2300, 2301, 2303, 2304, 2305, 2306, 2307, 2308, 2309, 2310, 2311, 2312, 2313, 2314, 2399)='EDU';
                     c(2601, 2602, 2603, 3301, 3302)='LIT';
                     c(3401, 3402, 4801, 4901, 6402, 6403)='LIB-ART';
                     c(6000, 6001, 6002, 6003, 6004, 6005, 6006, 6007, 6099)='VIS-ART';
                     c(1901, 1902, 1903, 1904, 2001)='COMM';
                     c(4000)='MULTI';
                     c(2901, 3201, 3202, 3501, 3801, 4101, 5601, 5901)='OTHER'")
#to account for weights


totaldat.expanded <- expandRows(totaldattest, "PWGTP")



#Will be stacked barplot of major vs. industry
p=ggplot(data = totaldat.expanded, aes(x = totaldat.expanded$OCC, fill = totaldat.expanded$FOD1Pcod)) + 
  geom_bar()
cbPalette <- c('#a6cee3','#1f78b4','#b2df8a','#33a02c',"#984ea3","#a65628",'#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928','#ffffff')
p+labs(x='Occupational Categories', fill = 'Major Categories') + ggtitle("Majors vs. Industries")+ scale_fill_manual(values=cbPalette)

