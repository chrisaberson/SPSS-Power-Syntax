** One Factor Within

MATRIX DATA VARIABLES = ROWTYPE_  pre post twohr sixhr.
BEGIN DATA
Mean -0.25 0.00 0.10 0.15
STDEV 0.40 0.50 0.60 0.70
N 25 25 25 25
Corr 1
Corr .5 1 
Corr .3 .5 1
Corr .15 .3 .5 1
END DATA. 	


MANOVA pre post twohr sixhr
 /WSFACTOR = time(4) 
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact 
 /print signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /WSDESIGN = time.
