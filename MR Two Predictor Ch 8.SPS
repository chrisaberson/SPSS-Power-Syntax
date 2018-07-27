MATRIX DATA VARIABLES = ROWTYPE_  Intention Internal External.
BEGIN DATA
Mean 1 2 3 
STDEV 7 1 1 
N 30 30 30
Corr 1
Corr .40 1 
Corr .40 -.15  1
END DATA. 	

MANOVA  Intention with Internal External
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/Print = param(all)
/DESIGN. 