*** 2 between one within

MATRIX DATA VARIABLES A B rowtype_ dv1 dv2 dv3 dv4
/Factor = A, B.
BEGIN DATA
1 1 Mean 0.25 0.00 0.10 0.15
1 1 N 50 50 50 50
1 2 Mean 0.25 0.25 0.25 0.25
1 2 N 50 50 50 50
2 1 Mean 0.50 0.25 0.10 0.15
2 1 N 50 50 50 50
2 2 Mean 0.75 0.50 0.25 0.25
2 2 N 50 50 50 50
. . Corr 1
. . Corr .5 1 
. . Corr .5 .5 1
. . Corr .5 .5 .5 1
. . STDEV 0.40 0.50 0.60 0.70
END DATA. 	

MANOVA dv1 dv2 dv3 dv4 by a, b (1,2)
 /WSFACTOR = time(4) 
 /MATRIX=IN(*)
 /power F (.05) t(.05) exact
 /print signif (mult averf) homogeneity (all) signif (AVERF HF GG EFSIZE)
 /WSDESIGN = time.