library(data.table)
library(dplyr)
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:data.table':
## 
##     between, last
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
library(splitstackshape)
library(car)
library(ggplot2)

setwd("~/Desktop/2013-american-community-survey/pums")

#extract necessary columns
colsToKeep <- c("FOD1P", "OCCP", "AGEP", "WAGP", "PWGTP")
data <- fread("ss13pusa.csv", select=colsToKeep )
 

datb <- fread("ss13pusb.csv", select=colsToKeep )
totaldat <- rbind(data, datb)

totaldat <- na.omit(totaldat)



totaldattest <- totaldat

#recode
cbind("OCC"=0, totaldattest)

totaldattest$OCC<-Recode(totaldattest$OCC,"10:430='MAN'; 500:950='BUS'; 1000:1240='COMP'; 1300:1560='ENG'; 
                         1600:1965='SOCSci'; 2000:2060='SOCServ'; 2100:2160='LEGAL'; 2200:2550='EDU'; 
                         2600:2960='ArtEnt'; 3000:3540='HEALTH'; 3600:4650='SERV'; 4700:4965='SALES'; 
                         5000:5940='ADMIN'; 6000:7630='CONST'; 7700:9750='TRANS'; 9800:9999='MILT'")

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


computer=c(2100,2101,2102,2105,2106,2017,3700,3701,3702,4005)
#select observations with occupations in the cs fileds
computers=totaldat.expanded[totaldat.expanded$OCC=='COMP']
computers.com=computers[computers$FOD1Pcod=='CS-MATH']
computers.non=computers[computers$FOD1Pcod!='CS-MATH']

#select wage
wage.com=computers.com$WAGP
wage.non=computers.non$WAGP

#do t-test
t.test(wage.com,wage.non)
## 
##  Welch Two Sample t-test
## 
## data:  wage.com and wage.non
## t = 102.34, df = 1776000, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  7565.648 7861.103
## sample estimates:
## mean of x mean of y 
##  84165.30  76451.92
boxplot(wage.com,wage.non,names=c('computer-related','non_computer'),ylab='wage')
