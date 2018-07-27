***MANOVA 

MATRIX DATA VARIABLES Condition rowtype_ implicit stereotype anxiety liking
/Factor = Condition.

BEGIN DATA
1 Mean 0.0 1.0 2.4 -0.7
1 N 40 40 40 40
2 Mean -0.25 -2.0 2.0 -1.0 
2 N 40 40 40 40
. Corr 1
. Corr .1 1 
. Corr .1 .35 1
. Corr .1 .45 .40 1
. Stdev 0.40 5.0 1.6 1.2
END DATA.

MANOVA implicit stereotype anxiety liking
by Condition (1,2)
 /MATRIX=IN(*)
 /POWER F (.05) t (.05)
 /PRINT signif (mult averf) param(estim efsize).
