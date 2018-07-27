
MATRIX DATA VARIABLES = ROWTYPE_  pre post.
BEGIN DATA
Mean 20 25
SD 5 5 
N 13 13
Corr 1
Corr .5 1 
END DATA. 	


MANOVA pre post 
/WSFACTOR = time(2) 
/MATRIX=IN(*)
/power  t (.05) F(.05) exact
/Print = Parameters (efsize)
/WSDESIGN = time.