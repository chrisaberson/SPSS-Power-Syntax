*** Four Predictors

MATRIX DATA VARIABLES = ROWTYPE_  dv IV1 IV2 IV3 IV4.
BEGIN DATA
Mean 1 2 3 4 5 6
STDEV 7 1 1 2 3
N 10 10 10 10 10 
Corr 1
Corr .40 1 
Corr .40 -.15  1
Corr -.40 -.60 .25 1
Corr -.30 -.20 .35  .20 1
END DATA. 	

MANOVA dv with IV1 IV2 IV3 IV4
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/DESIGN. 

*** Five Predictors


MATRIX DATA VARIABLES = ROWTYPE_  dv IV1 IV2 IV3 IV4 IV5.
BEGIN DATA
Mean 1 2 3 4 5 6
STDEV 7 1 1 2 3 4
N 10 10 10 10 10 10
Corr 1
Corr .40 1 
Corr .40 -.15  1
Corr -.40 -.60 .25 1
Corr -.30 -.20 .35  .20 1
Corr -.20 -.10 .45  .05  .10 1
END DATA. 	

MANOVA dv with IV1 IV2 IV3 IV4 IV5
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/DESIGN. 

*** Six or more predictors... simply add variables as above