*** Trend Analysis 


MATRIX DATA VARIABLES = Condition Rowtype_  pre post twohour sixhour
/Factor = Condition.

BEGIN DATA
1 Mean -0.25 -0.15 -0.05 0.05
1 N 50 50 50 50
2 Mean -0.25 -0.25 -0.25 -0.25
2 N 50 50 50 50
. Corr 1
. Corr .5 1 
. Corr .3 .5 1
. Corr .15 .3 .5 1
. STDEV 0.40 0.50 0.60 0.70
END DATA. 	

MANOVA pre post twohour sixhour by condition (1,2)
 /WSFACTOR = time(4) 
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /contrast (time) = polynomial
 /WSDESIGN = time.