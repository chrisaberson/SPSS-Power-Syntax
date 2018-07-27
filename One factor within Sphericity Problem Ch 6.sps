
*** Example with Sphericity Problem

MATRIX DATA VARIABLES = ROWTYPE_  pre post twoweek sixweek.
BEGIN DATA
Mean -0.25 0.00 0.10 0.15
STDEV 0.40 0.50 2.5 2.0
N 25 25 25 25
Corr 1
Corr .5 1 
Corr .3 .5 1
Corr .1 .3 .4 1
END DATA. 	


MANOVA pre post twoweek sixweek
 /WSFACTOR = time(4) 
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /WSDESIGN = time.
