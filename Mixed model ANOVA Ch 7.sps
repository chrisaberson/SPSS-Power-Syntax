****Mixed Model ANOVA

MATRIX DATA VARIABLES = Condition ROWTYPE_  pre post twohr sixhr
/Factor = Condition.
BEGIN DATA
1 Mean -0.25 0.00 0.10 0.15
1 N 50 50 50 50
2 Mean -0.25 -0.25 -0.25 -0.25
2 N 50 50 50 50
. Corr 1
. Corr .5 1 
. Corr .3 .5 1
. Corr .15 .3 .5 1
. STDEV 0.40 0.50 0.60 0.70
END DATA. 	


MANOVA pre post twohr sixhr by condition (1,2)
 /WSFACTOR = time(4) 
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /WSDESIGN = time.