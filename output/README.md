# Project: Major Matters

by Group 9 

### Research Questions
####To what extent does one's major determine his/her career?
#####To stay or to betray? That is a (serious) question.  

* Do people work in fields different from their college majors? How does this tendency vary across majors?  
Do certain fields favor certain majors? 
* Let's say, how many computer scientists have Bachelor’s Degrees in CS? <br /> *Income???*



### Preprocess Datasets

1. To account for survey weights, each observation is replicated the number of times specified in the **PWGTP** column. The expanded dataset is in the file totaldat.expanded.RDS.


2. Occupations Categories
 * Data: **OCCP** column (Occupation Code)
 * Categories assigned according to the code list released by U.S. Census Bureau
 * 16 Categories in total 


	Management Occupations               | Business and Financial Operations Occupations
	-------------------------------------| ---------------------------------------------------
	MGR-CHIEF EXECUTIVES AND LEGISLATORS | BUS-TRAINING AND DEVELOPMENT SPECIALISTS
	MGR-GENERAL AND OPERATIONS MANAGERS  | FIN-APPRAISERS AND ASSESSORS OF REAL ESTATE
	MGR-MARKETING AND SALES MANAGERS     | FIN-CREDIT ANALYSTS
	MGR-ADMINISTRATIVE SERVICES MANAGERS | FIN-FINANCIAL EXAMINERS
	...       ...       ...       ...    |...       ...       ...       ...       ...       ...


3. Major Categories

 * Data: **FOD1P** column (Field of Degree 1st Entry)
 * Classification standard comes from the U.S. Census Bureau 
 * 15 Categories in total 
 * We then track the outflow of majors into different occupations.


	Engineering                          | Education
	-------------------------------------| ---------------------------------------------------
	AEROSPACE ENGINEERING                | GENERAL EDUCATION
	BIOLOGICAL ENGINEERING               | ELEMENTARY EDUCATION
	ARCHITECTURAL ENGINEERING            | SPECIAL NEEDS EDUCATION
	BIOMEDICAL ENGINEERING               | ART AND MUSIC EDUCATION
	...       ...       ...       ...    |...       ...       ...       ...       ...       ...


### Visualization

#### BiPart Graph

<a href="http://localhost:8000/Desktop/cycle1-9/lib/BiPartie.html">![Screen Shot](https://raw.githubusercontent.com/TZstatsADS/cycle1-9/master/output/image/ScreenShot1.png?token=AKN9cU9GaFIwejKfkUzVaqLcxsGX9OY_ks5WuROFwA%3D%3D) </a>

![Screen Shot](https://raw.githubusercontent.com/TZstatsADS/cycle1-9/master/output/image/ScreenShot2.png?token=AKN9cShEtuC4-MfggxyMDMq-rLsKLkFXks5WuRaUwA%3D%3D)

#### Circular Graph

#### Histogram

![Screen Shot](https://raw.githubusercontent.com/TZstatsADS/cycle1-9/master/output/image/hist2.png?token=AKN9caexboNF0gwZqok1z65H0MYivr7Dks5WuqWTwA%3D%3D)

![Screen Shot](https://raw.githubusercontent.com/TZstatsADS/cycle1-9/master/output/image/hist.png?token=AKN9ccV9okD7KkPQ-0NELht_ZwPRLHq4ks5WunfCwA%3D%3D)



###T-test Result


![Screen Shot](https://raw.githubusercontent.com/TZstatsADS/cycle1-9/master/output/image/income.png?token=AKN9ccCULz1mkr6BFK03x9WnOrGitwQGks5WuqWVwA%3D%3D)


```
Welch Two Sample t-test
 
data:  wage.com and wage.non
t = 102.34, df = 1776000, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
7565.648 7861.103
sample estimates:
mean of x mean of y 
84165.30  76451.92
```

Therefore, the small p-value indicates that having a computer science related degree help to earn more.

###References
Major Classification Standard:[View Here](http://www.census.gov/prod/2012pubs/acsbr11-04a.pdf) <br />
Occupation Codelist and Classification:[Download Here](https://www.census.gov/people/io/files/2013 ACS 1-year and 2014 SIPP PUMS Occupation code list.xlsx)  <br />
Visualization Inspirations:[BiPartite](http://bl.ocks.ossrg/NPashaP/9796212)   <br />

most of the javascript coding credits to http://bl.ocks.org/NPashaP/9796212


###Coding Scripts
All coding scripts are located in folder lib. 

#THANK YOU
