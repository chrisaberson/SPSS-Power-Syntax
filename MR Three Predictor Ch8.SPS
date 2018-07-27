
MATRIX DATA VARIABLES = ROWTYPE_  Intention Internal External Modern.
BEGIN DATA
Mean 1 2 3 4
STDEV 7 1 1 2
N 110 110 110 110
Corr 1
Corr .40 1 
Corr .40 -.15  1
Corr -.40 -.60 .25 1
END DATA. 	

MANOVA Intention with Internal External Modern 
/MATRIX=IN(*)
/power exact t (.05) F (.05) 
/CINTERVAL Joint (.95)
/DESIGN. 
